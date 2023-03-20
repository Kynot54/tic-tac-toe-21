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

var game_state = TicTacToeState.IN_PROGRESS
var round_state = RoundState.IDLE
var turns = 0

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
	self.reset_grid()

# Marks a square with an X or an O, depending on self.round_state
func select_square(position):
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	var texture_squares = $TextureLayer/TextureGridContainer.get_children()
	
	match self.round_state:
		RoundState.PLAYER_1_PICKING:
			buttons[position].disabled = true
			turns += 1
			
			# Set the square to an X
			texture_squares[position].set_texture(x_image)
			texture_squares[position].expand = true
			
			# Add the x to the board value array
			board[position] = player_1_value
			
			if self.check_for_win(0):
				self.emit_signal("onPlayer_1_win")
				self.game_state = TicTacToeState.PLAYER_1_WIN
				self.round_state = RoundState.IDLE
			
		RoundState.PLAYER_2_PICKING:
			# Disable the square's button
			buttons[position].disabled = true
			turns += 1
			
			texture_squares[position].set_texture(o_image)
			texture_squares[position].expand = true
			
			board[position] = player_2_value
			
			if self.check_for_win(1):
				self.emit_signal("onPlayer_2_win")
				self.game_state = TicTacToeState.PLAYER_2_WIN
				self.round_state = RoundState.IDLE
				return
	

func on_grid_button_pressed(button, position):	
	
	if turns == 9:
		self.emit_signal("onTie")
		self.game_state = TicTacToeState.TIE
		self.round_state = RoundState.IDLE
		
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
	
func cpu_pick_square() -> int:
	var row_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var row_vertical = [[0, 3, 6], [1,4,7], [2,5,8]]
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
				pos = square_value
				return (sequence[pos])
			# if this move will block a player win
			elif sequence_sum == block_sum:
				var pos = sequence_values.find(0)
				pos = square_value
				return (sequence[pos])
	return 0

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
			
