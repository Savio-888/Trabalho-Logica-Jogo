extends Node2D

# Script principal do overworld do jogo.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Tira o mouse da tela
	$Spawner.spawn_time = 1.5
	# enquanto ele estiver dentro da janela
