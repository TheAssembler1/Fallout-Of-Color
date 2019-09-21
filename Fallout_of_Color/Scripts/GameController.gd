extends Node2D

#loading scenes needed to spawn in area
var red_block = load("res://Scenes/Enemies/RedBlock.tscn")

#holds the random spawn type of block
var random_block = randi()%5+1

#variables from other scenes
onready var hit_wall = get_node("ColorPlayer").hit_wall

#holds the score
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	spawn_blocks()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#setting the hit wall function
	hit_wall = get_node("ColorPlayer").hit_wall
	
	if hit_wall:
		score += 10
		get_node("MainSceneGUI").get_node("RichTextLabel").text = "SCORE = " + String(score)
		spawn_blocks()


func single_block(var x):
	
	var red_block_instance = red_block.instance()
	red_block_instance.set_name("red_block")
	red_block_instance.position.x = x
	red_block_instance.position.y = 560
	add_child(red_block_instance)


func double_block(var x):
	
	var red_block_instance = red_block.instance()
	red_block_instance.set_name("red_block")
	red_block_instance.position.x = x
	red_block_instance.position.y = 560
	add_child(red_block_instance)

	var red_block_instance2 = red_block.instance()
	red_block_instance2.set_name("red_block_2")
	red_block_instance2.position.x = x
	red_block_instance2.position.y = 560-32
	add_child(red_block_instance2)
	
func one_block_overhead(var x):
	
	var red_block_instance = red_block.instance()
	red_block_instance.set_name("red_block")
	red_block_instance.position.x = x
	red_block_instance.position.y = 560-32
	add_child(red_block_instance)
	
func two_block_overhead(var x):
	
	var red_block_instance = red_block.instance()
	red_block_instance.set_name("red_block")
	red_block_instance.position.x = x
	red_block_instance.position.y = 560-32
	add_child(red_block_instance)

	var red_block_instance2 = red_block.instance()
	red_block_instance2.set_name("red_block_2")
	red_block_instance2.position.x = x
	red_block_instance2.position.y = 560-32-32
	add_child(red_block_instance2)

func spawn_blocks():
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(-176)
	elif random_block == 2:
		double_block(-176)
	elif random_block == 3:
		one_block_overhead(-176)
	else:
		two_block_overhead(-176)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(-16)
	elif random_block == 2:
		double_block(-16)
	elif random_block == 3:
		one_block_overhead(-16)
	else:
		two_block_overhead(-16)
		
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(144)
	elif random_block == 2:
		double_block(144)
	elif random_block == 3:
		one_block_overhead(144)
	else:
		two_block_overhead(144)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(304)
	elif random_block == 2:
		double_block(304)
	elif random_block == 3:
		one_block_overhead(304)
	else:
		two_block_overhead(304)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(720)
	elif random_block == 2:
		double_block(720)
	elif random_block == 3:
		one_block_overhead(720)
	else:
		two_block_overhead(720)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(880)
	elif random_block == 2:
		double_block(880)
	elif random_block == 3:
		one_block_overhead(880)
	else:
		two_block_overhead(880)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(1040)
	elif random_block == 2:
		double_block(1040)
	elif random_block == 3:
		one_block_overhead(1040)
	else:
		two_block_overhead(1040)
	
	random_block = randi()%5+1
	
	if random_block == 1:
		single_block(1200)
	elif random_block == 2:
		double_block(1200)
	elif random_block == 3:
		one_block_overhead(1200)
	else:
		two_block_overhead(1200)