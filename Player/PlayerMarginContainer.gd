extends MarginContainer


onready var score = $Player21Container/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_score(value):
	score.text = "Score: " + str(value)
