extends Node

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 16777217 and event.is_pressed() == false)): 
		get_tree().quit()

