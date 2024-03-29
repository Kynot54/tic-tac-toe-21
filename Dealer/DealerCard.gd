extends Control

onready var card_stack := $DealerMarginContainer/DealerButtonContainer/CardStack
onready var _score_label := $DealerMarginContainer/DealerButtonContainer/FooterLabels/DealerScore
onready var _prompt_label := $DealerMarginContainer/DealerButtonContainer/FooterLabels/StatePrompt
onready var _player_button := $DealerMarginContainer/DealerButtonContainer/PlayerButton


func _ready():
	_player_button.visible = gVar.previewing_deck
	
	if gVar.new_round == true:
		self.card_stack.clear()
		for _i in range(2):
			deal_dealer_card()
		gVar.new_round = false
	else:
		self.card_stack.clear()
		self.card_stack.set_deck(Deck.dealer_hand)

	_score_label.text = str("Dealer Score: ", gVar.dealer_score)
	
	if gVar.previewing_deck:
		gVar.previewing_deck = false
		_prompt_label.text = ""
	else:
		if should_dealer_hit():
			_prompt_label.text = "Dealer Hits!"
			yield(get_tree().create_timer(1), "timeout")
			deal_dealer_card()
			yield(get_tree().create_timer(1), "timeout")
		else:
			_prompt_label.text = "Dealer Stands!"

		yield(get_tree().create_timer(1), "timeout")

		if gVar.end == true:
			determine_win()
		else:
			_prompt_label.text = "Continue!"
			yield(get_tree().create_timer(1), "timeout")
			Transit.change_scene("res://Player/PlayerCard.tscn")


func deal_dealer_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		gVar.dealer_score += card_to_be_dealt["value"]
		Deck.dealer_hand.append(card_to_be_dealt)

		self.card_stack.push_back(card_to_be_dealt)
		_score_label.text = str("Dealer Score: ", gVar.dealer_score)


func _on_PlayerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	Transit.change_scene("res://Player/PlayerCard.tscn")


func should_dealer_hit():
	var t = randi() % 4

	return gVar.dealer_score <= 16 and t < 3


func determine_win():
	if gVar.end == true:
		if (gVar.player_score > gVar.dealer_score and gVar.player_score <= 21) or (gVar.dealer_score > 21 and gVar.player_score <= 21):
			_prompt_label.text = "Player Wins!"
			
			gVar.player_win = true
			gVar.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			yield(get_tree().create_timer(1), "timeout")
			Board.round_state = Board.TTTRoundState.PLAYER_1_PICKING
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
		elif gVar.player_score == gVar.dealer_score or (gVar.player_score > 21 and gVar.dealer_score > 21):
			_prompt_label.text = "Tie!"

			gVar.new_round = true
			yield(get_tree().create_timer(1), "timeout")
			Transit.change_scene("res://Player/PlayerCard.tscn")
		elif (gVar.dealer_score > gVar.player_score and gVar.dealer_score <= 21) or (gVar.player_score > 21 and gVar.dealer_score <= 21):
			_prompt_label.text = "Dealer Wins!"

			gVar.new_round = true
			Board.return_to = "res://Player/PlayerCard.tscn"
			yield(get_tree().create_timer(1), "timeout")
			Board.round_state = Board.TTTRoundState.PLAYER_2_PICKING
			Transit.change_scene("res://TicTacToe/TicTac.tscn")
