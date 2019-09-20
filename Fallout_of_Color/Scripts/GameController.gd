extends Node2D

#boundaries of spawning blocks are
#x = -272 && 872
#y = 560

#checks if player has it a wall
onready var hit_wall = get_node("ColorPlayer").hit_wall

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var hit_wall = get_node("ColorPlayer").hit_wall
	
	#makes the payer turn
	if hit_wall:
		print_debug("Hit the wall")
	
	pass