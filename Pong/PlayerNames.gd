extends LineEdit

onready var player_vars = get_node("/root/PlayerVariables")

func _physics_process(delta):
		
	if(get_tree().get_current_scene().get_name() == "Name1"):
		if(get_text().length() > 1 ):
			player_vars.player1 = get_text()

	if(get_tree().get_current_scene().get_name() == "Name2"):
		if(get_text().length() > 1):
			player_vars.player2 = get_text()

