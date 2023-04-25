extends Node

export (int) var player_score = 0
export (int) var dealer_score = 0
export (bool) var player_hit = false
export (bool) var player1_win = false
export (bool) var player2_win = false
export (bool) var end = false
export (bool) var new_round = true

## Reset the hands of the player and the dealer
## Does not reset the game state
func reset_hands():
	player_score = 0
	dealer_score = 0
	player_hit = false
