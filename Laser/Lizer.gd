extends Area2D

class_name Lizer
export var speed = 1000

onready var notifier = $VisibilityNotifier2D

func _physics_process(delta):
	position += Vector2.UP * speed * delta
	
	

func _process(delta):
	if not notifier.is_on_screen():
		queue_free()




func _on_Lizer_area_entered(area):
	if area.is_in_group("damageable"):
		area.damage(10)
		queue_free()
	
