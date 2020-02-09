extends StaticBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var roundsPlayed = 1
var velocity = Vector2(0,0)
var timer = 500
var whichpowerup = 0
var thread

onready var wormholes = preload("res://Scenes/wormholes.tscn")
onready var booster = preload("res://Scenes/booster.tscn")
onready var player_vars = get_node("/root/PlayerVariables")
onready var roundLabel = get_node("../Node/RoundsPlayed")
var powerup
# Called when the node enters the scene tree for the first time.
func _ready():
	roundLabel.set_text("Round: " + str(roundsPlayed))
	pass # Replace with function body.

func hit(team):
	if(team == "purple"):
		player_vars.p1Score += 1
		player_vars.numrounds -= 1
	if(team == "yellow"):
		player_vars.p2Score += 1
		player_vars.numrounds -= 1
	roundsPlayed += 1
	roundLabel.set_text("Round: " + str(roundsPlayed))
	if(player_vars.numrounds == 0):
		if(player_vars.p2Score > player_vars.p1Score):
			player_vars.winner = player_vars.player2
		get_tree().change_scene("res://Scenes/GameWin.tscn")
	pass

func _physics_process(delta):
	timer -= 1

	if(timer == 0):
		if(whichpowerup == 1 && powerup != null):
			#thread =  Thread.new()
			#thread.start(self,"_wormholeleave")
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
		if(whichpowerup == 2 && powerup != null):
			var animator = get_node("../Boosterdad/Booster/CollisionShape2D/Sprite/AnimationPlayer")
			animator.play("Exit")
			var t = Timer.new()
			t.set_wait_time(.6)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			
		whichpowerup = randi()%3
		print_debug(whichpowerup)
		if(powerup != null):
			get_node("..").remove_child(powerup)
		print_debug("time up")
		if (whichpowerup == 1):
			powerup = wormholes.instance()
			get_node("..").add_child(powerup)
			var wormhole1 = get_node("../Wormholes/Wormhole1")
			var wormhole2 = get_node("../Wormholes/Wormhole2")
			
			var temp = Vector2(rand_range(-25, -250), rand_range(-250,250))
			print_debug(temp)
			wormhole1.position = temp
	
			temp = Vector2(rand_range(25, 250), rand_range(-250,250))
			print_debug(temp)
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
		
		if(whichpowerup == 2):
			powerup = booster.instance()
			get_node("..").add_child(powerup)
			var boosters = get_node("../Boosterdad/Booster")
			var temp = Vector2(rand_range(-250, 250), rand_range(-250,250))
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
		if(whichpowerup == 0):
			timer = 250
	pass

func _wormholeleave(animator):
	print_debug("threading")
	animator.play("Exit")
	var t = Timer.new()
	t.set_wait_time(1.4)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
