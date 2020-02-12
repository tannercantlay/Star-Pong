extends Node


onready var Ring = get_node("Ring")

onready var yelRing = load("res://Sprites/OuterRing_Y.png")
onready var purpRing = load("res://Sprites/OuterRing_P.png")
onready var player_vars = get_node("/root/PlayerVariables")
onready var musicPlayer = get_node("/root/Music")

onready var WinnerText = get_node("Winner")


# Called when the node enters the scene tree for the first time.
func _ready():
	WinnerText.text = player_vars.winner + " has taken over the galaxy!"
	if player_vars.winner == player_vars.player1:
		Ring.texture = player_vars.p1RingColor
	elif player_vars.winner == player_vars.player2:
		Ring.texture = player_vars.p2RingColor
	else:
		print_debug("what why are we here")
	musicPlayer.music.stop()
	musicPlayer.stream = load("res://Sounds/victory.ogg")
	musicPlayer.music.set_stream(musicPlayer.stream)
	musicPlayer.music.volume_db = 1
	musicPlayer.music.pitch_scale = 1
	musicPlayer.music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
