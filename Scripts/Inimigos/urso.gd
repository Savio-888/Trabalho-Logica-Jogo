extends Node2D

# Script do inimigo cobra da primeira fase
var type = "ENEMY"
@onready var player = get_parent().get_node("Player")
var player_pos
var target_pos
@export var max_health: int = 50
@export var speed: float = 100.
var health: int = max_health
var isMoving = false

func _ready():
	pass
func _process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	if isMoving == true:
		if position.distance_to(player_pos) > 6:
			position += target_pos * speed * delta
	if health == 0:
		queue_free()
func damage(value: int):
	health = clamp(health - value, 0, max_health)
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.get_parent().damage(1)
func _on_timer_timeout() -> void:
	isMoving = not isMoving
