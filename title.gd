extends Node



# app semver
var version = "0.0.1"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$"MarginContainer/MainMenuContainer/Version Label".text = "Version %s" % version
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButtonCard_pressed():
	OS.alert("Start Button Pressed", "_on_StartButtonCard_pressed()")


func _on_OptionsButtonCard_pressed():
	OS.alert("Options Button Pressed", "_on_OptionsButtonCard_pressed()")
