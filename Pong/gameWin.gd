extends Node

onready var Ring = get_node("../Ring")
onready var yelRing = load("res://Sprites/OuterRing_Y.png")
onready var purpRing = load("res://Sprites/OuterRing_P.png")
onready var player_vars = get_node("/root/PlayerVariables")
onready var WinnerText = get_node("../Label")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	WinnerText.text = player_vars.winner + " has taken over the galaxy!"
	if player_vars.winner == player_vars.player1:
		Ring.texture = purpRing
	elif player_vars.winner == player_vars.player2:
		Ring.texture = yelRing
	else:
		print_debug("what why are we here")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
