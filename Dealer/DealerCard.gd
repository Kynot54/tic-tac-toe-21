extends Node

func _ready():
	var _temp = self.connect("script_changed", $DealerMarginContainer, "update_score")
	emit_signal("script_changed", Deck.dealer_score)
	if Deck.new_round == true:
		for _i in range(2):
			deal_dealer_card()
		Deck.new_round = false
	yield(get_tree().create_timer(1), "timeout")
	determine_dealer_actions()
	if Deck.end == true:
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
		var posY = 1200
		for card in Deck.dealer_hand.size():
			posY = int(posY - 90.125)
			card_sprite.position = Vector2(480,posY)
		# Determine how to overlay cards in a manner similar to player
		$DealerMarginContainer/CardSort.add_child(card_sprite)
		card_sprite.owner = self


func _on_PlayerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	save_sprites()
	yield(get_tree().create_timer(2), "timeout")
	Transit.change_scene("res://Player/PlayerCard.tscn")
	
func determine_dealer_actions():
	if Deck.player_hit == true:
		if Deck.dealer_score <= 16:
			deal_dealer_card()
			Deck.player_hit = false
	Deck.player_hit = false
			
func determine_win():
	if Deck.end == true:
		if Deck.player_score > Deck.dealer_score and Deck.player_score <= 21:
			Deck.player1_win = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			Deck.new_round = true
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		elif Deck.player_score == Deck.dealer_score or Deck.player_score > 21 and Deck.dealer_score > 21:
			Deck.new_round = true
			Transit.change_scene("res://Player/PlayerCard.tscn")
		elif Deck.player_score > 21 and Deck.dealer_score > 21:
			Deck.new_round = true
			Transit.change_scene("res://Player/PlayerCard.tscn")
		else:
			Deck.player2_win = true
			Deck.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
			
func save_sprites():
	var card_scene = PackedScene.new()
	var saved_scene = card_scene.pack(self)
	if saved_scene == OK:
		var error = ResourceSaver.save("res://Dealer/DealerCard.tscn",card_scene)
		if  error != OK:
			push_error("An error has occured.")
	
