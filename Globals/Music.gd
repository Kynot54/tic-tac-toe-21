extends Node
## Plays Background Music and Sound Effects
## 	Owns several [AudioStreamPlayer]s in a global context so
## 	sound effects and music are played and not interrupted when changing
## 	scenes.
class_name BGM_SE_Player

enum ButtonType {
	TITLE_BUTTON,
	TWENTYONE_BUTTON,
	TICTACTOE_BUTTON
}

onready var bgm_player = $BGMPlayer
onready var se_player = $SEPlayer

var title_button_click = preload("res://Assets/Audio/SE/click1.ogg")
var twentyone_button_click = preload("res://Assets/Audio/SE/click2.ogg")
var tictactoe_button_click = preload("res://Assets/Audio/SE/click3.ogg")

# volumes are in decibels, use db2linear() to convert to a slider value
var bgm_volume setget set_bgm_volume, get_bgm_volume
var se_volume setget set_se_volume, get_se_volume

# config file to persist settings
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	title_button_click.loop = false
	twentyone_button_click.loop = false
	tictactoe_button_click.loop = false
	
	# attempt to read from configfile
	var err = config.load("user://config.cfg")
	
	if err != OK:
		config.set_value("audio", "bgm_volume_db", 0)
		config.set_value("audio", "se_volume_db", 0)
		config.save("user://config.cfg")
	
	set_bgm_volume(config.get_value("audio", "bgm_volume_db"))
	set_se_volume(config.get_value("audio", "se_volume_db"))

func _exit_tree():
	config.save("user://config.cfg")

## Set bgm volume in decibels
## if using a slider to modify the volume, convert linear to
## decibels using linear2db()
func set_bgm_volume(new_volume):
	bgm_player.volume_db = new_volume
	config.set_value("audio", "bgm_volume_db", new_volume)

## Returns bgm volume in decibels
## if using this value to set a slider's value,
## first call db2linear() on the returned value
func get_bgm_volume():
	return bgm_player.volume_db

## Set bgm volume in decibels
## if using a slider to modify the volume, convert linear to
## decibels using linear2db()
func set_se_volume(new_volume):
	se_player.volume_db = new_volume
	config.set_value("audio", "se_volume_db", new_volume)

## Returns bgm volume in decibels
## if using this value to set a slider's value,
## first call db2linear() on the returned value
func get_se_volume():
	return se_player.volume_db

func play_button_click(button_type):
	match button_type:
		ButtonType.TITLE_BUTTON:
			se_player.stream = title_button_click
			se_player.play()
		ButtonType.TWENTYONE_BUTTON:
			se_player.stream = twentyone_button_click
			se_player.play()
		ButtonType.TICTACTOE_BUTTON:
			se_player.stream = tictactoe_button_click
			se_player.play()
		_:
			se_player.stream = title_button_click
			se_player.play()
		
