extends CanvasLayer

# Declare member variables here. Examples:
onready var pause = get_parent().get_node("ColorPlayer").pause_or_dead
export var test = 1
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pause = get_parent().get_node("ColorPlayer").pause_or_dead
	pass


func _on_TextureButton_button_up():
	if test == 1:
		get_parent().get_node("ColorPlayer").pause_or_dead = true
		test *= -1
	elif test == -1:
		get_parent().get_node("ColorPlayer").pause_or_dead = false
		test *= -1
	pass # Replace with function body.
