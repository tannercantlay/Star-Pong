extends Sprite

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if(get_tree().get_current_scene().get_name() == "main"):
			if get_rect().has_point(get_local_mouse_position()):
				get_tree().change_scene("res://Scenes/Settings.tscn")
		if(get_tree().get_current_scene().get_name() == "settings"):
			if get_rect().has_point(get_local_mouse_position()):
				get_tree().change_scene("res://Scenes/MainMenu.tscn")

