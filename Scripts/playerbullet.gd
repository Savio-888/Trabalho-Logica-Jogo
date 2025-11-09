extends Node2D

var speed = 5000
func _ready():
	look_at(get_global_mouse_position())

func _process(delta):
	self.position += transform.x * speed * delta # Define posição, baseado na direção em que foi lançado.


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.get_parent().damage(1)
		queue_free()
