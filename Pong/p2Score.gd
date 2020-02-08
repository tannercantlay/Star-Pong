extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var manager = get_node("../../OuterRing")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var text = manager.p2Name + "\nScore: " + str(manager.p2Score)
	set_text(text)
	pass
