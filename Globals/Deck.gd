extends Node

const CARD_DECK = [
	#Clovers
	{
		"rank": "2",
		"suit": "Clovers",
		"value": 2,
		"sprite": "res://Assets/Cards/Clovers_2_white.png"
	},
	{
		"rank": "3",
		"suit": "Clovers",
		"value": 3,
		"sprite": "res://Assets/Cards/Clovers_3_white.png"
	},
	{
		"rank": "4",
		"suit": "Clovers",
		"value": 4,
		"sprite": "res://Assets/Cards/Clovers_4_white.png"
	},
	{
		"rank": "5",
		"suit": "Clovers",
		"value": 5,
		"sprite": "res://Assets/Cards/Clovers_5_white.png"
	},
	{
		"rank": "6",
		"suit": "Clovers",
		"value": 6,
		"sprite": "res://Assets/Cards/Clovers_6_white.png"
	},
	{
		"rank": "7",
		"suit": "Clovers",
		"value": 7,
		"sprite": "res://Assets/Cards/Clovers_7_white.png"
	},
	{
		"rank": "8",
		"suit": "Clovers",
		"value": 8,
		"sprite": "res://Assets/Cards/Clovers_8_white.png"
	},
	{
		"rank": "9",
		"suit": "Clovers",
		"value": 9,
		"sprite": "res://Assets/Cards/Clovers_9_white.png"
	},
	{
		"rank": "10",
		"suit": "Clovers",
		"value": 10,
		"sprite": "res://Assets/Cards/Clovers_10_white.png"
	},
	{
		"rank": "Jack",
		"suit": "Clovers",
		"value": 10,
		"sprite": "res://Assets/Cards/Clovers_Jack_white.png"
	},
	{
		"rank": "Queen",
		"suit": "Clovers",
		"value": 10,
		"sprite": "res://Assets/Cards/Clovers_Queen_white.png"
	},
	{
		"rank": "King",
		"suit": "Clovers",
		"value": 10,
		"sprite": "res://Assets/Cards/Clovers_King_white.png"
	},
	{
		"rank": "Ace",
		"suit": "Clovers",
		"value": 11,
		"sprite": "res://Assets/Cards/Clovers_A_white.png"
	},
	#Hearts
	{"rank": "2", "suit": "Hearts", "value": 2, "sprite": "res://Assets/Cards/Hearts_2_white.png"},
	{"rank": "3", "suit": "Hearts", "value": 3, "sprite": "res://Assets/Cards/Hearts_3_white.png"},
	{"rank": "4", "suit": "Hearts", "value": 4, "sprite": "res://Assets/Cards/Hearts_4_white.png"},
	{"rank": "5", "suit": "Hearts", "value": 5, "sprite": "res://Assets/Cards/Hearts_5_white.png"},
	{"rank": "6", "suit": "Hearts", "value": 6, "sprite": "res://Assets/Cards/Hearts_6_white.png"},
	{"rank": "7", "suit": "Hearts", "value": 7, "sprite": "res://Assets/Cards/Hearts_7_white.png"},
	{"rank": "8", "suit": "Hearts", "value": 8, "sprite": "res://Assets/Cards/Hearts_8_white.png"},
	{"rank": "9", "suit": "Hearts", "value": 9, "sprite": "res://Assets/Cards/Hearts_9_white.png"},
	{
		"rank": "10",
		"suit": "Hearts",
		"value": 10,
		"sprite": "res://Assets/Cards/Hearts_10_white.png"
	},
	{
		"rank": "Jack",
		"suit": "Hearts",
		"value": 10,
		"sprite": "res://Assets/Cards/Hearts_Jack_white.png"
	},
	{
		"rank": "Queen",
		"suit": "Hearts",
		"value": 10,
		"sprite": "res://Assets/Cards/Hearts_Queen_white.png"
	},
	{
		"rank": "King",
		"suit": "Hearts",
		"value": 10,
		"sprite": "res://Assets/Cards/Hearts_King_white.png"
	},
	{
		"rank": "Ace",
		"suit": "Hearts",
		"value": 11,
		"sprite": "res://Assets/Cards/Hearts_A_white.png"
	},
	#Spades
	{"rank": "2", "suit": "Spades", "value": 2, "sprite": "res://Assets/Cards/Pikes_2_white.png"},
	{"rank": "3", "suit": "Spades", "value": 3, "sprite": "res://Assets/Cards/Pikes_3_white.png"},
	{"rank": "4", "suit": "Spades", "value": 4, "sprite": "res://Assets/Cards/Pikes_4_white.png"},
	{"rank": "5", "suit": "Spades", "value": 5, "sprite": "res://Assets/Cards/Pikes_5_white.png"},
	{"rank": "6", "suit": "Spades", "value": 6, "sprite": "res://Assets/Cards/Pikes_6_white.png"},
	{"rank": "7", "suit": "Spades", "value": 7, "sprite": "res://Assets/Cards/Pikes_7_white.png"},
	{"rank": "8", "suit": "Spades", "value": 8, "sprite": "res://Assets/Cards/Pikes_8_white.png"},
	{"rank": "9", "suit": "Spades", "value": 9, "sprite": "res://Assets/Cards/Pikes_9_white.png"},
	{
		"rank": "10",
		"suit": "Spades",
		"value": 10,
		"sprite": "res://Assets/Cards/Pikes_10_white.png"
	},
	{
		"rank": "Jack",
		"suit": "Spades",
		"value": 10,
		"sprite": "res://Assets/Cards/Pikes_Jack_white.png"
	},
	{
		"rank": "Queen",
		"suit": "Spades",
		"value": 10,
		"sprite": "res://Assets/Cards/Pikes_Queen_white.png"
	},
	{
		"rank": "King",
		"suit": "Spades",
		"value": 10,
		"sprite": "res://Assets/Cards/Pikes_King_white.png"
	},
	{
		"rank": "Ace",
		"suit": "Spades",
		"value": 11,
		"sprite": "res://Assets/Cards/Pikes_A_white.png"
	},
	#Diamonds
	{"rank": "2", "suit": "Diamonds", "value": 2, "sprite": "res://Assets/Cards/Tiles_2_white.png"},
	{"rank": "3", "suit": "Diamonds", "value": 3, "sprite": "res://Assets/Cards/Tiles_3_white.png"},
	{"rank": "4", "suit": "Diamonds", "value": 4, "sprite": "res://Assets/Cards/Tiles_4_white.png"},
	{"rank": "5", "suit": "Diamonds", "value": 5, "sprite": "res://Assets/Cards/Tiles_5_white.png"},
	{"rank": "6", "suit": "Diamonds", "value": 6, "sprite": "res://Assets/Cards/Tiles_6_white.png"},
	{"rank": "7", "suit": "Diamonds", "value": 7, "sprite": "res://Assets/Cards/Tiles_7_white.png"},
	{"rank": "8", "suit": "Diamonds", "value": 8, "sprite": "res://Assets/Cards/Tiles_8_white.png"},
	{"rank": "9", "suit": "Diamonds", "value": 9, "sprite": "res://Assets/Cards/Tiles_9_white.png"},
	{
		"rank": "10",
		"suit": "Diamonds",
		"value": 10,
		"sprite": "res://Assets/Cards/Tiles_10_white.png"
	},
	{
		"rank": "Jack",
		"suit": "Diamonds",
		"value": 10,
		"sprite": "res://Assets/Cards/Tiles_Jack_white.png"
	},
	{
		"rank": "Queen",
		"suit": "Diamonds",
		"value": 10,
		"sprite": "res://Assets/Cards/Tiles_Queen_white.png"
	},
	{
		"rank": "King",
		"suit": "Diamonds",
		"value": 10,
		"sprite": "res://Assets/Cards/Tiles_King_white.png"
	},
	{
		"rank": "Ace",
		"suit": "Diamonds",
		"value": 11,
		"sprite": "res://Assets/Cards/Tiles_A_white.png"
	}
]

var player_hand = []
var dealer_hand = []
var deck: Array


func _ready():
	deck = CARD_DECK.duplicate()
	deck.shuffle()


## Reset the 21 game state to the initial state
func reset():
	deck = CARD_DECK.duplicate()
	deck.shuffle()
	player_hand.clear()
	dealer_hand.clear()
