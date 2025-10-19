extends Node2D

var speed = 2000
func _ready():
	pass

func _process(delta):
	self.position += transform.x * speed * delta # Define posição e rotação, baseado na direção em que foi lançado.
	if($RayCast2D.is_colliding()): # Checa se o Raycast (colisão da bala) entrou em contato com alguma outra coisa (o player).
		var collid = $RayCast2D.get_collider().get_parent()
		if collid.type == "ENEMY":
			collid.damage(1)
			queue_free()
