extends Node

onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()
		
	if event is InputEventKey and (event.get_scancode() == 16777221 and event.is_pressed() == false):
		if(get_tree().get_current_scene().get_name() == "main"):
			player_vars.p1Score = 0
			player_vars.p2Score = 0
			if player_vars.numrounds == null:
				player_vars.numrounds = 11
			player_vars.maxwins = player_vars.numrounds / 2 + 1 #All that matters
			player_vars.player1 = "Player 1"
			player_vars.player2 = "Player 2"
			player_vars.winner = player_vars.player1
			get_tree().change_scene("res://Scenes/EnterName1.tscn")
		
func _ready():
	if(get_tree().get_current_scene().get_name() == "main"):
		if player_vars.p1RingColor != null:
			var giantCircle = get_node("outer_ring")
			giantCircle.texture = player_vars.p1RingColor
			
		var label1 = get_node("Start/Label")
		var label2 = get_node("exit/Label")
		var label3 = get_node("settings/Label")
		var shadowColor
		if   player_vars.player1Color == "purple":
			shadowColor = "b76ed4"
		elif player_vars.player1Color == "red":
			shadowColor = "d10404"
		elif player_vars.player1Color == "green":
			shadowColor = "0a5212"
		label1.add_color_override("font_color_shadow", Color(shadowColor))
		label2.add_color_override("font_color_shadow", Color(shadowColor))
		label3.add_color_override("font_color_shadow", Color(shadowColor))

