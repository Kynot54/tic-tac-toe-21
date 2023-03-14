extends Node

export var deck = [
	#Clovers
	{"rank" : "2", "suit": "Clovers", "value": 2, "sprite": "res://Cards/Clovers_2_white.png"},
	{"rank" : "3", "suit": "Clovers", "value": 3, "sprite": "res://Cards/Clovers_3_white.png"},
	{"rank" : "4", "suit": "Clovers", "value": 4, "sprite": "res://Cards/Clovers_4_white.png"},
	{"rank" : "5", "suit": "Clovers", "value": 5, "sprite": "res://Cards/Clovers_5_white.png"},
	{"rank" : "6", "suit": "Clovers", "value": 6, "sprite": "res://Cards/Clovers_6_white.png"},
	{"rank" : "7", "suit": "Clovers", "value": 7, "sprite": "res://Cards/Clovers_7_white.png"},
	{"rank" : "8", "suit": "Clovers", "value": 8, "sprite": "res://Cards/Clovers_8_white.png"},
	{"rank" : "9", "suit": "Clovers", "value": 9, "sprite": "res://Cards/Clovers_9_white.png"},
	{"rank" : "10", "suit": "Clovers", "value": 10, "sprite": "res://Cards/Clovers_10_white.png"},
	{"rank" : "Jack", "suit": "Clovers", "value": 10, "sprite": "res://Cards/Clovers_Jack_white.png"},
	{"rank" : "Queen", "suit": "Clovers", "value": 10, "sprite": "res://Cards/Clovers_Queen_white.png"},
	{"rank" : "King", "suit": "Clovers", "value": 10, "sprite": "res://Cards/Clovers_King_white.png"},
	{"rank" : "Ace", "suit": "Clovers", "value": 10, "sprite": "res://Cards/Clovers_A_white.png"},
	#Hearts
	{"rank" : "2", "suit": "Hearts", "value": 2, "sprite": "res://Cards/Hearts_2_white.png"},
	{"rank" : "3", "suit": "Hearts", "value": 3, "sprite": "res://Cards/Hearts_3_white.png"},
	{"rank" : "4", "suit": "Hearts", "value": 4, "sprite": "res://Cards/Hearts_4_white.png"},
	{"rank" : "5", "suit": "Hearts", "value": 5, "sprite": "res://Cards/Hearts_5_white.png"},
	{"rank" : "6", "suit": "Hearts", "value": 6, "sprite": "res://Cards/Hearts_6_white.png"},
	{"rank" : "7", "suit": "Hearts", "value": 7, "sprite": "res://Cards/Hearts_7_white.png"},
	{"rank" : "8", "suit": "Hearts", "value": 8, "sprite": "res://Cards/Hearts_8_white.png"},
	{"rank" : "9", "suit": "Hearts", "value": 9, "sprite": "res://Cards/Hearts_9_white.png"},
	{"rank" : "10", "suit": "Hearts", "value": 10, "sprite": "res://Cards/Hearts_10_white.png"},
	{"rank" : "Jack", "suit": "Hearts", "value": 10, "sprite": "res://Cards/Hearts_Jack_white.png"},
	{"rank" : "Queen", "suit": "Hearts", "value": 10, "sprite": "res://Cards/Hearts_Queen_white.png"},
	{"rank" : "King", "suit": "Hearts", "value": 10, "sprite": "res://Cards/Hearts_King_white.png"},
	{"rank" : "Ace", "suit": "Hearts", "value": 10, "sprite": "res://Cards/Hearts_A_white.png"},
	#Spades
	{"rank" : "2", "suit": "Spades", "value": 2, "sprite": "res://Cards/Pikes_2_white.png"},
	{"rank" : "3", "suit": "Spades", "value": 3, "sprite": "res://Cards/Pikes_3_white.png"},
	{"rank" : "4", "suit": "Spades", "value": 4, "sprite": "res://Cards/Pikes_4_white.png"},
	{"rank" : "5", "suit": "Spades", "value": 5, "sprite": "res://Cards/Pikes_5_white.png"},
	{"rank" : "6", "suit": "Spades", "value": 6, "sprite": "res://Cards/Pikes_6_white.png"},
	{"rank" : "7", "suit": "Spades", "value": 7, "sprite": "res://Cards/Pikes_7_white.png"},
	{"rank" : "8", "suit": "Spades", "value": 8, "sprite": "res://Cards/Pikes_8_white.png"},
	{"rank" : "9", "suit": "Spades", "value": 9, "sprite": "res://Cards/Pikes_9_white.png"},
	{"rank" : "10", "suit": "Spades", "value": 10, "sprite": "res://Cards/Pikes_10_white.png"},
	{"rank" : "Jack", "suit": "Spades", "value": 10, "sprite": "res://Cards/Pikes_Jack_white.png"},
	{"rank" : "Queen", "suit": "Spades", "value": 10, "sprite": "res://Cards/Pikes_Queen_white.png"},
	{"rank" : "King", "suit": "Spades", "value": 10, "sprite": "res://Cards/Pikes_King_white.png"},
	{"rank" : "Ace", "suit": "Spades", "value": 10, "sprite": "res://Cards/Pikes_A_white.png"},
	#Diamonds
	{"rank" : "2", "suit": "Diamonds", "value": 2, "sprite": "res://Cards/Tiles_2_white.png"},
	{"rank" : "3", "suit": "Diamonds", "value": 3, "sprite": "res://Cards/Tiles_3_white.png"},
	{"rank" : "4", "suit": "Diamonds", "value": 4, "sprite": "res://Cards/Tiles_4_white.png"},
	{"rank" : "5", "suit": "Diamonds", "value": 5, "sprite": "res://Cards/Tiles_5_white.png"},
	{"rank" : "6", "suit": "Diamonds", "value": 6, "sprite": "res://Cards/Tiles_6_white.png"},
	{"rank" : "7", "suit": "Diamonds", "value": 7, "sprite": "res://Cards/Tiles_7_white.png"},
	{"rank" : "8", "suit": "Diamonds", "value": 8, "sprite": "res://Cards/Tiles_8_white.png"},
	{"rank" : "9", "suit": "Diamonds", "value": 9, "sprite": "res://Cards/Tiles_9_white.png"},
	{"rank" : "10", "suit": "Diamonds", "value": 10, "sprite": "res://Cards/Tiles_10_white.png"},
	{"rank" : "Jack", "suit": "Diamonds", "value": 10, "sprite": "res://Cards/Tiles_Jack_white.png"},
	{"rank" : "Queen", "suit": "Diamonds", "value": 10, "sprite": "res://Cards/Tiles_Queen_white.png"},
	{"rank" : "King", "suit": "Diamonds", "value": 10, "sprite": "res://Cards/Tiles_King_white.png"},
	{"rank" : "Ace", "suit": "Diamonds", "value": 10, "sprite": "res://Cards/Tiles_A_white.png"}
]
func _ready():
	deck = shuffle_deck()
		
func shuffle_deck():
	# Using Richard Durstenfeld's version of the Fisher-Yates Shuffle
	for i in range(len(deck)-1):
		var rng = RandomNumberGenerator.new()
		var j = rng.randi_range(0,51)
		var temp = deck[i]
		deck[i] = deck[j]
		deck[j] = temp
		return deck
		
export (int) var player_score = 0
export (int) var dealer_score = 0
export (bool) var player_hit = false
export (bool) var player1_win = false
export (bool) var player2_win = false
export (bool) var end = false
export (bool) var new_round = true
export (Array, Dictionary) var player_hand = []
export (Array, Dictionary) var dealer_hand = []
