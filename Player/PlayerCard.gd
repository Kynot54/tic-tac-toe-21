extends Node
onready var card_stack := $PlayerMarginContainer/Player21Container/CardStack
onready var _score_label := $PlayerMarginContainer/Player21Container/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	if gVar.new_round == true:
		reset_deck()
		gVar.reset_hands()
		self.card_stack.clear()
		for _i in range(2):
			deal_player_card()
	else:
		self.card_stack.clear()
		self.card_stack.set_deck(Deck.player_hand)

	_score_label.text = str("Score: ", gVar.player_score)


func deal_player_card():
	if Deck.deck:
		# Add card to be dealt to the card stack
		var card_to_be_dealt = Deck.deck.pop_back()
		card_stack.push_back(card_to_be_dealt)

		if gVar.player_score > 10 and card_to_be_dealt["rank"] == "Ace":
			card_to_be_dealt["value"] = 1
		gVar.player_score += card_to_be_dealt["value"]
		Deck.player_hand.append(card_to_be_dealt)


func _on_Hit_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)

	deal_player_card()
	gVar.player_hit = true
	if gVar.player_score >= 21:
		gVar.end = true

	_score_label.text = str("Score: ", gVar.player_score)

	$PlayerMarginContainer/Player21Container/PlayerButtonsContainter/Hit.disabled = true
	yield(get_tree().create_timer(1), "timeout")
	Transit.change_scene("res://Dealer/DealerCard.tscn")


func _on_Stand_pressed():
	gVar.end = true
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	yield(get_tree().create_timer(1), "timeout")
	Transit.change_scene("res://Dealer/DealerCard.tscn")


func _on_DealerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	gVar.previewing_deck = true
	Transit.change_scene("res://Dealer/DealerCard.tscn")


func reset_deck():
	Deck.reset()
	gVar.reset_hands()
	card_stack.clear()
