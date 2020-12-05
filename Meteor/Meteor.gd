extends Area2D

var maxSpeed_x: float = 15
var minSpeed_x: float = -15
var minSpeed_y: float = 20
var maxSpeed_y: float = 60
var minRotationRate: float = -30
var maxRotationRate: float = 30

var life: int = 100
var speed_y: float = 0
var rotationRate: float = 0
var speed_x: float = 0


func _ready():
	speed_y = rand_range(minSpeed_y, maxSpeed_y)
	rotationRate = rand_range(minRotationRate, maxRotationRate)
	speed_x = rand_range(minSpeed_x, maxSpeed_x)
func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	position.y += speed_y * delta
	position.x += speed_x * delta  

func _on_VisibilityNotifier2D_screen_exit():
	queue_free()

func damage(amount: int):
	if life <= 0: 
		return
	
	life -= amount 
	if life <= 0:
		queue_free()


