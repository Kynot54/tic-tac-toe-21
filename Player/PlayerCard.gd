extends Node

# Import Deck
onready var deck = Deck.deck
# Import Player Structures
onready var player_score = Deck.player_score

# Import Flags (Booelan Checks)
onready var hit = Deck.player_hit
onready var end = Deck.is_end 
onready var new_round = Deck.new_round

onready var player_hand = Deck.player_hand

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("script_changed", $PlayerMarginContainer, "update_score")
	if new_round == true:
		reset_player_score()
		reset_player_deck()
	yield(get_tree().create_timer(5), "timeout")
	for _i in range(2):
		deal_player_card()
		
func deal_player_card():
	if deck:
		var card_to_be_dealt = deck.pop_back()
		player_score += card_to_be_dealt["value"]
		emit_signal("script_changed", player_score)
		player_hand.append(card_to_be_dealt)
		var card_sprite = Sprite.new()
		card_sprite.texture = load(card_to_be_dealt["sprite"])
		card_sprite.scale = Vector2(1,1)
		card_sprite.position = Vector2(480,700)
		# Find way to offset ((vertically) the cards and add shadow/overlay effects to them
		$PlayerMarginContainer/Player21Container/.add_child(card_sprite)
				
func _on_Hit_pressed():
	deal_player_card()
	Deck.player_hit = true
	if player_score > 21:
		Deck.is_end =  true
		save_scene()
		Transit.change_scene("res://Dealer/DealerCard.tscn")
	elif player_score == 21:
		Deck.is_end = true
		save_scene()
		Transit.change_scene("res://Dealer/DealerCard.tscn")
	else:
		pass
		
func _on_Stand_pressed():
	end = true
	save_scene()
	Transit.change_scene("res://Dealer/DealerCard.tscn")
	
func _on_DealerButton_pressed():
	save_scene()
	Transit.change_scene("res://Dealer/DealerCard.tscn")
	
func reset_player_deck():
	for card in player_hand:
		deck.append(card)
	player_hand.clear()
	
func reset_player_score():
	player_score = 0
	emit_signal("script_changed", player_score)
	
# Method of Saving a Scence from https://godotengine.org/qa/89982/how-to-save-changes-when-switching-scenes
func save_scene():
	var file_path = "res://Player/PlayerCard.tscn"
	var scene = PackedScene.new()
	scene.pack(self)
	ResourceSaver.save(file_path,scene)
