extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")
onready var musicPlayer = get_node("/root/Music")

func _input(event):
	if event is InputEventKey and (event.get_scancode() == 16777217 and event.is_pressed() == false): 
		get_tree().quit()
						
func _unhandled_input(event):
	if (event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT):
		if get_rect().has_point(get_local_mouse_position()):
			if(get_tree().get_current_scene().get_name() == "Name1"):
				get_tree().change_scene("res://Scenes/EnterName2.tscn")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				get_tree().change_scene("res://Scenes/OuterCollider.tscn")
			elif(get_tree().get_current_scene().get_name() == "main"):
				player_vars.p1Score = 0
				player_vars.p2Score = 0
				if player_vars.numrounds == null:
					player_vars.numrounds = 11
				player_vars.maxwins = player_vars.numrounds / 2 + 1 #All that matters
				player_vars.player1 = "Player 1"
				player_vars.player2 = "Player 2"
				player_vars.winner = player_vars.player1
				get_tree().change_scene("res://Scenes/EnterName1.tscn")
			elif(get_tree().get_current_scene().get_name() == "gamewin"):
				musicPlayer.music.stop()
				musicPlayer.stream = load("res://Sounds/mainmenu.ogg")
				musicPlayer.music.set_stream(musicPlayer.stream)
				musicPlayer.music.volume_db = 1
				musicPlayer.music.pitch_scale = 1
				musicPlayer.music.play()
				get_tree().change_scene("res://Scenes/MainMenu.tscn")
			else:
				print_debug("1st: " + get_tree().get_current_scene().get_name())
				print_debug("2nd: " + "EnterName1")

