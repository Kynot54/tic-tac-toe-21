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

func _on_MakeCPUMoveButton_pressed():
	self.TicTacToeBoard.cpu_pick_square()

func _on_TicTacToeGrid_onPlayer_1_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Wins!"


func _on_TicTacToeGrid_onPlayer_2_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Wins!"

func _on_TicTacToeGrid_onTie():
	$MarginContainer/DebugItems/StatusLabel.text = "Tie :("


func _on_BackButton_pressed():
	Transit.change_scene("res://Title/Main.tscn")
