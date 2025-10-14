extends Node2D

# Script base do primeiro inimigo do jogo. Conforme eu for criando mais inimigos
# eu vou mudando o script. Mas essa é a base.

var bullet_scene = preload("res://Scenes/bullet.tscn")
var dir = Vector2(0, 4)
func _ready():
	$Timer.set_wait_time(1)
	$Timer.start()
func _process(_delta):
	self.position += dir.rotated(self.rotation)
func spawn_bullets():
	var b1 = bullet_scene.instantiate()
	b1.position = self.position
	b1.rotation = self.rotation
	b1.dir = Vector2(.5, 6)
	
	var b2 = bullet_scene.instantiate()
	b2.position = self.position
	b2.rotation = self.rotation
	b2.dir = Vector2(-.5, 6)
	
	get_parent().add_child(b1)
	get_parent().add_child(b2)

func timeout() -> void:
	spawn_bullets()
