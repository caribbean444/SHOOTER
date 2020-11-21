extends Area2D

onready var animatedSprite = $AnimatedSpite

var speed: float = 350
var life: int = 3
var vel := Vector2(0, 0)



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
