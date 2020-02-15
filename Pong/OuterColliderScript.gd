extends Node

onready var player_vars = get_node("/root/PlayerVariables")

func _ready():
	print_debug("OUTER COLLIDER SCRIPT")
	if(get_tree().get_current_scene().get_name() == "Node2D"):
		# Setting the Paddle Colors, doing it here, casue this occurs sooner
		# than in OuterColliderScript _ready function
		var paddleSprite1 = get_node("Paddle1/CollisionShape2D/paddleSpriteP")
		var paddleSprite2 = get_node("Paddle2/CollisionShape2D/paddleSpriteY")		
		if player_vars.player1Color == "purple":
			paddleSprite1.texture = player_vars.p1PaddleColor
			paddleSprite2.texture = player_vars.p2PaddleColor
		if player_vars.player1Color == "red":
			paddleSprite1.texture = player_vars.p1PaddleColor
			paddleSprite2.texture = player_vars.p2PaddleColor
		if player_vars.player1Color == "green":
			paddleSprite1.texture = player_vars.p1PaddleColor
			paddleSprite2.texture = player_vars.p2PaddleColor
				
		var ball = get_node("Ball/CollisionShape2D/ballSprite")
		ball.texture = player_vars.ballColor
		var animator = get_node("Ball/CollisionShape2D/ballSprite/AnimationPlayer")
		animator.play("Enter")
		var t = Timer.new()
		t.set_wait_time(.4)
		t.set_one_shot(true)
		add_child(t)
		t.start()
		yield(t, "timeout")
		animator.play("ballRotate")

func _input(event):
	#Escaping
	if event is InputEventKey and (event.get_scancode() == 16777217 and event.is_pressed() == false): 
		get_tree().quit()


