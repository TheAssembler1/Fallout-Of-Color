extends KinematicBody2D

var gravity = 1000;
var motion = Vector2();
const GROUND = Vector2(0,-1);
export var speed = 4000;
onready var ColorPlayer = get_parent().get_node("ColorPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += gravity * delta;
	if ColorPlayer.position.x > position.x:
		motion.x = speed * delta
		$EnemyParticles.scale.x = 1
	elif ColorPlayer.position.x < position.x:
		motion.x = -speed * delta
		$EnemyParticles.scale.x = -1
	motion = move_and_slide(motion, GROUND);
