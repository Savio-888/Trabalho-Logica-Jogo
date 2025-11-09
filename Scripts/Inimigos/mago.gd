extends Node2D

# Script base do mago.

var bullet_scene = preload("res://Scenes/enemybullet.tscn")
var speed = 250
var type = "ENEMY"
@onready var player = get_parent().get_node("Player")
var player_pos
var target_pos
@export var bullet_speed: float = 10
@export var bullet_spawn_time: float = 1
@export var max_health: int = 2
var health: int = max_health
func _ready():
	$Timer.set_wait_time(bullet_spawn_time)
	$Timer.start()
func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	if position.distance_to(player_pos) > 3:
		position += target_pos * speed * delta
	look_at(player_pos)
	if health == 0:
		queue_free()
func spawn_bullets():
	var b1 = bullet_scene.instantiate()
	b1.position = self.position
	b1.rotation = self.rotation
	b1.dir = Vector2(bullet_speed, 0)
	
	get_parent().add_child(b1)
func timeout() -> void:
	spawn_bullets()

func damage(value: int):
	health = clamp(health - value, 0, max_health)
	$Barra.visible = true
