extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	VisualServer.set_default_clear_color(Color(0.0,0.0,0.0,1.0))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_button_up():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
	pass # Replace with function body.
