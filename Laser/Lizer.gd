extends Area2D

export var speed = 1000

onready var notifier = $VisibilityNotifier2D

func _physics_process(delta):
	position += Vector2.UP * speed * delta
	
	

func _process(delta):
	if not notifier.is_on_screen():
		queue_free()

