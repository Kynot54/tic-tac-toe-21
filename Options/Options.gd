extends Node

onready var bgm_slider = $MarginContainer/VBoxContainer/OptionsContainer/BGMSlider
onready var se_slider = $MarginContainer/VBoxContainer/OptionsContainer/SESlider

func _ready():
	bgm_slider.value = db2linear(Music.bgm_volume)
	se_slider.value = db2linear(Music.se_volume)

func _on_Button_pressed():
	Transit.change_scene("res://Title/Main.tscn")


func _on_BGMSlider_value_changed(value):
	Music.bgm_volume = linear2db(value)


func _on_SESlider_value_changed(value):
	Music.se_volume = linear2db(value)


func _on_TestButton_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
