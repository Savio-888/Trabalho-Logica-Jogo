extends Node2D

# Script base do projétil dos inimigos.
var dir = Vector2(5, 5) # Variável que da direção ao projétil.

func _process(_delta):
	self.position += dir.rotated(self.rotation) # Define posição e rotação, baseado na direção em que foi lançado.
func _on_area_2d_area_entered(area: Area2D) -> void: # Função que checa se a 
	# Area2D do projétil entrou em contato com a do Player.
	if area.is_in_group('player'):
		area.get_parent().damage(1)
		queue_free()
