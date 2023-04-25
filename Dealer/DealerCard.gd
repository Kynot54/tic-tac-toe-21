extends Control

onready var card_stack := $DealerMarginContainer/VBoxContainer/CardStack
onready var _score_label := $DealerMarginContainer/VBoxContainer/DealerScore

func _ready():
	if gVar.new_round == true:
  self.card_stack.clear()
		for _i in range(2):
			deal_dealer_card()
		gVar.new_round = false
	else:
		self.card_stack.clear()
		self.card_stack.set_deck(Deck.dealer_hand)

	_score_label.text = str("Score: ", Deck.dealer_score)
	

	yield(get_tree().create_timer(1), "timeout")
	$DealerMarginContainer/VBoxContainer/PlayerButton.disabled = false
	
	determine_dealer_actions()
	if gVar.end == true:
		determine_win()

func deal_dealer_card():
	if Deck.deck:
		var card_to_be_dealt = Deck.deck.pop_back()
		gVar.dealer_score += card_to_be_dealt["value"]
		gVar.dealer_hand.append(card_to_be_dealt)
		
		self.card_stack.push_back(card_to_be_dealt)


func _on_PlayerButton_pressed():
	Music.play_button_click(Music.ButtonType.TWENTYONE_BUTTON)
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

