extends Control

onready var card_stack := $DealerMarginContainer/VBoxContainer/CardStack
onready var _score_label := $DealerMarginContainer/VBoxContainer/DealerScore

func _ready():
	if Deck.new_round == true:
		self.card_stack.clear()
		for _i in range(2):
			deal_dealer_card()
		Deck.new_round = false
	else:
		self.card_stack.clear()
		self.card_stack.set_deck(Deck.dealer_hand)

	_score_label.text = str("Score: ", Deck.dealer_score)
	
	yield(get_tree().create_timer(1), "timeout")
	$DealerMarginContainer/VBoxContainer/PlayerButton.disabled = false
	
	determine_dealer_actions()
	if Deck.end == true:
		determine_win()

func deal_dealer_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		self.card_stack.push_back(card_to_be_dealt)
		Deck.dealer_score += card_to_be_dealt["value"]
		Deck.dealer_hand.append(card_to_be_dealt)


func _on_PlayerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
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

