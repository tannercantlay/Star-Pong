extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
	
func _ready():
	player_vars.p1Score = 0
	player_vars.p2Score = 0
	player_vars.numrounds = 3 #All that matters
func pressed_handler(which):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		print_debug("Inside IF")
		#print_debug(get_rect().has_point(to_local_mouse_position())    #(event.position)))
		if get_rect().has_point(get_local_mouse_position()):
			print_debug("Inside IF 2")
			if(get_tree().get_current_scene().get_name() == "Name1"):
				get_tree().change_scene("res://Scenes/EnterName2.tscn")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				get_tree().change_scene("res://Scenes/OuterCollider.tscn")
			elif(get_tree().get_current_scene().get_name() == "main"):
				get_tree().change_scene("res://Scenes/EnterName1.tscn")
			elif(get_tree().get_current_scene().get_name() == "gamewin"):
				get_tree().change_scene("res://Scenes/MainMenu.tscn")
			else:
				print_debug("1st: " + get_tree().get_current_scene().get_name())
				print_debug("2nd: " + "EnterName1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
