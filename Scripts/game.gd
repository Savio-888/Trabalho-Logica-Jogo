extends Node2D

# Script principal do overworld do jogo.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Tira o mouse da tela
	# enquanto ele estiver dentro da janela
	$Objects/Spawner.spawn_time = 1.5
func _process(_delta):
	if $Objects/Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
