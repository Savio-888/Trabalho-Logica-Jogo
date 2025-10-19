extends Node2D

# Script base do primeiro inimigo do jogo. Conforme eu for criando mais inimigos
# eu vou mudando o script. Mas essa é a base.

var bullet_scene = preload("res://Scenes/enemybullet.tscn")
var dir = Vector2(0, 4)
var type = "ENEMY"
@export var bullet_speed: float = 10
@export var bullet_spread: float = 0.5
@export var bullet_spawn_time: float = 0.4
@export var max_health: int = 1
var health: int = max_health
func _ready():
	$Timer.set_wait_time(bullet_spawn_time)
	$Timer.start()
func _process(_delta):
	self.position += dir.rotated(self.rotation)
	if health == 0:
		queue_free()
func spawn_bullets():
	var b1 = bullet_scene.instantiate()
	b1.position = self.position
	b1.rotation = self.rotation
	b1.dir = Vector2(bullet_spread, bullet_speed)
	
	var b2 = bullet_scene.instantiate()
	b2.position = self.position
	b2.rotation = self.rotation
	b2.dir = Vector2(bullet_spread*-1, bullet_speed)
	
	get_parent().add_child(b1)
	get_parent().add_child(b2)
func timeout() -> void:
	spawn_bullets()

func damage(value: int):
	health = clamp(health - value, 0, max_health)
