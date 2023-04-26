extends Node

var player_score = 0
var dealer_score = 0
var player_win = false
var end = false
var new_round = true
var previewing_deck = false


## Reset the hands of the player and the dealer
## Does not reset the game state
func reset_hands():
	player_score = 0
	dealer_score = 0

## Reset all state vars to init
func reset():
	player_score = 0
	dealer_score = 0
	player_win = false
	end = false
	new_round = true
