extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
var returnValue
var speed = 100
var lastHit = "purple"

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(speed,speed)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func hit():
	print_debug("ball hit")
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		
		# if ball hit the outer ring
		if collision.collider.has_method("hit"):
			print("Entered Hit Method")
			collision.collider.hit(lastHit)
			velocity = Vector2(0,lastHit)
			
			# repositions ball to center of game, offset up if purple scored or down if yellow scored
			# ? will call logic from gameManager to update game score, reposition paddles after a score?
			if lastHit == "yellow":
				set_pos(0,1)
			elif lastHit == "purple":
				set_pos(0,-1)
		
		# if ball hits a paddle
		if collision.collider.has_method("getTeam"):
			lastHit = collision.collider.getTeam()
			

	#returnValue = move_and_collide(velocity)
	
	#if(returnValue != null):		
		#print(returnValue.get_collider())
	
	pass
	
