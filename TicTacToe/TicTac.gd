extends Node

onready var TicTacToeBoard = $MarginContainer/CenterContainer/TicTacToeGrid

func _ready():
	self.TicTacToeBoard.init_grid()
	if Deck.player1_win == true:
		player_move()
	elif Deck.player2_win == true:
		ai_move()

func _on_ChangePlayerButton_pressed():
	if Board.game_state != Board.TicTacToeGameState.IN_PROGRESS:
		return
	
	if Board.round_state == Board.TicTacToeRoundState.IDLE or Board.round_state == Board.TicTacToeRoundState.PLAYER_2_PICKING:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Picking"
		Board.round_state = Board.TicTacToeRoundState.PLAYER_1_PICKING
	else:
		$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Picking"
		Board.round_state = Board.TicTacToeRoundState.PLAYER_2_PICKING

func player_move():
	Board.round_state = Board.TicTacToeRoundState.PLAYER_1_PICKING
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Picking"
	
	yield(self.TicTacToeBoard, "onSquareSelected")
	yield(get_tree().create_timer(2), "timeout")

func ai_move():
	Board.round_state = Board.TicTacToeRoundState.PLAYER_2_PICKING
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Picking"
	var cpu_move = $MarginContainer/CenterContainer/TicTacToeGrid.cpu_pick_square()
	
	yield(get_tree().create_timer(2), "timeout")
	#print("picking square %s" % cpu_move)
	$MarginContainer/CenterContainer/TicTacToeGrid.select_square(cpu_move)

func _on_TicTacToeGrid_onPlayer_1_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 1 Wins!"

func _on_TicTacToeGrid_onPlayer_2_win():
	$MarginContainer/DebugItems/StatusLabel.text = "Player 2 Wins!"

func _on_TicTacToeGrid_onTie():
	$MarginContainer/DebugItems/StatusLabel.text = "Tie :("


func _on_TicTacToeGrid_onSquareSelected():
	yield(get_tree().create_timer(2), "timeout")
	Transit.change_scene(Board.return_to)
