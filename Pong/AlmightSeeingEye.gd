extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if (event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT):
		if get_rect().has_point(get_local_mouse_position()):
			
			player_vars.ballColor = load("res://Sprites/SpriteSheets/Ball_Eye.png")
