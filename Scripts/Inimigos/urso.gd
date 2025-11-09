extends Node2D

# Script do inimigo cobra da primeira fase
var type = "ENEMY"
@onready var player = get_parent().get_node("Player")
var player_pos
var target_pos
@export var max_health: int = 150
@export var speed: float = 200.
var health: int = max_health
var isMoving = false
var bullet_scene = preload("res://Scenes/ursobullet.tscn")

func _ready():
	$"Bullet Timer".start(1)
func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	if isMoving == true:
		$"Bullet Timer".stop()
		if position.distance_to(player_pos) > 3:
			position += target_pos * speed * delta
	else:
		$Node2D.rotation_degrees += 5
	if health == 0:
		queue_free()
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.direction = ($Node2D/Marker2D.global_position - global_position).normalized()
	bullet.global_position = $Node2D/Marker2D.global_position
	get_tree().get_root().add_child(bullet)
func damage(value: int):
	health = clamp(health - value, 0, max_health)
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.get_parent().damage(1)
func _on_timer_timeout() -> void:
	isMoving = not isMoving
	$"Bullet Timer".start(1)
func _on_bullet_timer_timeout() -> void:
	shoot()
	$"Bullet Timer".start(0.1)
