extends Node2D
var bullet_scene = preload("res://Scenes/bullet.tscn")
func _ready():
	pass
func _process(_delta):
	rotate(.05)
	var b = bullet_scene.instantiate()
	b.position.x += 100
	add_child(b)
