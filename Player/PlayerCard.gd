extends Node
# Called when the node enters the scene tree for the first time.
#onready var card_stack := $PlayerMarginContainer/Player21Container/CardStack
onready var card_stack := $PlayerMarginContainer/Player21Container/CardStack
onready var _score_label := $PlayerMarginContainer/Player21Container/ScoreLabel


func _ready():
	if Deck.new_round == true:
		reset_deck()
		self.card_stack.clear()
		for _i in range(2):
			deal_player_card()
	else:
		self.card_stack.clear()
		self.card_stack.set_deck(Deck.player_hand)
	
	_score_label.text = str("Score: ", Deck.player_score)
		
func deal_player_card():
	if Deck.deck:
		# Add card to be dealt to the card stack
		var card_to_be_dealt = Deck.deck.pop_back()
		card_stack.push_back(card_to_be_dealt)
		
		if Deck.player_score > 10 and card_to_be_dealt["rank"] == "Ace":
			card_to_be_dealt["value"] = 1 
		Deck.player_score += card_to_be_dealt["value"]
		Deck.player_hand.append(card_to_be_dealt)


func _on_Hit_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
	
	deal_player_card()
	_score_label.text = str("Score: ", Deck.player_score)
	
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
	Transit.change_scene("res://Dealer/DealerCard.tscn")


func reset_deck():
	Deck.reset()
	card_stack.clear()
