extends Node

onready var TicTacToeBoard = $MarginContainer/CenterContainer/TicTacToeGrid

func ready():
	Board.reset()
	
func _on_ResetGridButton_pressed():
	$MarginContainer/DebugItems/StatusLabel.text = "Idle"
	Board.reset()
	self.TicTacToeBoard.init_grid()

func _on_ChangePlayerButton_pressed():
	if Board.game_state != Board.TicTacToeGameState.IN_PROGRESS:
		return
	
	if Board.round_state == Board.TicTacToeRoundState.IDLE or Board.round_state == Board.TicTacToeRoundState.PLAYER_2_PICKING:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Picking"
		Board.round_state = Board.TicTacToeRoundState.PLAYER_1_PICKING
	else:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Picking"
		Board.round_state = Board.TicTacToeRoundState.PLAYER_2_PICKING

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
