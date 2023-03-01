extends Node

onready var TicTacToeBoard = $MarginContainer/CenterContainer/TicTacToeGrid

func ready():
	self.TicTacToeBoard.reset_grid()
	
func _on_ResetGridButton_pressed():
	$MarginContainer/DebugItems/StatusLabel.text = "Idle"
	self.TicTacToeBoard.reset_grid()

func _on_ChangePlayerButton_pressed():
	if self.TicTacToeBoard.game_state != self.TicTacToeBoard.TicTacToeState.IN_PROGRESS:
		return
	
	if self.TicTacToeBoard.round_state == self.TicTacToeBoard.RoundState.IDLE or self.TicTacToeBoard.round_state == self.TicTacToeBoard.RoundState.PLAYER_2_PICKING:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Picking"
		self.TicTacToeBoard.round_state = self.TicTacToeBoard.RoundState.PLAYER_1_PICKING
	else:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Picking"
		self.TicTacToeBoard.round_state = self.TicTacToeBoard.RoundState.PLAYER_2_PICKING

func _on_MakeCPUMoveButton_pressed():
	self.TicTacToeBoard.cpu_pick_square()

func _on_TicTacToeGrid_onPlayer_1_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Wins!"


func _on_TicTacToeGrid_onPlayer_2_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Wins!"

func _on_TicTacToeGrid_onTie():
	$MarginContainer/DebugItems/StatusLabel.text = "Tie :("
