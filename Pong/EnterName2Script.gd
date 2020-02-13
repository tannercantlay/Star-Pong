extends Node

onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _input(event):
	#Escaping
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()
		
	if event is InputEventKey and (event.get_scancode() == 16777221 and event.is_pressed() == false):
		if(get_tree().get_current_scene().get_name() == "Name2"):
			get_tree().change_scene("res://Scenes/OuterCollider.tscn")
		
func _ready():
	if get_tree().get_current_scene().get_name() == "Name2":
		var label =  get_node("Sprite/Label")
		var enterName2Label = get_node("Label2")
		if player_vars.player2Color == "yellow":
			enterName2Label.add_color_override("font_color", Color("e0dc90"))
			label.add_color_override("font_color_shadow", Color("b76ed4"))
		elif player_vars.player2Color == "blue":
			enterName2Label.add_color_override("font_color", Color("0000cd"))
			label.add_color_override("font_color_shadow", Color("d10404"))
		elif player_vars.player2Color == "orange":
			enterName2Label.add_color_override("font_color", Color("db4804"))
			label.add_color_override("font_color_shadow", Color("089217"))
