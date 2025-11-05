extends Node2D
# Script principal do overworld do jogo.
@export var next_scene: PackedScene
var music: Resource = load("res://Music/Trilha-Vulcão.mp3")
func _ready():
	Scenemanager.previous_scene_path = get_tree().current_scene.scene_file_path
	BgMusic.stream = music
	BgMusic.play()
func _process(_delta):
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")


func _on_timer_timeout() -> void:
	$Spawner.queue_free()
	$Spawner2.queue_free()
	$Spawner3.queue_free()
	$Spawner4.queue_free()
	$Label.visible = true
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_packed(next_scene)
