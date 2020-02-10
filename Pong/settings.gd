extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if(get_tree().get_current_scene().get_name() == "main"):
			if get_rect().has_point(get_local_mouse_position()):
				get_tree().change_scene("res://Scenes/Settings.tscn")
		if(get_tree().get_current_scene().get_name() == "settings"):
			if get_rect().has_point(get_local_mouse_position()):
				get_tree().change_scene("res://Scenes/MainMenu.tscn")
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
