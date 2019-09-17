extends KinematicBody2D

var gravity = 2;
var motion = Vector2();
const GROUND = Vector2(0,-1);
export var speed = 100;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += gravity;
	if ColorPlayer.transform.x > transform.x:
		motion.x = speed
	elif ColorPlayer.transform.x < transform.x:
		motion.x = -speed
	move_and_slide(motion, GROUND);
