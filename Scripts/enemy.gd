extends Node2D

# Script base do primeiro inimigo do jogo. Conforme eu for criando mais inimigos
# eu vou mudando o script. Mas essa é a base.

var bullet_scene = preload("res://Scenes/bullet.tscn")
func _ready():
	pass
func _process(_delta):
	rotate(.1)
	var b = bullet_scene.instantiate()
	b.position = self.position
	b.rotation = self.rotation
	get_parent().add_child(b)
