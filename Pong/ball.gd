extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
var returnValue
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(speed,speed)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			print("Entered Hit Method")
			collision.collider.hit()

	#returnValue = move_and_collide(velocity)
	
	#if(returnValue != null):		
		#print(returnValue.get_collider())
	
	pass
