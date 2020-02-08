extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
func pressed_handler(which):
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			get_tree().change_scene("res://Scenes/EnterName1.tscn")
	
#func _process(delta):
#	print_debug("Input Event")
#	if (input):
#		var label_size = get_node("startButton").get_size()
#		var label_pos = get_node("startButton").get_global_pos()
#		var mouse_pos = get_global_mouse_position()
#		if (label_pos <= mouse_pos <= label_pos + label_size):
#			get_tree().change_scene("res://Scenes/OuterCollider.tscn")
#	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
