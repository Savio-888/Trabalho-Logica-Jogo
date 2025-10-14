extends Node2D

# Script base da bala dos inimigos.
var dir = Vector2(1, 0)

func _ready():
	pass

func _process(_delta):
	self.position += dir.rotated(self.rotation) # Define posição e rotação, baseado na direção em que foi lançado.
	if($RayCast2D.is_colliding()): # Checa se o Raycast (colisão da bala) entrou em contato com alguma outra coisa (o player).
		print('HIT!!') # Isso é so pra teste só.
