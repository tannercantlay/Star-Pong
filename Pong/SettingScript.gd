extends Node

onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()
		
func _ready():	
	if(get_tree().get_current_scene().get_name() == "settings"):
		if player_vars.p1RingColor != null:
			var giantCircle = get_node("Outer_Ring")
			giantCircle.texture = player_vars.p1RingColor

