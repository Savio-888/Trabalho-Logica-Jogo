extends Node2D

@export var spawn_time: float = 4.0
@export var enemy_scene: Resource = load("res://Scenes/inimigos/enemy1.tscn")
@export var Erase_Spawner_After: float = 10.0

func _ready():
	$Timer.set_wait_time(spawn_time)
	$Timer.start()
	$Timer_spawner.set_wait_time(Erase_Spawner_After)
	$Timer_spawner.start()
	
func timeout() -> void:
	var e = enemy_scene.instantiate()
	e.position = self.position
	e.rotation = self.rotation
	owner.add_child(e)

func timer_spawner_timeout() -> void:
	queue_free()
