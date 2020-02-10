extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var music
var stream

# Called when the node enters the scene tree for the first time.
func _ready():
	music = AudioStreamPlayer2D.new()
	if(get_tree().get_current_scene().get_name() == "OuterCollider"):
		music.stop()
		stream = load("res://Sounds/gameplay.ogg")
	else:
		if(stream != load("res://Sounds/mainmenu.ogg")):
			music.stop()
			stream = load("res://Sounds/mainmenu.ogg")
	self.add_child(music)
	music.set_stream(stream)
	music.volume_db = -10
	music.pitch_scale = 1
	music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
