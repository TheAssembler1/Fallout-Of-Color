extends StaticBody2D

#getting the wall variable
onready var hit_wall = get_parent().get_node("ColorPlayer").hit_wall

# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_to_group("RedBlock")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hit_wall = get_parent().get_node("ColorPlayer").hit_wall
	
	if hit_wall:
		queue_free()

