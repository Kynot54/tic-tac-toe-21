extends Node
## Options scene
## Allows the user to set options including volume and difficulty
## Settings are persisted with a config file.

# slider ui elements
# !!! convert the value from linear to db first to avoid blowing up the player's speakers !!!
onready var bgm_slider = $MarginContainer/VBoxContainer/OptionsContainer/BGMSlider
onready var se_slider = $MarginContainer/VBoxContainer/OptionsContainer/SESlider

const DIFFICULTY_OPTIONS = ["Easy", "Medium", "Hard"]


func _ready():
	# Init the sliders with the values from the config file
	bgm_slider.value = db2linear(Music.bgm_volume)
	se_slider.value = db2linear(Music.se_volume)


# Returns to the title screen
func _on_Button_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
	Transit.change_scene("res://Title/Main.tscn")

# sets the BGM volume when the slider's value changes
func _on_BGMSlider_value_changed(value):
	Music.bgm_volume = linear2db(value)


# sets the SE volume when the slider's value changes
func _on_SESlider_value_changed(value):
	Music.se_volume = linear2db(value)
