extends Area2D


var speed: float = 450
var life: int = 3
var vel := Vector2(0, 0)
onready var animation = $AnimationPlayer


func _physics_process(delta):
	var dirVec := Vector2(0, 0)
	if Input.is_action_pressed("player_left"):
		dirVec.x = -1
	elif Input.is_action_pressed("player_right"):
		dirVec.x = 1
	if Input.is_action_pressed("player_up"):
		dirVec.y = -1
	elif Input.is_action_pressed("player_down"):
		dirVec.y = 1
		
	vel = dirVec.normalized() * speed
	position += vel * delta 
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x)
	position.y = clamp(position.y, 325, viewRect.size.y)
	
	
	if vel.x < 0:
		animation.play("Left")
	elif vel.x > 0:
		animation.play("Right")
	else:
		animation.play("Stop")

func damage(amount: int):
	life -= amount
	

func _process(delta):
	if life == 0:
		queue_free()

func _on_Player_area_entered(area):
	if area.is_in_group("damageable"):
		area.queue_free()
		life -= 1

