extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _transition_rect := $SceneTransitionRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	_transition_rect.transition_to("res://Title/Main.tscn")
