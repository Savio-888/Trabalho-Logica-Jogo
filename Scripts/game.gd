extends Node2D

# Script principal do overworld do jogo.
func _ready():
	$Spawner.spawn_time = 1.5 # Delay do objecto spawner
func _process(_delta):
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
