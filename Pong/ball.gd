extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var velocity = Vector2()
var returnValue
var speed = 250
var lastHit = "purple"

onready var paddle1 = get_node("../Paddle1")
onready var paddle2 = get_node("../Paddle2")
onready var Ring = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P")

onready var yelRing = load("res://Sprites/SpriteSheets/OuterRingPtoY.png")
onready var purpRing = load("res://Sprites/SpriteSheets/OuterRingYtoP.png")
onready var animate = get_node("../OuterRing/CollisionPolygon2D/OuterRing_P/AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0,(speed))
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		# if ball hit the outer ring
		if collision.collider.has_method("hit"):
			collision.collider.hit(lastHit)
			velocity = Vector2(0,lastHit)
			
			# repositions ball to center of game, offset up if purple scored or down if yellow scored
			# ? will call logic from gameManager to update game score, reposition paddles after a score?
			if lastHit == "yellow":
				position = Vector2(0,100)
				paddle1.reset()
				paddle2.reset()
				#if(Input.is_key_pressed(83)):
				#velocity = Vector2(0,(0-speed))
			elif lastHit == "purple":
				position = Vector2(0,-100)
				paddle2.reset()
				paddle1.reset()
				#if Input.is_key_pressed(16777234):
				#velocity = Vector2(0,speed)
		# if ball hits a paddle
		if collision.collider.has_method("getTeam"):
			lastHit = collision.collider.getTeam()
			if(lastHit == "purple"):
				animate.play("changeColor")
				Ring.texture = yelRing
			elif(lastHit == "yellow"):
				animate.play("changeColor")
				Ring.texture = purpRing
			velocity = 1.1 * velocity.bounce(collision.normal)
		if collision.collider.has_method("middleStar"):
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
		if collision.collider.has_method("throughWormhole"):
			var temp
			temp = collision.collider.throughWormhole()
			$CollisionShape2D.disabled = true
			position = temp
			var t = Timer.new()
			t.set_wait_time(.2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			$CollisionShape2D.disabled = false
			pass
		if collision.collider.has_method("speedracer"):
			$CollisionShape2D.disabled = true
			var t = Timer.new()
			t.set_wait_time(.2)
			t.set_one_shot(true)
			add_child(t)
			t.start()
			yield(t, "timeout")
			$CollisionShape2D.disabled = false
			velocity *= 1.1
			pass

			
			
			
	if(velocity == Vector2(0,0) && lastHit == "yellow" && (Input.is_key_pressed(65) || Input.is_key_pressed(68))):
		velocity = Vector2(0,(speed))
	if(velocity == Vector2(0,0) && lastHit == "purple" && (Input.is_key_pressed(16777233) || Input.is_key_pressed(16777231))):
		velocity = Vector2(0,0-speed)

	pass


