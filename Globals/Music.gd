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

onready var se_player = $SEPlayer

var title_button_click = preload("res://Assets/Audio/SE/click1.ogg")
var twentyone_button_click = preload("res://Assets/Audio/SE/click2.ogg")
var tictactoe_button_click = preload("res://Assets/Audio/SE/click3.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	title_button_click.loop = false
	twentyone_button_click.loop = false
	tictactoe_button_click.loop = false
	
	pass # Replace with function body.

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
		
