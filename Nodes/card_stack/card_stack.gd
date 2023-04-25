extends Control
## Holds a stack of cards
class_name CardStack

# stack of cards to display
var _cards_stack = []
var _cards_sprites = []

var base_pos: Vector2
export var max_cards = 5

export var scale_x := 1.0
export var scale_y := 1.0
export var rotate_cards := 5


func _ready():
	self._cards_stack = []
	self._cards_sprites = []


## Set the deck to an existing array
## used to init the deck from the global deck
func set_deck(new_deck):
	self.clear()
	
	for card in new_deck.duplicate():
		self.push_back(card)


## Push a card to the CardStack
## Only max_cards cards will be displayed, any cards over max_cards are stored
## but not drawn on screen.
func push_back(card_data):
	# Always add the card to the internal stack
	self._cards_stack.push_back(card_data)
	
	if self._cards_sprites.size() < max_cards:
		var card_image: StreamTexture = load(card_data["sprite"])
		
		var card_sprite = Sprite.new()
		card_sprite.texture = card_image
		card_sprite.scale = Vector2(scale_x, scale_y)
		
		card_sprite.position = self.base_pos
		card_sprite.position.y -= (200 * scale_y) * _cards_sprites.size()
		
		var rotation_deg = rotate_cards
		if self._cards_stack.size() % 2 != 0:
			rotation_deg *= -1
		
		card_sprite.rotate(deg2rad(rotation_deg))
		self._cards_sprites.push_back(card_sprite)
		
		card_sprite.z_index = max_cards - _cards_stack.size()
		
		add_child(card_sprite)

## Remove a card from the CardStack
## If there are more than 5 cards in the CardStack, the
## number of cards onscreen will not decrease as there may
## be more than 5 cards in the internal stack
func pop_back():
	if self._cards_stack.size() > 0:
		
		# Only remove card sprites if there are no non-visible cards
		if self._cards_stack.size() <= max_cards:
			self._cards_sprites.pop_back().queue_free()
			
		return self._cards_stack.pop_back()
	else:
		return null

## Returns the size of the CardStack (even cards that are not visible)
func size():
	return self._cards_stack.size()

## Remove all the cards from the CardStack and return them
func remove_all():
	var out = []
	for _i in range(self._cards_stack.size()):
		out.push_back(pop_back())
	
	return out


## clear the card stack
func clear():
	self._cards_stack.clear()
	for card_sprite in self._cards_sprites:
		card_sprite.queue_free()
	self._cards_sprites.clear()


func _on_CardStack_resized():
	# Determine the new base position
	var base_pos_new = self.rect_size
	base_pos_new.x = base_pos_new.x / 2
	base_pos_new.y -= (400 * scale_y)
	self.base_pos = base_pos_new
	
	# Change the position of the cards
	for card_idx in self._cards_sprites.size():
		var card_pos = self.base_pos
		card_pos.y -= (200 * scale_y) * card_idx
		
		self._cards_sprites[card_idx].position = card_pos
