extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player_vars = get_node("/root/PlayerVariables")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		
	if(get_tree().get_current_scene().get_name() == "Name1"):
		if(get_text().length() > 1 ):
			player_vars.player1 = get_text()

	if(get_tree().get_current_scene().get_name() == "Name2"):
		if(get_text().length() > 1):
			player_vars.player2 = get_text()

