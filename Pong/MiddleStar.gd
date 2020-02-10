extends KinematicBody2D

var randomDir = Vector2(0,0)
var animator
var thread

func middleStar(vector):
	var angle = rand_range(-(PI/2), (PI/2))
	
	randomDir = vector.rotated(angle)
	animator = get_node("CollisionShape2D/Sprite/AnimationPlayer")
	thread = Thread.new()
	thread.start(self,"_thread_function")
	return randomDir

func _thread_function(userdata):
	
	#Reference to a thread object was lost
	#ERROR TODO
	
	print_debug("threading")
	animator.play("Exploding")
	var t = Timer.new()
	t.set_wait_time(1.4)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	animator.play("IdleSun")
