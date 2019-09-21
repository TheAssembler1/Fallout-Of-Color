extends KinematicBody2D

#booleans for input
var up = false
var down = false
var left = false
var right = false
var grounded = false

#says if the player is alive
export var pause_or_dead = false
var real_death = false

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

#checks if player has it the ground yet
var hit_ground = 0

#variables for if player is going right or left
export var hit_wall = false

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
	
	if pause_or_dead == true:
		$Particles.emitting = false
	
	if pause_or_dead == false && real_death == false:
		#applying gravity
		motion.y += gravity * delta
		
		#setting grounded
		grounded = is_on_floor()
		
		#setting booleans for input
		right = Input.is_action_pressed("ui_right")
		up = Input.is_action_just_pressed("ui_up")
	
		if is_on_wall():
			speed *= -1
			hit_wall = true
		else:
			hit_wall = false
		
		#going left and right
		if hit_ground > 50:
			if speed < 0:
				motion.x = speed * delta
				$Particles.emitting = true
				$Particles.position.x = 16
				$Particles.scale.x = -1
			elif speed > 0:
				motion.x = speed * delta
				$Particles.emitting = true
				$Particles.position.x = -16
				$Particles.scale.x = 1
				
		if speed < 0 && up && grounded:
			rot_left = true
			motion.y += -jump_speed
			prev_degree = $Sprite.rotation_degrees
		elif speed > 0 && up && grounded:
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
			if int($Sprite.rotation_degrees)%90 != 0:
				var distance = int($Sprite.rotation_degrees)%90
				var prev = $Sprite.rotation_degrees
				$Sprite.rotation_degrees += distance
				if int($Sprite.rotation_degrees)%90 != 0:
					$Sprite.rotation_degrees = prev
					$Sprite.rotation_degrees -= distance
			rot_right = false
			rot_left = false
		
		hit_ground += 1
		motion = move_and_slide(motion, normal_floor)

func _on_Area2D_body_entered(body):
	
	if body.is_in_group("RedBlock"):
		$Particles.emitting = false
		$Sprite.visible = false
		$DeathParticles.emitting = true
		pause_or_dead = true
		real_death = true
		
	pass # Replace with function body.
