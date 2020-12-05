extends Node


var meteor :=preload("res://Meteor/Meteor.tscn")

onready var screen_size = get_viewport().get_viewport().size
onready var timer = $SpawnTimer

func _process(delta):
	if timer.is_stopped():
		_spawn()
		


func _spawn():

	var rand = RandomNumberGenerator.new()
	
	var enemy =meteor.instance()
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)
	var y = -100
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
	timer.start()
