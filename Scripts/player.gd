extends Node2D
func _ready():
	pass
func _process(_delta):
	self.position = get_global_mouse_position() # Pega a posição do mouse, 
	# e transforma na posição do player na tela.
