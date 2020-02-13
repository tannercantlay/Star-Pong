extends Node

onready var player_vars = get_node("/root/PlayerVariables")

func _ready():
	if(get_tree().get_current_scene().get_name() == "Node2D"):
		var paddle1 = get_node("Paddle1/CollisionShape2D/paddleSpriteP")
		var paddle2 = get_node("Paddle2/CollisionShape2D/paddleSpriteY")		
		if player_vars.player1Color == "purple":
			paddle1.texture = player_vars.p1PaddleColor
		if player_vars.player1Color == "red":
			paddle1.texture = player_vars.p1PaddleColor
		if player_vars.player1Color == "green":
			paddle1.texture = player_vars.p1PaddleColor
		if player_vars.player2Color == "yellow":
			paddle2.texture = player_vars.p2PaddleColor
		if player_vars.player2Color == "blue":
			paddle2.texture = player_vars.p2PaddleColor
		if player_vars.player2Color == "pink":
			paddle2.texture = player_vars.p2PaddleColor

func _input(event):
	#Escaping
	if event is InputEventKey and (event.get_scancode() == 16777217 and event.is_pressed() == false): 
		get_tree().quit()


