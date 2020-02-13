extends Node

onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _input(event):
	#Escaping
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()
		
	if event is InputEventKey and (event.get_scancode() == 16777221 and event.is_pressed() == false):
		if(get_tree().get_current_scene().get_name() == "Name1"):
			get_tree().change_scene("res://Scenes/EnterName2.tscn")
		
func _ready():
	if get_tree().get_current_scene().get_name() == "Name1":
		var enterName1Label = get_node("Label1")
		var label =  get_node("Sprite/Label")
		if player_vars.player1Color == "purple":
			enterName1Label.add_color_override("font_color", Color("b76ed4"))
			label.add_color_override("font_color_shadow", Color("b76ed4"))
		elif player_vars.player1Color == "red":
			enterName1Label.add_color_override("font_color", Color("d10404"))
			label.add_color_override("font_color_shadow", Color("d10404"))
		elif player_vars.player1Color == "green":
			enterName1Label.add_color_override("font_color", Color("089217"))
			label.add_color_override("font_color_shadow", Color("089217"))
