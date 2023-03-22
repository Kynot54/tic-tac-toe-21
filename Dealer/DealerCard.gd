extends Node

func _ready():
	self.connect("script_changed", $DealerMarginContainer, "update_score")
	for _i in range(2):
		deal_dealer_card()
	determine_dealer_actions()
	determine_win()

func deal_dealer_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		Deck.dealer_score += card_to_be_dealt["value"]
		emit_signal("script_changed", Deck.dealer_score)
		Deck.dealer_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(0.75,0.75)
		var posY = 910
		for card in Deck.dealer_hand.size():
			posY = int(posY - 90)
			card_sprite.position = Vector2(480,posY)
		# Determine how to overlay cards in a manner similar to player
		$DealerMarginContainer/CardSort.add_child(card_sprite)

func _on_PlayerButton_pressed():	
	Transit.change_scene("res://Player/PlayerCard.tscn")
	pass
		
func reset_dealer_deck():
	for card in Deck.dealer_hand:
		Deck.deck.append(card)
	Deck.dealer_hand.clear()
	
func reset_dealer_score():
	Deck.dealer_score = 0
	emit_signal("script_changed", Deck.dealer_score)

func determine_dealer_actions():
	if Deck.player_hit == true:
		if Deck.dealer_score <= 16:
			deal_dealer_card()
			Deck.player_hit = false
		elif Deck.dealer_score > 16:
			pass
			
func determine_win():
	if Deck.end == true:
		if Deck.player_score > Deck.dealer_score and !(Deck.player_score > 21):
			Deck.player1_win = true
			
			Board.return_to = "res://Player/PlayerCard.tscn"
			Deck.new_round = true
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		elif Deck.player_score == Deck.dealer_score:
			reset_dealer_score()
			reset_dealer_deck()
			Deck.new_round = true
			Transit.change_scene("res://Player/PlayerCard.tscn")
		else:
			Deck.player2_win = true
			
			Board.return_to = "res://Player/PlayerCard.tscn"
			Deck.new_round = true
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
