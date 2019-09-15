extends KinematicBody2D

#booleans for input
var up = false
var down = false
var left = false
var right = false
var grounded = false

#booleans for effect the block
var rot_left = false
var rot_right = false

#holds the previous rotation degree
var prev_degree = 0;

#player variables in the world
export var gravity = 2
export var speed = 400
export var jump_speed = 400
var rotate_speed = 10

#vectors for motion
var motion = Vector2()
var normal_floor = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_to_group("ColorBlock")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Input(delta)
	
	pass

#getting the player input
func Input(delta):
	
	#applying gravity
	motion.y += gravity * delta
	
	#setting grounded
	grounded = is_on_floor()
	
	#setting booleans for input
	right = Input.is_action_pressed("ui_right")
	left = Input.is_action_pressed("ui_left")
	down = Input.is_action_pressed("ui_down")
	up = Input.is_action_just_pressed("ui_up")
	
	#going left and right
	if left:
		motion.x = -speed * delta
	elif right:
		motion.x = speed * delta
	else:
		motion.x = 0
	
	if left && up && grounded:
		rot_left = true
		motion.y += -jump_speed
		prev_degree = $Sprite.rotation_degrees
	elif right && up && grounded:
		rot_right = true
		motion.y += -jump_speed
		prev_degree = $Sprite.rotation_degrees
	elif up && grounded:
		rot_right = false
		rot_left = false
		motion.y += -jump_speed
		
	if rot_left && $Sprite.rotation_degrees >= int(prev_degree-80):
		$Sprite.rotation_degrees -= int(rotate_speed)
		$Sprite.rotation_degrees = int($Sprite.rotation_degrees)
	elif rot_right && $Sprite.rotation_degrees <= int(prev_degree+80):
		$Sprite.rotation_degrees += int(rotate_speed)
		$Sprite.rotation_degrees = int($Sprite.rotation_degrees)
	else:
		rot_right = false
		rot_left = false
	
	motion = move_and_slide(motion, normal_floor)