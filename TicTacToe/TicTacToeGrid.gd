extends Node

# state vars
enum TicTacToeState {
	IN_PROGRESS,
	PLAYER_1_WIN, # player
	PLAYER_2_WIN, # cpu
	TIE
}

enum RoundState {
	PLAYER_1_PICKING,
	PLAYER_2_PICKING,
	IDLE
}

signal onPlayer_1_win
signal onPlayer_2_win
signal onTie

var game_state = TicTacToeState.IN_PROGRESS
var round_state = RoundState.IDLE
var turns = 0

var player_1_value = 1
var player_2_value = 10

var board = []

export(Texture) var x_image
export(Texture) var o_image

# Called when the node enters the scene tree for the first time.
func _ready():
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	# Link all the buttons to the common Pressed handler
	for i in buttons.size():
		if Deck.player1_win == true and Deck.player2_win == false:
			buttons[i].connect("pressed", self, "on_grid_button_pressed", [buttons[i], i])
		elif Deck.player2_win == true and Deck.player1_win == false:
			var index = cpu_pick_square()
			buttons[index].connect("pressed", self, 'on_grid_button_pressed', [buttons[index], index])	
		
	self.reset_grid()

func on_grid_button_pressed(button, position):	
	
	if turns == 9:
		self.emit_signal("onTie")
		self.game_state = TicTacToeState.TIE
		self.round_state = RoundState.IDLE
		
	var grid_squares = $TextureLayer/TextureGridContainer.get_children()
	
	if self.round_state == self.RoundState.PLAYER_1_PICKING:
		# Disable the square's button
		button.disabled = true
		turns += 1
		
		# Set the square to an X
		grid_squares[position].set_texture(x_image)
		grid_squares[position].expand = true
		
		# Add the x to the board value array
		board[position] = player_1_value
		
		if self.check_for_win(0):
			self.emit_signal("onPlayer_1_win")
			self.game_state = TicTacToeState.PLAYER_1_WIN
			self.round_state = RoundState.IDLE
			
	elif self.round_state == self.RoundState.PLAYER_2_PICKING:
		# Disable the square's button
		button.disabled = true
		turns += 1
		
		grid_squares[position].set_texture(o_image)
		grid_squares[position].expand = true
		
		board[position] = player_2_value
		
		if self.check_for_win(1):
			self.emit_signal("onPlayer_2_win")
			self.game_state = TicTacToeState.PLAYER_2_WIN
			self.round_state = RoundState.IDLE
			return
	
func cpu_pick_square() -> int:
	var row_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var row_vertical = [[0, 3, 6], [1,4,7], [2,5,8]]
	var row_diagonal = [[0,4,8], [2,4,6]]
	
	var win_sum = 0
	var block_sum = 0
	var square_value
	
	if self.round_state == RoundState.PLAYER_1_PICKING:
		win_sum = 2
		block_sum = 20
		square_value = 1
	else:
		win_sum = 20
		block_sum = 2
		square_value = 10
	
	for row_sequence_list in [row_horizontal, row_vertical, row_diagonal]:
		for sequence in row_sequence_list:
			var sequence_values = [sequence[0], sequence[1], sequence[2]]
			var sequence_sum = sequence[0] + sequence[1] + sequence[2]
			
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
			var sequence_sum = board[sequence[0]] + board[sequence[1]] + board[sequence[2]]
			if sequence_sum == win_sum:
				return true

	return false
		
func reset_grid():	
	var buttons = $ButtonLayer/TicTacToeGrid.get_children()
	
	for button in buttons:
		button.disabled = false
		
	var image_squares = $TextureLayer/TextureGridContainer.get_children()
	for square in image_squares:
		square.texture = null
	
	board = [0,0,0,0,0,0,0,0,0]
	turns = 0
	
	self.game_state = TicTacToeState.IN_PROGRESS
	self.round_state = RoundState.IDLE
