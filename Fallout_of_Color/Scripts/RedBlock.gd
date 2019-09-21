extends StaticBody2D

#getting the wall variable
onready var hit_wall = get_parent().get_node("ColorPlayer").hit_wall

#current modulate number
var mod = 0
var mod_speed = .007

#sets death boolean
var death = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Sprite.modulate = Color(mod,mod,mod)
	
	add_to_group("RedBlock")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hit_wall = get_parent().get_node("ColorPlayer").hit_wall
	
	if mod < 1:
		mod+=mod_speed
		$Sprite.modulate = Color(mod,mod,mod)

	
	if hit_wall:
		queue_free()

