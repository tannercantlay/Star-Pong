extends Node


onready var Ring = get_node("Ring")

onready var yelRing = load("res://Sprites/OuterRing_Y.png")
onready var purpRing = load("res://Sprites/OuterRing_P.png")
onready var player_vars = get_node("/root/PlayerVariables")
onready var musicPlayer = get_node("/root/Music")

onready var WinnerText = get_node("Winner")

func _input(event):
	if event is InputEventKey and (event.get_scancode() == 16777217 and event.is_pressed() == false): 
		get_tree().quit()
		
	if event is InputEventKey and (event.get_scancode() == 16777221 and event.is_pressed() == false):
		if(get_tree().get_current_scene().get_name() == "gamewin"):
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			
			musicPlayer.music.stop()
			musicPlayer.stream = load("res://Sounds/mainmenu.ogg")
			musicPlayer.music.set_stream(musicPlayer.stream)
			musicPlayer.music.volume_db = 1
			musicPlayer.music.pitch_scale = 1
			musicPlayer.music.play()
			get_tree().change_scene("res://Scenes/MainMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():	
	if(get_tree().get_current_scene().get_name() == "gamewin"):
		var gameWinLabel = get_node("Winner")
		if   player_vars.winner == player_vars.player1 && player_vars.player1Color == "purple":
			gameWinLabel.add_color_override("font_color", Color("b76ed4"))
		elif player_vars.winner == player_vars.player1 && player_vars.player1Color == "red":
			gameWinLabel.add_color_override("font_color", Color("d10404"))
		elif player_vars.winner == player_vars.player1 && player_vars.player1Color == "green":
			gameWinLabel.add_color_override("font_color", Color("0a5212"))
		elif player_vars.winner == player_vars.player2 && player_vars.player2Color == "yellow":
			gameWinLabel.add_color_override("font_color", Color("e0dc90"))
		elif player_vars.winner == player_vars.player2 && player_vars.player2Color == "blue":
			gameWinLabel.add_color_override("font_color", Color("0000cd"))
		elif player_vars.winner == player_vars.player2 && player_vars.player2Color == "pink":
			gameWinLabel.add_color_override("font_color", Color("ed00c7"))
			
		var label =  get_node("PlayAgain/Label")
		if player_vars.player1Color == "purple":
			label.add_color_override("font_color_shadow", Color("b76ed4"))
		elif player_vars.player1Color == "red":
			label.add_color_override("font_color_shadow", Color("d10404"))
		elif player_vars.player1Color == "green":
			label.add_color_override("font_color_shadow", Color("0a5212"))
			
		WinnerText.text = player_vars.winner + " has taken over the galaxy!"
		if player_vars.winner == player_vars.player1:
			Ring.texture = player_vars.p2RingColor
			# You set it to the other player's ring color becuase
			# it is the animation from p2->p1
		elif player_vars.winner == player_vars.player2:
			Ring.texture = player_vars.p1RingColor
			# You set it to the other player's ring color becuase
			# it is the animation from p1->p2
		else:
			print_debug("what why are we here, trollololololo")
			
		musicPlayer.music.stop()
		musicPlayer.stream = load("res://Sounds/victory.ogg")
		musicPlayer.music.set_stream(musicPlayer.stream)
		musicPlayer.music.volume_db = 1
		musicPlayer.music.pitch_scale = 1
		musicPlayer.music.play()

