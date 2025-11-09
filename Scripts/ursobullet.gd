extends Node2D

# Script base da bala dos inimigos.
var direction = Vector2.RIGHT
var speed = 400

func _ready():
	pass

func _process(delta):
	translate(direction.normalized() * speed * delta)
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group('player'):
		area.get_parent().damage(1)
		queue_free()
