extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var velocity = Vector2()
var returnValue
var speed = 350
var lastHit = "yellow"

onready var paddle1 = get_node("../Paddle1")
onready var paddle2 = get_node("../Paddle2")
onready var Ring = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P")

onready var yelRing = load("res://Sprites/SpriteSheets/OuterRingPtoY.png")
onready var purpRing = load("res://Sprites/SpriteSheets/OuterRingYtoP.png")
onready var animate = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P/AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	#velocity = Vector2(0,(speed))
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		# if ball hit the outer ring
		if collision.collider.has_method("hit"):
			get_node("../OuterRing/CollisionPolygon2D/OuterRing_P/AudioStreamPlayer2D").play()
			collision.collider.hit(lastHit)
			velocity = Vector2(0,0)
			$CollisionShape2D.disabled = true
			get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("Exit")
			var g = Timer.new()
			g.set_wait_time(.4)
			g.set_one_shot(true)
			add_child(g)
			g.start()
			yield(g, "timeout")
			velocity = Vector2(0,lastHit)
			$CollisionShape2D.disabled = false
			# repositions ball to center of game, offset up if purple scored or down if yellow scored
			# ? will call logic from gameManager to update game score, reposition paddles after a score?
			if lastHit == "yellow":
				position = Vector2(0, 100) #100
				paddle1.reset()
				paddle2.reset()
				get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("Enter")
				var t = Timer.new()
				t.set_wait_time(.4)
				t.set_one_shot(true)
				add_child(t)
				t.start()
				yield(t, "timeout")
				get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("ballRotate")
				#if(Input.is_key_pressed(83)):
				#velocity = Vector2(0,(0-speed))
			elif lastHit == "purple":
				position = Vector2(0,-100) #-100
				paddle2.reset()
				paddle1.reset()
				get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("Enter")
				var t = Timer.new()
				t.set_wait_time(.4)
				t.set_one_shot(true)
				add_child(t)
				t.start()
				yield(t, "timeout")
				get_node("CollisionShape2D/ballSprite/AnimationPlayer").play("ballRotate")
				#if Input.is_key_pressed(16777234):
				#velocity = Vector2(0,speed)
		# if ball hits a paddle
		elif collision.collider.has_method("getTeam"):
			lastHit = collision.collider.getTeam()
			if(lastHit == "purple"):
				get_node("../Paddle1/CollisionShape2D/paddleSpriteP/AudioStreamPlayer2D").play()
				get_node("../Paddle1/CollisionShape2D").disabled = true
				get_node("../Paddle2/CollisionShape2D").disabled = false
				animate.play("changeColor")
				Ring.texture = yelRing
			elif(lastHit == "yellow"):
				get_node("../Paddle2/CollisionShape2D/paddleSpriteY/AudioStreamPlayer2D").play()
				get_node("../Paddle2/CollisionShape2D").disabled = true
				get_node("../Paddle1/CollisionShape2D").disabled = false
				animate.play("changeColor")
				Ring.texture = purpRing
			velocity = 1.03 * velocity.bounce(collision.normal)
			
		elif collision.collider.has_method("middleStar"):
			get_node("../Middle Star/CollisionShape2D/Sprite/AudioStreamPlayer2D").play()
			var temp
			var collisionNode = get_node("../Middle Star/CollisionShape2D")
			collisionNode.disabled = true
			temp = collision.collider.middleStar(velocity)
			velocity = temp;
			var t = Timer.new()
			t.set_wait_time(2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			collisionNode.disabled = false

			
		elif collision.collider.has_method("throughWormhole"):
			print_debug("teleport collide")
			get_node("CollisionShape2D/ballSprite/Wormhole sounds").play()
			var temp
			var wormhole1 = get_node("../Wormholes/Wormhole1/CollisionShape2D")
			var wormhole2 = get_node("../Wormholes/Wormhole2/CollisionShape2D")
			wormhole1.disabled = true
			wormhole2.disabled = true
			temp = collision.collider.throughWormhole()
			
			position = temp
			if velocity.length() > 400: 
				velocity *= .9
			var t = Timer.new()
			t.set_wait_time(.2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			wormhole1.disabled = false
			wormhole2.disabled = false
	
			pass
			
		elif collision.collider.has_method("speedracer"):
			get_node("CollisionShape2D/ballSprite/speedracer").play()
			$CollisionShape2D.disabled = true
			velocity = velocity * 2.0
			
			var t = Timer.new()
			t.set_wait_time(.2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			velocity = velocity * .625
			$CollisionShape2D.disabled = false
			pass

			
			
			
	if(velocity == Vector2(0,0) && lastHit == "yellow" && (Input.is_key_pressed(65) || Input.is_key_pressed(68))):
		velocity = Vector2(0,(speed))
	if(velocity == Vector2(0,0) && lastHit == "purple" && (Input.is_key_pressed(16777233) || Input.is_key_pressed(16777231))):
		velocity = Vector2(0,0-speed)

	pass


