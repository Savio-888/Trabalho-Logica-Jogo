extends Node2D
# Script principal do overworld da fase.
@export var next_scene: String
var step: int = 0
var isSpawner = null
func _ready():
	Scenemanager.previous_scene_path = get_tree().current_scene.scene_file_path
func _process(_delta):
	steps(step)
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	
func steps(step_num): # Etapas do Tutorial.
	match step_num:
		0:
			if $Player.horizontal != 0 or $Player.vertical != 0:
				$MarginContainer/andar.visible = false
				$MarginContainer/atirar.visible = true
				step += 1
		1:
			if Input.is_action_just_pressed('shoot'):
				$MarginContainer/atirar.visible = false
				$MarginContainer/inimigos.visible = true
				step += 1
		2:
			$Spawner.process_mode = Node.PROCESS_MODE_INHERIT
			$Timer.start()
			step += 1


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(next_scene)
