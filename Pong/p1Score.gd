extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var text = player_vars.player1 + "\nScore: " + str(player_vars.p1Score)
	set_text(text)
	pass
