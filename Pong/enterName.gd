extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
	
func pressed_handler(which):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if(get_tree().get_current_scene().get_name() == "Name1"):
				get_tree().change_scene("res://Scenes/EnterName2.tscn")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				get_tree().change_scene("res://Scenes/OuterCollider.tscn")
			else:
				print_debug("1st: " + get_tree().get_current_scene().get_name())
				print_debug("2nd: " + "EnterName1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
