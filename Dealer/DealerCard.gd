extends Node

func _ready():
	self.connect("script_changed", $DealerMarginContainer, "update_score")
	emit_signal("script_changed", gVar.dealer_score)
	if gVar.new_round == true:
		for _i in range(2):
			deal_dealer_card()
		gVar.new_round = false
	yield(get_tree().create_timer(1), "timeout")
	determine_dealer_actions()
	if gVar.end == true:
		determine_win()

func deal_dealer_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		gVar.dealer_score += card_to_be_dealt["value"]
		emit_signal("script_changed", gVar.dealer_score)
		Deck.dealer_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(0.75,0.75)
		var posY = 1400
		for card in Deck.dealer_hand.size():
			posY = int(posY - 91.275)
			card_sprite.position = Vector2(480,posY)
		# Determine how to overlay cards in a manner similar to player
		$DealerMarginContainer/CardCenter/CardSort.add_child(card_sprite)
		card_sprite.owner = self

func _on_PlayerButton_pressed():	
	save_sprites()
	yield(get_tree().create_timer(2), "timeout")
	Transit.change_scene("res://Player/PlayerCard.tscn")
	
func determine_dealer_actions():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var t = rng.randi_range(0,1)
	while gVar.dealer_score <= 16 and t == 1:
		deal_dealer_card()
		yield(get_tree().create_timer(0.5), "timeout")
			
func determine_win():
	if gVar.end == true:
		if gVar.player_score > gVar.dealer_score and gVar.player_score <= 21:
			gVar.player1_win = true
			gVar.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		elif gVar.player_score == gVar.dealer_score:
			gVar.new_round = true
			Transit.change_scene("res://Player/PlayerCard.tscn")
		elif gVar.player_score > 21 and gVar.dealer_score > 21:
			gVar.new_round = true
			Transit.change_scene("res://Player/PlayerCard.tscn")
		elif gVar.dealer_score > 21 and gVar.player_score <= 21:
			gVar.player1_win = true
			gVar.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		else:
			gVar.player2_win = true
			gVar.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
			
func save_sprites():
	var card_scene = PackedScene.new()
	var saved_scene = card_scene.pack(self)
	if saved_scene == OK:
		var error = ResourceSaver.save("res://Dealer/DealerCard.tscn",card_scene)
		if  error != OK:
			push_error("An error has occured.")
	
