extends CanvasLayer

# Declare member variables here. Examples:
onready var pause = get_parent().get_node("ColorPlayer").pause_or_dead
export var test = 1
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Quit.visible = false
	$MainMenu.visible = false
	$Retry.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pause = get_parent().get_node("ColorPlayer").pause_or_dead
	if get_parent().get_node("ColorPlayer").real_death == true:
		$Quit.visible = true
		$MainMenu.visible = true
		$Retry.visible = true
	pass


func _on_TextureButton_button_up():
	if test == 1:
		get_parent().get_node("ColorPlayer").pause_or_dead = true
		test *= -1
	elif test == -1:
		get_parent().get_node("ColorPlayer").pause_or_dead = false
		test *= -1
	if get_parent().get_node("ColorPlayer").pause_or_dead == true:
		$Quit.visible = true
		$MainMenu.visible = true
	elif get_parent().get_node("ColorPlayer").pause_or_dead == false:
		$Quit.visible = false
		$MainMenu.visible = false
	pass # Replace with function body.


func _on_Quit_button_up():
	if get_parent().get_node("ColorPlayer").pause_or_dead == true:
		get_tree().quit()
	pass # Replace with function body.


func _on_MainMenu_button_up():
	if get_parent().get_node("ColorPlayer").pause_or_dead == true:
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
	pass # Replace with function body.


func _on_Retry_button_up():
	if get_parent().get_node("ColorPlayer").real_death == true:
		get_tree().reload_current_scene()
	pass # Replace with function body.
