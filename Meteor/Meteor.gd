extends Area2D

var maxSpeed_x2: float = 15
var minSpeed_x2: float = -15
var minSpeed_y: float = 20
var maxSpeed_y: float = 60
var minRotationRate: float = -30
var maxRotationRate: float = 30

var live: int = 10
var speed_y: float = 0
var rotationRate: float = 0
var speed_x1: float = 0
var speed_x2: float = 0 


func _ready():
	speed_y = rand_range(minSpeed_y, maxSpeed_y)
	rotationRate = rand_range(minRotationRate, maxRotationRate)
	speed_x2 = rand_range(minSpeed_x2, maxSpeed_x2)
func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	position.y += speed_y * delta
	position.x += speed_x2 * delta  

func _on_VisibilityNotifier2D_screen_exit():
	queue_free()
