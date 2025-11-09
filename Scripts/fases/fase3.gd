extends Node2D
# Script principal do overworld do jogo.
@export var next_scene: PackedScene
var isComplete = false
var music: Resource = load("res://Music/Trilha-Gelo.mp3")
var enemy = preload("res://Scenes/inimigos/enemy1.tscn")
var cobra = preload("res://Scenes/inimigos/cobra.tscn")
var tigre = preload('res://Scenes/inimigos/tigre.tscn')
func _ready():
	# Armazenando cena para a tela de Game Over:
	Scenemanager.previous_scene_path = get_tree().current_scene.scene_file_path
	
	# Trocando a música atual:
	BgMusic.stream = music
	BgMusic.play()
func _process(_delta):
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	if get_node_or_null('Urso') == null and isComplete == false:
		$Label.visible = true
		isComplete = true
		finish_game()
func _on_timer_timeout() -> void:
	var nodes = get_tree().get_nodes_in_group('spawn')
	var node = nodes[randi() % nodes.size()]
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.position = node.position
	
	node = nodes[randi() % nodes.size()]
	var cobra_instance = cobra.instantiate()
	add_child(cobra_instance)
	cobra_instance.position = node.position
func _on_timer2_timeout() -> void:
	var nodes = get_tree().get_nodes_in_group('spawn')
	var node = nodes[randi() % nodes.size()]
	var tigre_instance = tigre.instantiate()
	add_child(tigre_instance)
	tigre_instance.position = node.position
func _on_overworld_timer_timeout() -> void:
	$Label.visible = true
	$Timer_spawner1.queue_free()
	$Timer_spawner2.queue_free()
	var nodes = get_tree().get_nodes_in_group('spawn')
	var enemies = get_tree().get_nodes_in_group('enemy')
	for node in nodes:
		node.queue_free()
	for node in enemies:
		node.queue_free()
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_packed(next_scene)
func finish_game():
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
