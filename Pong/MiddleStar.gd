extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var randomDir = Vector2(0,0)
var animator
var thread
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func middleStar(vector):
	var angle = rand_range(-(PI/2), (PI/2))
	
	randomDir = vector.rotated(angle)
	animator = get_node("CollisionShape2D/Sprite/AnimationPlayer")
	thread =  Thread.new()
	thread.start(self,"_thread_function")
	return randomDir
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _thread_function(userdata):
	print_debug("threading")
	animator.play("Exploding")
	var t = Timer.new()
	t.set_wait_time(1.4)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	animator.play("IdleSun")
