extends Node2D
# Script principal do overworld do jogo.
@export var next_scene: PackedScene
var isComplete = false
var music: Resource = load("res://Music/Trilha-Gelo.mp3")
func _ready():
	Scenemanager.previous_scene_path = get_tree().current_scene.scene_file_path
	BgMusic.stream = music
	BgMusic.play()
func _process(_delta):
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	if get_node_or_null('Urso') == null and isComplete == false:
		$Label.visible = true
		isComplete = true
		finish_game()
func finish_game():
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
