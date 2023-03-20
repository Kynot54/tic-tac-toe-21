extends Node
class_name TicTacToeGrid

signal onPlayer_1_win
signal onPlayer_2_win
signal onTie

var player_1_value = 1
var player_2_value = 10

export(Texture) var x_image
export(Texture) var o_image

# Called when the node enters the scene tree for the first time.
func _ready():
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	# Link all the buttons to the common Pressed handler
	for i in buttons.size():
		buttons[i].connect("pressed", self, "on_grid_button_pressed", [buttons[i], i])
	
	self.init_grid()

func on_grid_button_pressed(button, position):	
	
	var grid_squares = $TextureLayer/TextureGridContainer.get_children()
	
	if Board.round_state == Board.TicTacToeRoundState.PLAYER_1_PICKING:
		# Disable the square's button
		button.disabled = true
		Board.turns += 1
		
		# Set the square to an X
		grid_squares[position].set_texture(x_image)
		grid_squares[position].expand = true
		
		# Add the x to the board value array
		Board.board[position] = player_1_value
		
		if self.check_for_win(0):
			self.emit_signal("onPlayer_1_win")
			Board.game_state = Board.TicTacToeGameState.PLAYER_1_WIN
			Board.round_state = Board.TicTacToeRoundState.IDLE
	elif Board.round_state == Board.TicTacToeRoundState.PLAYER_2_PICKING:
		# Disable the square's button
		button.disabled = true
		Board.turns += 1
		
		# Set the square to an O
		grid_squares[position].set_texture(o_image)
		grid_squares[position].expand = true
		
		# Add the o to the board value array
		Board.board[position] = player_2_value
		
		if self.check_for_win(1):
			self.emit_signal("onPlayer_2_win")
			Board.game_state = Board.TicTacToeGameState.PLAYER_2_WIN
			Board.round_state = Board.TicTacToeRoundState.IDLE
	
	if Board.turns == 9:
		self.emit_signal("onTie")
		Board.game_state = Board.TicTacToeGameState.TIE
		Board.round_state = Board.TicTacToeRoundState.IDLE
	

func cpu_pick_square():
	# Don't pick a square if the game is over
	if Board.game_state != Board.TicTacToeGameState.IN_PROGRESS:
		return
		
	# if there's no squares left and the game is still in progress, the game is a tie
	if Board.turns == 9:
		self.emit_signal("onTie")
		Board.game_state = Board.TicTacToeGameState.TIE
		Board.round_state = Board.TicTacToeRoundState.IDLE
		
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	
	var row_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var row_vertical = [[0, 3, 6], [1,6,7], [2,5,8]]
	var row_diagonal = [[0,4,8], [2,4,6]]
	
	var win_sum = 0
	var block_sum = 0
	var square_value
	
	if Board.round_state == Board.TicTacToeRoundState.PLAYER_1_PICKING:
		win_sum = 2
		block_sum = 20
		square_value = 1
	else:
		win_sum = 20
		block_sum = 2
		square_value = 10
	
	
	
	for row_sequence_list in [row_horizontal, row_vertical, row_diagonal]:
		for sequence in row_sequence_list:
			var sequence_values = [Board.board[sequence[0]], Board.board[sequence[1]], Board.board[sequence[2]]]
			var sequence_sum = Board.board[sequence[0]] + Board.board[sequence[1]] + Board.board[sequence[2]]
			
			# if this move will make selected player win
			if sequence_sum == win_sum:
				var pos = sequence_values.find(0)
				Board.board[sequence[pos]] = square_value
				buttons[sequence[pos]].emit_signal("pressed")
			
			
			if self.check_for_win(0):
				self.emit_signal("onPlayer_1_win")
				Board.game_state = Board.TicTacToeGameState.PLAYER_1_WIN
				Board.round_state = Board.TicTacToeRoundState.IDLE
				return
			elif self.check_for_win(1):
				self.emit_signal("onPlayer_2_win")
				Board.game_state = Board.TicTacToeGameState.PLAYER_2_WIN
				Board.round_state = Board.TicTacToeRoundState.IDLE
				return
				
			# if this move will block a player win
			elif sequence_sum == block_sum:
				var pos = sequence_values.find(0)
				Board.board[sequence[pos]] = 10
				buttons[sequence[pos]].emit_signal("pressed")
				
				return
		
	var open_squares = []
	for i in range(0,9):
		if Board.board[i] == 0:
			open_squares.append(i)
				
	var move = randi() % open_squares.size()
	var move_pos = open_squares[move]
	Board.board[move_pos] = 10
	buttons[move_pos].emit_signal("pressed")
	
	Board.turns += 1

func check_for_win(player: int):
	var win_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var win_vertical = [[0, 3, 6], [1,6,7], [2,5,8]]
	var win_diagonal = [[0,4,8], [2,4,6]]
	
	var win_sum = -1
	if player == 0:
		win_sum = 3
	else:
		win_sum = 30
	for win_sequence_list in [win_horizontal, win_vertical, win_diagonal]:
		for sequence in win_sequence_list:
			var sequence_sum = Board.board[sequence[0]] + Board.board[sequence[1]] + Board.board[sequence[2]]
			if sequence_sum == win_sum:
				return true
	
	return false

func init_grid():
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	var image_squares = $TextureLayer/TextureGridContainer.get_children()
	
	for i in range(buttons.size()):
		if Board.board[i] != 0:
			buttons[i].disabled = true
		else:
			buttons[i].disabled = false
	
	for i in range(buttons.size()):
		if Board.board[i] == 1:
			image_squares[i].texture = x_image
		elif Board.board[i] == 10:
			image_squares[i].texture = o_image
		else:
			image_squares[i].texture = null
			
