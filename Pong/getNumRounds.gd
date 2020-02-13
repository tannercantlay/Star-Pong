extends LineEdit

onready var player_vars = get_node("/root/PlayerVariables")
onready var lineedit = get_node(".")

func _physics_process(delta):	
	if(get_tree().get_current_scene().get_name() == "settings"):
		if(lineedit.get_text().length() >= 1 ):
			player_vars.numrounds = int(get_text())
			player_vars.maxwins = player_vars.numrounds / 2 + 1
