extends KinematicBody2D

var startingSpeed = 350
var timer
var velocity = Vector2()
var returnValue
var speed = startingSpeed
var lastHit = "yellow"
var paused = true

onready var paddle1 = get_node("../Paddle1")
onready var paddle2 = get_node("../Paddle2")
onready var Ring = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P")
onready var player_vars = get_node("/root/PlayerVariables")
onready var animate = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P/AnimationPlayer")

onready var countdown = get_node("../Countdown")
onready var leftScore = get_node("../ScoreBoardLeft")
onready var rightScore = get_node("../ScoreBoardRight")
onready var scoreLabel = get_node("../ScoreLabel")

func _ready():
	
	_lockPaddles(true)
	velocity = Vector2(0,0)
	paused = true
	
	# Initializing stuff so we dont have to on the 2D Scene
	leftScore.visible = false
	leftScore.text = "0"
	rightScore.visible = false
	rightScore.text = "0"
	scoreLabel.visible = false
	countdown.visible = false
	
	#Setting the Scoreboard's Color
	if   player_vars.player2Color == "yellow":
		rightScore.add_color_override("font_color", Color("c7e814"))
	elif player_vars.player2Color == "blue":
		rightScore.add_color_override("font_color", Color("0000cd"))
	elif player_vars.player2Color == "orange":
		rightScore.add_color_override("font_color", Color("db4804"))
	if   player_vars.player1Color == "purple":
		leftScore.add_color_override("font_color", Color("b76ed4"))
	elif player_vars.player1Color == "red":
		leftScore.add_color_override("font_color", Color("d10404"))
	elif player_vars.player1Color == "green":
		leftScore.add_color_override("font_color", Color("089217"))
	countdown.add_color_override("font_color", Color("ffffff"))
	
	#Countdown
	countdown.visible = true
	yield(get_tree().create_timer(.95), "timeout")
	countdown.text = "2"
	yield(get_tree().create_timer(.95), "timeout")
	countdown.text = "1"
	yield(get_tree().create_timer(.95), "timeout")
	countdown.visible = false
	countdown.text = "3"
	yield(get_tree().create_timer(.15), "timeout")
	
	countdown.visible = false

	_lockPaddles(false)
	_resetPaddleLocations()
	
	paused = false

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		
		# if ball hit the outer ring
		if collision.collider.has_method("hit"):
			get_node("../OuterRing/CollisionPolygon2D/OuterRing_P/AudioStreamPlayer2D").play()
			collision.collider.hit(lastHit)
				
			$CollisionShape2D.disabled = true
			get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("Exit")
			
			# Makes the Ball Stop at the Ring instead of passing through
			_lockPaddles(true)
			velocity = Vector2(0,0)
			speed = 0
			
			yield(get_tree().create_timer(.4), "timeout")
			
			get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("Enter")
			$CollisionShape2D.disabled = false
			# repositions ball to center of game, offset up if purple scored or down if yellow scored
			# ? will call logic from gameManager to update game score, reposition paddles after a score?
					
			_resetPaddleLocations()
			
			if lastHit == "yellow":
				position = Vector2(0, 50)
				rightScore.text = str(player_vars.p2Score)
			elif lastHit == "purple":
				position = Vector2(0,-50)
				leftScore.text = str(player_vars.p1Score)
			
			paused = true # ---------------------------- Paused -------------
			velocity = Vector2(0,lastHit)
			speed = startingSpeed
			
			# Reveals the Popup
			countdown.visible = true
			scoreLabel.visible = true
			leftScore.visible = true
			rightScore.visible = true
	
			yield(get_tree().create_timer(.4), "timeout")
			get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("ballRotate")
			yield(get_tree().create_timer(.55), "timeout")
			countdown.text = "2"
			yield(get_tree().create_timer(.95), "timeout")
			countdown.text = "1"
			yield(get_tree().create_timer(.95), "timeout")
			countdown.visible = false
			scoreLabel.visible = false
			leftScore.visible = false
			rightScore.visible = false
			countdown.text = "3"
			
			yield(get_tree().create_timer(.15), "timeout")
			
			_lockPaddles(false)
			_resetPaddleLocations()
			paused = false # --------------------------- Un-Paused -------------	
				
		# if ball hits a paddle
		elif collision.collider.has_method("getTeam"):
			lastHit = collision.collider.getTeam()
			if(lastHit == "purple"):
				get_node("../Paddle1/CollisionShape2D/paddleSpriteP/AudioStreamPlayer2D").play()
				get_node("../Paddle1/CollisionShape2D").disabled = true
				get_node("../Paddle2/CollisionShape2D").disabled = false
				animate.play("changeColor")
				Ring.texture = player_vars.p2RingColor
			elif(lastHit == "yellow"):
				get_node("../Paddle2/CollisionShape2D/paddleSpriteY/AudioStreamPlayer2D").play()
				get_node("../Paddle2/CollisionShape2D").disabled = true
				get_node("../Paddle1/CollisionShape2D").disabled = false
				animate.play("changeColor")
				Ring.texture = player_vars.p1RingColor

			var preVelocity = velocity
			var postVelocity = velocity.bounce(collision.normal)

			velocity = 1.03 * postVelocity

		# if ball hit the Middle Star
		elif collision.collider.has_method("middleStar"):
			get_node("../Middle Star/CollisionShape2D/Sprite/AudioStreamPlayer2D").play()
			var temp
			var collisionNode = get_node("../Middle Star/CollisionShape2D")
			collisionNode.disabled = true
			temp = collision.collider.middleStar(velocity)
			velocity = temp
			yield(get_tree().create_timer(.2), "timeout")
			collisionNode.disabled = false

		# if ball hit the Wormhole
		elif collision.collider.has_method("throughWormhole"):
			get_node("CollisionShape2D/ballSprite/Wormhole sounds").play()
			var temp
			var wormhole1 = get_node("../Wormholes/Wormhole1/CollisionShape2D")
			var wormhole2 = get_node("../Wormholes/Wormhole2/CollisionShape2D")
			wormhole1.disabled = true
			wormhole2.disabled = true
			temp = collision.collider.throughWormhole()
			position = temp
			if velocity.length() > 450: 
				velocity *= .93
			yield(get_tree().create_timer(.2), "timeout")
			wormhole1.disabled = false
			wormhole2.disabled = false
			
		# if ball hit the Booster
		elif collision.collider.has_method("speedracer"):
			get_node("CollisionShape2D/ballSprite/Speedracer").play()
			#$CollisionShape2D.disabled = true
			var booster = get_node("../Boosterdad/Booster/CollisionShape2D")
			booster.disabled = true

			velocity = velocity * 2.5
			if velocity.length() < 400: 
				velocity *= 1.25

			yield(get_tree().create_timer(.1), "timeout")
			booster.disabled = false
			velocity = velocity * .8
			
			#This second timer to slow it down slowly
			yield(get_tree().create_timer(.2), "timeout")
			velocity = velocity * .55

	# THE BALLS STARTING VELOCITY
	if(!paused && velocity == Vector2(0,0) && lastHit == "yellow"):
		velocity = Vector2(0,(speed))
	if(!paused && velocity == Vector2(0,0) && lastHit == "purple"):
		velocity = Vector2(0,0-speed)
		
		
func _lockPaddles(boolean):
	if boolean == true:
		paddle1.rotation_speed = 0
		paddle2.rotation_speed = 0
	else:
		paddle1.rotation_speed = paddle1.startingPaddleSpeed
		paddle2.rotation_speed = paddle1.startingPaddleSpeed
		
func _resetPaddleLocations():
	paddle1.reset()
	paddle2.reset()

