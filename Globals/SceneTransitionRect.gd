extends ColorRect

# https://www.gdquest.com/tutorial/godot/2d/scene-transition-rect/

# Path of the scene to transition to
export(String, FILE, "*.tscn") var next_scene_path

# Reference to the AnimationPlayer node
onready var _anim_player := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	_anim_player.play_backwards("Fade")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func transition_to(_next_scene := next_scene_path):
	# fade to black
	_anim_player.play("Fade")
	
	# await animation finished
	yield(_anim_player, "animation_finished")
	
	# Change to the selected scene
	get_tree().change_scene(_next_scene)
