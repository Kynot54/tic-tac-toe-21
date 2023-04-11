extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
	var _temp = self.connect("script_changed", $PlayerMarginContainer, "update_score")
	if Deck.new_round == true:
		reset_deck()
		for _i in range(2):
			deal_player_card()
		
func deal_player_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		if Deck.player_score > 10 and card_to_be_dealt["rank"] == "Ace":
			card_to_be_dealt["value"] = 1 
		Deck.player_score += card_to_be_dealt["value"]	
		emit_signal("script_changed", Deck.player_score)
		Deck.player_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(0.65,0.65)
		var posY = 850
		for card in Deck.player_hand.size():
			posY = int(posY - 90.125)
			card_sprite.position = Vector2(480,posY)
		# Find way to add shadow/overlay effects to them
		$PlayerMarginContainer/Player21Container/CardSort.add_child(card_sprite)
		card_sprite.owner = self
				
func _on_Hit_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	
	deal_player_card()
	Deck.player_hit = true
	if Deck.player_score > 21:
		Deck.end = true
		$PlayerMarginContainer/Player21Container/PlayerButtonsContainter/Hit.disabled = true
		yield(get_tree().create_timer(1), "timeout")
		Transit.change_scene("res://Dealer/DealerCard.tscn")
	elif Deck.player_score == 21:
		Deck.end = true
		yield(get_tree().create_timer(1), "timeout")
		Transit.change_scene("res://Dealer/DealerCard.tscn")
	else:
		pass
		
func _on_Stand_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	Deck.end =  true
	yield(get_tree().create_timer(0.5), "timeout")
	Transit.change_scene("res://Dealer/DealerCard.tscn")
	
func _on_DealerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	save_sprites()
	Transit.change_scene("res://Dealer/DealerCard.tscn")
	
func save_sprites():
	var card_scene = PackedScene.new()
	var saved_scene = card_scene.pack(self)
	if saved_scene == OK:
		var error = ResourceSaver.save("res://Player/PlayerCard.tscn",card_scene)
		if  error != OK:
			push_error("An error has occured.")
	
func reset_deck():
	for card in Deck.player_hand:
		Deck.deck.append(card)
	Deck.player_hand.clear()
	
	Deck.player_score = 0
	emit_signal("script_changed", Deck.player_score)
	
	for card in Deck.dealer_hand:
		Deck.deck.append(card)
	Deck.dealer_hand.clear()
	
	Deck.dealer_score = 0

	Deck.end = false
	Deck.player_hit = false
	Deck.player1_win = false
	Deck.player2_win = false
