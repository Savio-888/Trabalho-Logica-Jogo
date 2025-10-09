extends Node2D
func _ready(): # Função chamada no começo da cena (ou quando ela entra em outra cena)
	pass
func _process(_delta):
	self.position = get_global_mouse_position()
