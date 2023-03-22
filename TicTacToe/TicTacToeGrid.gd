extends Node
class_name TicTacToeGrid

# emitted when player 1 wins
signal onPlayer_1_win

# emitted when player 2 wins
signal onPlayer_2_win

# emitted on a tie
signal onTie

# emitted when a square is selected
signal onSquareSelected

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

# Marks a square with an X or an O, depending on self.round_state
func select_square(position):
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	var texture_squares = $TextureLayer/TextureGridContainer.get_children()
	
	match Board.round_state:
		Board.TicTacToeRoundState.PLAYER_1_PICKING:
			buttons[position].disabled = true
			Board.turns += 1
			
			# Set the square to an X
			texture_squares[position].set_texture(x_image)
			texture_squares[position].expand = true
			
			# Add the x to the board value array
			Board.board[position] = player_1_value
			
			if self.check_for_win(0):
				self.emit_signal("onPlayer_1_win")
				Board.game_state = Board.TicTacToeGameState.PLAYER_1_WIN
				Board.round_state = Board.TicTacToeRoundState.IDLE
			else:
				Board.round_state = Board.TicTacToeRoundState.IDLE
				self.emit_signal("onSquareSelected")
			
		Board.TicTacToeRoundState.PLAYER_2_PICKING:
			# Disable the square's button
			buttons[position].disabled = true
			Board.turns += 1
			
			texture_squares[position].set_texture(o_image)
			texture_squares[position].expand = true
			
			Board.board[position] = player_2_value
			
			if self.check_for_win(1):
				self.emit_signal("onPlayer_2_win")
				Board.game_state = Board.TicTacToeGameState.PLAYER_2_WIN
				Board.round_state = Board.TicTacToeRoundState.IDLE
				return
			else:
				Board.round_state = Board.TicTacToeRoundState.IDLE
				self.emit_signal("onSquareSelected")
	
	if Board.turns == 9:
		self.emit_signal("onTie")
		Board.game_state = Board.TicTacToeGameState.TIE
		Board.round_state = Board.TicTacToeRoundState.IDLE

func on_grid_button_pressed(_button, position):	
	self.select_square(position)
	
func cpu_pick_square() -> int:
	var row_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var row_vertical = [[0, 3, 6], [1,4,7], [2,5,8]]
	var row_diagonal = [[0,4,8], [2,4,6]]
	
	var win_sum = 0
	var block_sum = 0
	
	if Board.round_state == Board.TicTacToeRoundState.PLAYER_1_PICKING:
		win_sum = 2
		block_sum = 20
	else:
		win_sum = 20
		block_sum = 2
	
	for row_sequence_list in [row_horizontal, row_vertical, row_diagonal]:
		for sequence in row_sequence_list:
			var sequence_values = [Board.board[sequence[0]], Board.board[sequence[1]], Board.board[sequence[2]]]
			var sequence_sum = Board.board[sequence[0]] + Board.board[sequence[1]] + Board.board[sequence[2]]
			
			# if this move will make selected player win
			if sequence_sum == win_sum:
				var pos = sequence_values.find(0)
				return (sequence[pos])
			# if this move will block a player win
			elif sequence_sum == block_sum:
				var pos = sequence_values.find(0)
				return (sequence[pos])
	
	# If there isn't a move that will win or block a win, select a random open square
	var open_squares = []
	for i in range(Board.board.size()):
		if Board.board[i] == 0:
			open_squares.append(i)
			
	return open_squares[randi() % open_squares.size()]

func check_for_win(player: int):
	var win_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var win_vertical = [[0, 3, 6], [1,4,7], [2,5,8]]
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
	
	for i in range(Board.board.size()):
		if Board.board[i] != 0:
			buttons[i].disabled = true
		else:
			buttons[i].disabled = false
	
	for i in range(Board.board.size()):
		if Board.board[i] == 1:
			image_squares[i].texture = x_image
		elif Board.board[i] == 10:
			image_squares[i].texture = o_image
		else:
			image_squares[i].texture = null
			
