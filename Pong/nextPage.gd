extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")
onready var musicPlayer = get_node("/root/Music")

func _ready():
	# Setting the font color of labels on EnterName1 and EnterName2
	if get_tree().get_current_scene().get_name() == "Name1":
		var enterName1Label = get_node("../Label1")
		if player_vars.player1Color == "purple":
			print_debug("PURPLE")
			enterName1Label.add_color_override("font_color", Color("b76ed4"))
		elif player_vars.player1Color == "red":
			enterName1Label.add_color_override("font_color", Color("d10404"))
			
	elif get_tree().get_current_scene().get_name() == "Name2":
		var enterName2Label = get_node("../Label2")
		if player_vars.player2Color == "yellow":
			enterName2Label.add_color_override("font_color", Color("e0dc90"))
		elif player_vars.player2Color == "blue":
			enterName2Label.add_color_override("font_color", Color("0000cd"))
			
	elif(get_tree().get_current_scene().get_name() == "gamewin"):
		var gameWinLabel = get_node("../Winner")
		print_debug("Entered")
		if   player_vars.winner == player_vars.player1 && player_vars.player1Color == "purple":
			gameWinLabel.add_color_override("font_color", Color("b76ed4"))
		elif player_vars.winner == player_vars.player1 && player_vars.player1Color == "red":
			gameWinLabel.add_color_override("font_color", Color("d10404"))
		elif player_vars.winner == player_vars.player2 && player_vars.player2Color == "yellow":
			gameWinLabel.add_color_override("font_color", Color("e0dc90"))
		elif player_vars.winner == player_vars.player2 && player_vars.player2Color == "blue":
			gameWinLabel.add_color_override("font_color", Color("0000cd"))
			
	elif(get_tree().get_current_scene().get_name() == "Node2D"):
		var paddle1 = get_node("../Paddle1/CollisionShape2D/paddleSpriteP")
		var paddle2 = get_node("../Paddle2/CollisionShape2D/paddleSpriteY")		
		if   player_vars.player1Color == "purple":
			paddle1.texture = player_vars.p1PaddleColor
		elif player_vars.player1Color == "red":
			paddle1.texture = player_vars.p1PaddleColor
		elif player_vars.player2Color == "yellow":
			paddle2.texture = player_vars.p2PaddleColor
		if player_vars.player2Color == "blue":
			paddle2.texture = player_vars.p2PaddleColor
			
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()
				
func _unhandled_input(event):
	if (event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT) || (event is InputEventKey and ((event.get_scancode() == 16777221 and event.is_pressed() == false))):
		if get_rect().has_point(get_local_mouse_position()):
			if(get_tree().get_current_scene().get_name() == "Name1"):
				get_tree().change_scene("res://Scenes/EnterName2.tscn")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				get_tree().change_scene("res://Scenes/OuterCollider.tscn")
			elif(get_tree().get_current_scene().get_name() == "main"):
				player_vars.p1Score = 0
				player_vars.p2Score = 0
				player_vars.numrounds = 1
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

