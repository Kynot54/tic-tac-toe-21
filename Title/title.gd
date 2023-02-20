extends Node

# app semver
var version = "0.0.1"
onready var _transition_rect := $SceneTransitionRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$"MarginContainer/MainMenuContainer/Version Label".text = "Version %s" % version


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButtonCard_pressed():
	_transition_rect.transition_to("res://Player/PlayerCard.tscn")


func _on_OptionsButtonCard_pressed():
	_transition_rect.transition_to("res://Options/Options.tscn")
