extends Node
## Plays Background Music and Sound Effects
## 	Owns several [AudioStreamPlayer]s in a global context so
## 	sound effects and music are played and not interrupted when changing
## 	scenes.
class_name BGM_SE_Player

## Type of button control, for choosing sound effects
enum ButtonType { TITLE_BUTTON, TWENTYONE_BUTTON, TICTACTOE_BUTTON }

# AudioStreamPlayers used to play BGM and SE
onready var _bgm_player = $BGMPlayer
onready var _se_player = $SEPlayer

# sound effect files
var _title_button_click = preload("res://Assets/Audio/SE/click1.ogg")
var _twentyone_button_click = preload("res://Assets/Audio/SE/click2.ogg")
var _tictactoe_button_click = preload("res://Assets/Audio/SE/click3.ogg")

## Volume of background music, in decibels
## if using a linear control to set/get (ex. [Slider]), convert
## the linear value to decibels with linear2db() or convert
## the decibel value to a linear value with db2linear().
var bgm_volume setget _set_bgm_volume, _get_bgm_volume

## Volume of sound effects, in decibels
## if using a linear control to set/get (ex. [Slider]), convert
## the linear value to decibels with linear2db() or convert
## the decibel value to a linear value with db2linear().
var se_volume setget _set_se_volume, _get_se_volume

# config file to persist settings
var _config = ConfigFile.new()


func _ready():
	# sound effects shouldn't loop
	_title_button_click.loop = false
	_twentyone_button_click.loop = false
	_tictactoe_button_click.loop = false

	# attempt to read from configfile
	var err = _config.load("user://config.cfg")

	# if config file doesn't exist, init to default values
	if err != OK:
		_config.set_value("audio", "bgm_volume_db", 0)
		_config.set_value("audio", "se_volume_db", 0)
		_config.save("user://config.cfg")

	# read values from config file
	_set_bgm_volume(_config.get_value("audio", "bgm_volume_db"))
	_set_se_volume(_config.get_value("audio", "se_volume_db"))


func _exit_tree():
	# save the config file to disk
	_config.save("user://config.cfg")


## Set bgm volume in decibels
## if using a slider to modify the volume, convert linear to
## decibels using linear2db()
func _set_bgm_volume(new_volume):
	print(new_volume)
	AudioServer.set_bus_volume_db(1, new_volume)
	_config.set_value("audio", "bgm_volume_db", new_volume)


## Returns bgm volume in decibels
## if using this value to set a slider's value,
## first call db2linear() on the returned value
func _get_bgm_volume():
	return _bgm_player.volume_db


## Set bgm volume in decibels
## if using a slider to modify the volume, convert linear to
## decibels using linear2db()
func _set_se_volume(new_volume):
	AudioServer.set_bus_volume_db(2, new_volume)
	_config.set_value("audio", "se_volume_db", new_volume)


## Returns bgm volume in decibels
## if using this value to set a slider's value,
## first call db2linear() on the returned value
func _get_se_volume():
	return _se_player.volume_db


## Play a button click sound effect
## Pass a value of ButtonType to play a certain sound effect,
## or nothing to play a default sound.
func play_button_click(button_type = null):
	match button_type:
		ButtonType.TITLE_BUTTON:
			_se_player.stream = _title_button_click
			_se_player.play()
		ButtonType.TWENTYONE_BUTTON:
			_se_player.stream = _twentyone_button_click
			_se_player.play()
		ButtonType.TICTACTOE_BUTTON:
			_se_player.stream = _tictactoe_button_click
			_se_player.play()
			_se_player.stream = _title_button_click
			_se_player.play()
