extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
var returnValue
var speed = 250
var lastHit = "purple"

onready var paddle1 = get_node("../Paddle1")
onready var paddle2 = get_node("../Paddle2")
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0,(0-speed))
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func hit():
	print_debug("ball hit")
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		# if ball hit the outer ring
		if collision.collider.has_method("hit"):
			print_debug("Entered Hit Method")
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
			print_debug("Entered team Method")
			lastHit = collision.collider.getTeam()
			velocity = 1.2 * velocity.bounce(collision.normal)
			
	if(velocity == Vector2(0,0) && lastHit == "yellow" && (Input.is_key_pressed(65) || Input.is_key_pressed(68))):
		velocity = Vector2(0,(speed))
	if(velocity == Vector2(0,0) && lastHit == "purple" && (Input.is_key_pressed(16777233) || Input.is_key_pressed(16777231))):
		velocity = Vector2(0,0-speed)
	#returnValue = move_and_collide(velocity)
	
	#if(returnValue != null):		
		#print(returnValue.get_collider())
	
	pass
	
