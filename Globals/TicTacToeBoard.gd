extends Node
class_name TTTState

# state vars
enum TTTGameState {
	IN_PROGRESS,
	PLAYER_1_WIN, # player
	PLAYER_2_WIN, # cpu
	TIE
}

enum TTTRoundState {
	PLAYER_1_PICKING,
	PLAYER_2_PICKING,
	IDLE
}

var board = [0,0,0,0,0,0,0,0,0]
var game_state: int = TTTGameState.IN_PROGRESS
var round_state: int = TTTRoundState.IDLE
var turns = 0

# Scene to return to after picking a square
var return_to: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset():
	board = [0,0,0,0,0,0,0,0,0]
	game_state = TTTGameState.IN_PROGRESS
	round_state = TTTRoundState.IDLE
	turns = 0
