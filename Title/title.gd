extends Node

# app semver
var version = "0.1.0"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"MarginContainer/MainMenuContainer/Version Label".text = "Version %s" % version

func _on_StartButtonCard_pressed():
	Transit.change_scene("res://Player/PlayerCard.tscn")


func _on_OptionsButtonCard_pressed():
	Transit.change_scene("res://Options/Options.tscn")
