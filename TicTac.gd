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

export var game_state = TicTacToeState.IN_PROGRESS
export var round_state = RoundState.IDLE
var player_1_squares = []
var player_2_squares = []
var turns = 0

onready var x_image = load("res://Assets/Images/red-o.png")
onready var o_image= load("res://Assets/Images/blue-x.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var buttons = $MarginContainer/CenterContainer/TicTacToeGrid.get_children()
	# Link all the buttons to the common Pressed handler
	for i in buttons.size():
		buttons[i].connect("pressed", self, "on_grid_button_pressed", [buttons[i], i])
	
	self.reset_grid()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_grid_button_pressed(button, position):	
	var grid_squares = $MarginContainer/CenterContainer/SquaresGridContainer.get_children()
	
	print(position)
	
	if self.round_state == RoundState.PLAYER_1_PICKING:
		button.disabled = true
		turns += 1
		grid_squares[position].set_texture(x_image)
		grid_squares[position].expand = true
		player_1_squares.append(position)
		
		if self.check_for_win(player_1_squares):
			$DebugItemsVBox/DEBUGChangePlayerButton.disabled = true
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Player 1 Win"
			self.game_state = TicTacToeState.PLAYER_1_WIN
			self.round_state = RoundState.IDLE
	elif self.round_state == RoundState.PLAYER_2_PICKING:
		button.disabled = true
		turns += 1
		grid_squares[position].set_texture(o_image)
		grid_squares[position].expand = true
		player_2_squares.append(position)
		
		if self.check_for_win(player_2_squares):
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.disabled = true
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Player 2 Win"
			self.game_state = TicTacToeState.PLAYER_2_WIN
			self.round_state = RoundState.IDLE
	
	if turns == 9:
		self.game_state = TicTacToeState.TIE
		self.round_state = RoundState.IDLE
	

func check_for_win(squares):
	var win_horizontal = [[0,1,2], [3,4,5], [6,7,8]]
	var win_vertical = [[0, 3, 6], [1,6,7], [2,5,8]]
	var win_diagonal = [[0,4,8], [2,4,6]]
	
	if squares.size() >= 3:
		for win_sequence_list in [win_horizontal, win_vertical, win_diagonal]:
			for sequence in win_sequence_list:
				if squares.has(sequence[0]) and squares.has(sequence[1]) and squares.has(sequence[2]):
					return true
	
	return false
		
func reset_grid():
	var buttons = $MarginContainer/CenterContainer/TicTacToeGrid.get_children()
	$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Idle (No Player Turn)"
	$DebugItemsVBox/DEBUGChangePlayerButton.disabled = false
	
	for button in buttons:
		button.disabled = false
		
		
	var image_squares = $MarginContainer/CenterContainer/SquaresGridContainer.get_children()
	for square in image_squares:
		square.texture = null
		
	player_1_squares = []
	player_2_squares = []
	
	self.game_state = TicTacToeState.IN_PROGRESS
	self.round_state = RoundState.IDLE

func _on_DEBUGChangePlayerButton_pressed():
	match self.round_state:
		RoundState.IDLE:
			self.round_state = RoundState.PLAYER_1_PICKING
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Player 1 Turn"
		RoundState.PLAYER_1_PICKING:
			self.round_state = RoundState.PLAYER_2_PICKING
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Player 2 Turn"
		RoundState.PLAYER_2_PICKING:
			self.round_state = RoundState.PLAYER_1_PICKING
			$DebugItemsVBox/DEBUGCurrentPlayerLabel.text = "Player 1 Turn"
	
	


func _on_DEBUGResetButton_pressed():
	self.reset_grid()
