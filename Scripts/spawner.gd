extends Node2D

var spawn_time = 4
var enemy_scene = load("res://Scenes/enemy1.tscn")

func _ready():
	$Timer.set_wait_time(spawn_time)
	$Timer.start()
	pass
func _process(_delta):
	pass
func timeout() -> void:
	var e = enemy_scene.instantiate()
	e.position = self.position
	e.rotation = self.rotation
	get_parent().add_child(e)
