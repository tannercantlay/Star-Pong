extends LineEdit

onready var player_vars = get_node("/root/PlayerVariables")
onready var lineedit = get_node(".")

func _physics_process(delta):	
	if(get_tree().get_current_scene().get_name() == "settings"):	
		var stringInput = lineedit.get_text()
		
		if(stringInput.length() >= 1 ):
			var intInput = int(stringInput)
			
			if intInput % 2 == 0:
				intInput = intInput + 1
				
			player_vars.numrounds = intInput
			player_vars.maxwins = player_vars.numrounds / 2 + 1
