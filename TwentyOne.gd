extends Node
		
var deck = [
	#Clovers
	{"rank" : "2", "suit": "Clovers", "value": 2, "sprite": "res://sprites/Clovers_2_white.png"},
	{"rank" : "3", "suit": "Clovers", "value": 3, "sprite": "res://sprites/Clovers_3_white.png"},
	{"rank" : "4", "suit": "Clovers", "value": 4, "sprite": "res://sprites/Clovers_4_white.png"},
	{"rank" : "5", "suit": "Clovers", "value": 5, "sprite": "res://sprites/Clovers_5_white.png"},
	{"rank" : "6", "suit": "Clovers", "value": 6, "sprite": "res://sprites/Clovers_6_white.png"},
	{"rank" : "7", "suit": "Clovers", "value": 7, "sprite": "res://sprites/Clovers_7_white.png"},
	{"rank" : "8", "suit": "Clovers", "value": 8, "sprite": "res://sprites/Clovers_8_white.png"},
	{"rank" : "9", "suit": "Clovers", "value": 9, "sprite": "res://sprites/Clovers_9_white.png"},
	{"rank" : "10", "suit": "Clovers", "value": 10, "sprite": "res://sprites/Clovers_10_white.png"},
	{"rank" : "Jack", "suit": "Clovers", "value": 10, "sprite": "res://sprites/Clovers_Jack_white.png"},
	{"rank" : "Queen", "suit": "Clovers", "value": 10, "sprite": "res://sprites/Clovers_Queen_white.png"},
	{"rank" : "King", "suit": "Clovers", "value": 10, "sprite": "res://sprites/Clovers_King_white.png"},
	{"rank" : "Ace", "suit": "Clovers", "value": 10, "sprite": "res://sprites/Clovers_A_white.png"},
	#Hearts
	{"rank" : "2", "suit": "Hearts", "value": 2, "sprite": "res://sprites/Hearts_2_white.png"},
	{"rank" : "3", "suit": "Hearts", "value": 3, "sprite": "res://sprites/Hearts_3_white.png"},
	{"rank" : "4", "suit": "Hearts", "value": 4, "sprite": "res://sprites/Hearts_4_white.png"},
	{"rank" : "5", "suit": "Hearts", "value": 5, "sprite": "res://sprites/Hearts_5_white.png"},
	{"rank" : "6", "suit": "Hearts", "value": 6, "sprite": "res://sprites/Hearts_6_white.png"},
	{"rank" : "7", "suit": "Hearts", "value": 7, "sprite": "res://sprites/Hearts_7_white.png"},
	{"rank" : "8", "suit": "Hearts", "value": 8, "sprite": "res://sprites/Hearts_8_white.png"},
	{"rank" : "9", "suit": "Hearts", "value": 9, "sprite": "res://sprites/Hearts_9_white.png"},
	{"rank" : "10", "suit": "Hearts", "value": 10, "sprite": "res://sprites/Hearts_10_white.png"},
	{"rank" : "Jack", "suit": "Hearts", "value": 10, "sprite": "res://sprites/Hearts_Jack_white.png"},
	{"rank" : "Queen", "suit": "Hearts", "value": 10, "sprite": "res://sprites/Hearts_Queen_white.png"},
	{"rank" : "King", "suit": "Hearts", "value": 10, "sprite": "res://sprites/Hearts_King_white.png"},
	{"rank" : "Ace", "suit": "Hearts", "value": 10, "sprite": "res://sprites/Hearts_A_white.png"},
	#Spades
	{"rank" : "2", "suit": "Spades", "value": 2, "sprite": "res://sprites/Pikes_2_white.png"},
	{"rank" : "3", "suit": "Spades", "value": 3, "sprite": "res://sprites/Pikes_3_white.png"},
	{"rank" : "4", "suit": "Spades", "value": 4, "sprite": "res://sprites/Pikes_4_white.png"},
	{"rank" : "5", "suit": "Spades", "value": 5, "sprite": "res://sprites/Pikes_5_white.png"},
	{"rank" : "6", "suit": "Spades", "value": 6, "sprite": "res://sprites/Pikes_6_white.png"},
	{"rank" : "7", "suit": "Spades", "value": 7, "sprite": "res://sprites/Pikes_7_white.png"},
	{"rank" : "8", "suit": "Spades", "value": 8, "sprite": "res://sprites/Pikes_8_white.png"},
	{"rank" : "9", "suit": "Spades", "value": 9, "sprite": "res://sprites/Pikes_9_white.png"},
	{"rank" : "10", "suit": "Spades", "value": 10, "sprite": "res://sprites/Pikes_10_white.png"},
	{"rank" : "Jack", "suit": "Spades", "value": 10, "sprite": "res://sprites/Pikes_Jack_white.png"},
	{"rank" : "Queen", "suit": "Spades", "value": 10, "sprite": "res://sprites/Pikes_Queen_white.png"},
	{"rank" : "King", "suit": "Spades", "value": 10, "sprite": "res://sprites/Pikes_King_white.png"},
	{"rank" : "Ace", "suit": "Spades", "value": 10, "sprite": "res://sprites/Pikes_A_white.png"},
	#Diamonds
	{"rank" : "2", "suit": "Diamonds", "value": 2, "sprite": "res://sprites/Tiles_2_white.png"},
	{"rank" : "3", "suit": "Diamonds", "value": 3, "sprite": "res://sprites/Tiles_3_white.png"},
	{"rank" : "4", "suit": "Diamonds", "value": 4, "sprite": "res://sprites/Tiles_4_white.png"},
	{"rank" : "5", "suit": "Diamonds", "value": 5, "sprite": "res://sprites/Tiles_5_white.png"},
	{"rank" : "6", "suit": "Diamonds", "value": 6, "sprite": "res://sprites/Tiles_6_white.png"},
	{"rank" : "7", "suit": "Diamonds", "value": 7, "sprite": "res://sprites/Tiles_7_white.png"},
	{"rank" : "8", "suit": "Diamonds", "value": 8, "sprite": "res://sprites/Tiles_8_white.png"},
	{"rank" : "9", "suit": "Diamonds", "value": 9, "sprite": "res://sprites/Tiles_9_white.png"},
	{"rank" : "10", "suit": "Diamonds", "value": 10, "sprite": "res://sprites/Tiles_10_white.png"},
	{"rank" : "Jack", "suit": "Diamonds", "value": 10, "sprite": "res://sprites/Tiles_Jack_white.png"},
	{"rank" : "Queen", "suit": "Diamonds", "value": 10, "sprite": "res://sprites/Tiles_Queen_white.png"},
	{"rank" : "King", "suit": "Diamonds", "value": 10, "sprite": "res://sprites/Tiles_King_white.png"},
	{"rank" : "Ace", "suit": "Diamonds", "value": 10, "sprite": "res://sprites/Tiles_A_white.png"}
]

var player_hand = []

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	shuffle_deck()
	for _i in range(2):
		deal_player_card()
		
	#var hit = get_node("Hit")
	#hit.connect("pressed", self, "on_Hit_pressed")
	
func shuffle_deck():
	# Using Richard Durstenfeld's version of the Fisher-Yates Shuffle
	for i in range(len(deck)-1):
		var rng = RandomNumberGenerator.new()
		var j = rng.randi_range(0,51)
		var temp = deck[i]
		deck[i] = deck[j]
		deck[j] = temp
	
			
func deal_player_card():
	if deck:
		var card_to_be_dealt = deck.pop_back()
		score += card_to_be_dealt["value"]
		$ScoreLabel.text = "Score: " + str(score)
		player_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(0.35,0.35)
		card_sprite.position = Vector2(240,300)
		add_child(card_sprite)
		
func _on_Hit_pressed():
	deal_player_card()
	
func reset_deck_player():
	for card in player_hand:
		deck.append(card)
	player_hand.clear()

func reset_player_score():
	score = 0
	$ScoreLabel.text = "Score: " + str(score)
