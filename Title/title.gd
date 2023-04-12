extends Node

# app semver
var version = "0.1.0"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$"MarginContainer/MainMenuContainer/Version Label".text = "Version %s" % version

func _on_StartButtonCard_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
	Transit.change_scene("res://Player/PlayerCard.tscn")


func _on_OptionsButtonCard_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
	Transit.change_scene("res://Options/Options.tscn")
