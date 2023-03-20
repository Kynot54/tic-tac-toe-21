extends Node
class_name TicTacToeSceneState

# state vars
enum TicTacToeGameState {
	IN_PROGRESS,
	PLAYER_1_WIN, # player
	PLAYER_2_WIN, # cpu
	TIE
}

enum TicTacToeRoundState {
	PLAYER_1_PICKING,
	PLAYER_2_PICKING,
	IDLE
}

var board = [0,0,0,0,0,0,0,0,0]
var game_state: int = TicTacToeGameState.IN_PROGRESS
var round_state: int = TicTacToeRoundState.IDLE
var turns = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset():
	board = [0,0,0,0,0,0,0,0,0]
	game_state = TicTacToeGameState.IN_PROGRESS
	round_state = TicTacToeRoundState.IDLE
	turns = 0
