extends StaticBody2D

var roundsPlayed = 1
var velocity = Vector2(0,0)
var timer = 500
var whichpowerup = 0
var thread

onready var wormholes = preload("res://Scenes/wormholes.tscn")
onready var booster = preload("res://Scenes/booster.tscn")
onready var player_vars = get_node("/root/PlayerVariables")
onready var musicPlayer = get_node("/root/Music")
onready var roundLabel = get_node("../Node/RoundsPlayed")
onready var ring = get_node("CollisionPolygon2D/OuterRing_P")
var powerup

# Called when the node enters the scene tree for the first time.
func _ready():
	ring.texture = player_vars.p1RingColor
	roundLabel.set_text("Round: " + str(roundsPlayed) + " / " + str(player_vars.numrounds))
	musicPlayer.music.stop()
	musicPlayer.stream = load("res://Sounds/gameplay.ogg")
	musicPlayer.music.set_stream(musicPlayer.stream)
	musicPlayer.music.volume_db = 1
	musicPlayer.music.pitch_scale = 1
	musicPlayer.music.play()
	
	var player1Label = get_node("../Node/P1 Score")
	var player2Label = get_node("../Node/P2 Score")
	
	if   player_vars.player1Color == "purple":
		player1Label.add_color_override("font_color", Color("b76ed4"))
		player2Label.add_color_override("font_color", Color("c7e814"))
	elif player_vars.player1Color == "green":
		player1Label.add_color_override("font_color", Color("089217"))
		player2Label.add_color_override("font_color", Color("db4804"))
	elif player_vars.player2Color == "blue":
		player1Label.add_color_override("font_color", Color("d10404"))
		player2Label.add_color_override("font_color", Color("0000cd"))

func hit(team):
	if(team == "purple"):
		player_vars.p1Score += 1
	if(team == "yellow"):
		player_vars.p2Score += 1
	roundsPlayed += 1

	roundLabel.set_text("Round: " + str(roundsPlayed) + " / " + str(player_vars.numrounds))

	if(player_vars.p1Score == player_vars.maxwins):
		player_vars.winner = player_vars.player1
		get_tree().change_scene("res://Scenes/GameWin.tscn")
	if(player_vars.p2Score == player_vars.maxwins):
		player_vars.winner = player_vars.player2
		get_tree().change_scene("res://Scenes/GameWin.tscn")
	if((player_vars.numrounds - roundsPlayed) == 0):
		if(player_vars.p2Score > player_vars.p1Score):
			player_vars.winner = player_vars.player2
			get_tree().change_scene("res://Scenes/GameWin.tscn")

func _physics_process(delta):
	timer -= 1

	if(timer == 0):
		if(whichpowerup == 2 && powerup != null):
			var animator1 = get_node("../Wormholes/Wormhole1/CollisionShape2D/Sprite/AnimationPlayer")
			var animator2 = get_node("../Wormholes/Wormhole2/CollisionShape2D/Sprite/AnimationPlayer")
			animator1.play("Exit")
			animator2.play("Exit")
			var t = Timer.new()
			t.set_wait_time(.7)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			get_node("..").remove_child(powerup)

		if(whichpowerup == 3 && powerup != null):
			var animator = get_node("../Boosterdad/Booster/CollisionShape2D/Sprite/AnimationPlayer")
			animator.play("Exit")
			var t = Timer.new()
			t.set_wait_time(.6)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")

			get_node("..").remove_child(powerup)
			
		whichpowerup = randi() % 4
		
		if false: #whichpowerup == 1:
			var meteor =  get_node("../Meteor")
			meteor.position(950, -300)
			meteor.visible = true
		
		elif (whichpowerup == 2):
			#print_debug("Wormholes have been chosen: ")
			powerup = wormholes.instance()
			get_node("..").add_child(powerup)
			var wormhole1 = get_node("../Wormholes/Wormhole1")
			var wormhole2 = get_node("../Wormholes/Wormhole2")
			var temp = Vector2(rand_range(-35, -225), rand_range(-225,225))
			#print_debug("Wormhole1: " + str(temp))
			wormhole1.position = temp
			temp = Vector2(rand_range(35, 225), rand_range(-225,225))
			#print_debug("Wormhole2: " + str(temp))
			wormhole2.position = temp
			var animator1 = get_node("../Wormholes/Wormhole1/CollisionShape2D/Sprite/AnimationPlayer")
			var animator2 = get_node("../Wormholes/Wormhole2/CollisionShape2D/Sprite/AnimationPlayer")
			var t = Timer.new()
			t.set_wait_time(.7)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			animator1.play("Idle")
			animator2.play("Idle")
		
		elif(whichpowerup == 3):
			#print_debug("Booster has been chosen: ")
			powerup = booster.instance()
			get_node("..").add_child(powerup)
			var boosters = get_node("../Boosterdad/Booster")
			
			var temp = null
			while (temp == null || abs(temp.x) < 40):
				temp = Vector2(rand_range(-225, 225), rand_range(-225,225))

			#print_debug("Booster: " + str(temp))
				
			boosters.position = temp
			var animator = get_node("../Boosterdad/Booster/CollisionShape2D/Sprite/AnimationPlayer")
			var t = Timer.new()
			t.set_wait_time(.6)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			animator.play("Idle")

		timer = 500
		# Set the timer to 100 if we spawn nothing
		if(whichpowerup == 0 || whichpowerup == 1):
			timer = 100

func _wormholeleave(animator):
	#print_debug("threading")
	animator.play("Exit")
	var t = Timer.new()
	t.set_wait_time(1.4)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")


