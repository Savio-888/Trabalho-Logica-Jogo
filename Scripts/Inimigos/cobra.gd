extends Node2D

# Script do inimigo cobra da primeira fase
var type = "ENEMY"
@onready var player = get_parent().get_node("Player")
var player_pos
var target_pos
@export var max_health: int = 1
@export var speed: float = 500.
var health: int = max_health

func _ready():
	pass
func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	if position.distance_to(player_pos) > 3:
		position += target_pos * speed * delta
	if health == 0:
		queue_free()
func damage(value: int):
	health = clamp(health - value, 0, max_health)
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.get_parent().damage(1)
		queue_free()
