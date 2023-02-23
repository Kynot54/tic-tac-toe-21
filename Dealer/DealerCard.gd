extends Node

onready var deck = Deck.deck
onready var dealer_score = Deck.dealer_score

onready var player_score = Deck.player_score

onready var hit = Deck.player_hit
onready var end = Deck.is_end

onready var new_round = Deck.new_round

onready var dealer_hand = Deck.dealer_hand

func _ready():
	self.connect("script_changed", $DealerMarginContainer, "update_score")
	for _i in range(2):
		deal_dealer_card()
	determine_player_actions()

func deal_dealer_card():
	if deck:
		var card_to_be_dealt = deck.pop_back()
		dealer_score += card_to_be_dealt["value"]
		emit_signal("script_changed", dealer_score)
		dealer_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(1,1)
		card_sprite.position = Vector2(490,910)
		# Determine how to overlay cards in a manner similar to player
		$DealerMarginContainer/.add_child(card_sprite)

func _on_PlayerButton_pressed():
	Transit.change_scene("res://Player/PlayerCard.tscn")
	pass
		
func reset_dealer_deck():
	for card in dealer_hand:
		deck.append(card)
	dealer_hand.clear()
	
func reset_dealer_score():
	dealer_score = 0
	emit_signal("script_changed", dealer_score)

func determine_player_actions():
	if hit == true:
		if dealer_score <= 16:
			deal_dealer_card()
			hit = false
		elif dealer_score > 16:
			pass
	if end == true:
		if player_score > dealer_score and !(player_score > 21):
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		elif player_score == dealer_score:
			reset_dealer_score()
			reset_dealer_deck()
			new_round == true
			Transit.change_scene("res://Player/PlayerCard.tscn")
