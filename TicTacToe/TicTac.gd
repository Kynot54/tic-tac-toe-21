extends Node

onready var TicTacToeBoard = $MarginContainer/CenterContainer/TicTacToeGrid

func _ready():
	self.TicTacToeBoard.reset_grid()
	if Deck.player1_win == true:
		player_move()
	elif Deck.player2_win == true:
		ai_move()

func player_move():
#	if self.TicTacToeBoard.game_state != self.TicTacToeBoard.TicTacToeState.IN_PROGRESS:
#		return
	self.TicTacToeBoard.round_state = TicTacToeBoard.RoundState.PLAYER_1_PICKING
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Picking"

func ai_move():
#	if self.TicTacToeBoard.game_state != self.TicTacToeBoard.TicTacToeState.IN_PROGRESS:
#		return
	self.TicTacToeBoard.round_state = TicTacToeBoard.RoundState.PLAYER_2_PICKING
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Picking"
	var cpu_move = $MarginContainer/CenterContainer/TicTacToeGrid.cpu_pick_square()
	
	yield(get_tree().create_timer(2), "timeout")
	$MarginContainer/CenterContainer/TicTacToeGrid.select_square(cpu_move)
	

func _on_TicTacToeGrid_onPlayer_1_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Wins!"

func _on_TicTacToeGrid_onPlayer_2_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Wins!"

func _on_TicTacToeGrid_onTie():
	$MarginContainer/DebugItems/StatusLabel.text = "Tie :("
