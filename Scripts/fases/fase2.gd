extends Node2D
# Script principal do overworld do jogo.
@export var next_scene: PackedScene
var music: Resource = load("res://Music/Trilha-Vulcão.mp3")
var enemy = preload("res://Scenes/inimigos/enemy1.tscn")
func _ready():
	# Armazenando cena para a tela de Game Over:
	Scenemanager.previous_scene_path = get_tree().current_scene.scene_file_path
	
	# Trocando a música atual:
	BgMusic.stream = music
	BgMusic.play()
func _process(_delta):
	# Checando se o player perdeu, e trocando a cena caso tenha:
	if $Player/HUD/BarradeVida/UI/barravida.text == str(0):
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
func _on_timer_timeout() -> void: # função chamada quando o primeiro timer de Spawner acaba:
	# Pegando os marcadores na cena, e escolhendo um aleátorio para cada inimigo:
	var nodes = get_tree().get_nodes_in_group('spawn')
	var node = nodes[randi() % nodes.size()]
	var pos = node.position
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance) # adiciona o inimigo a cena
	enemy_instance.position = pos # define a posição, com base no marcador escolhido
func _on_timer2_timeout() -> void:
	var nodes = get_tree().get_nodes_in_group('spawn')
	var node = nodes[randi() % nodes.size()]
	var pos = node.position
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.position = pos
func _on_overworld_timer_timeout() -> void: # função chamada quando o tempo da fase em si acaba:
	$Label.visible = true
	$Timer_spawner1.queue_free()
	$Timer_spawner2.queue_free()
	var nodes = get_tree().get_nodes_in_group('spawn') # pega todos os 'spawners'
	var enemies = get_tree().get_nodes_in_group('enemy') # pega todos os inimigos.
	for node in nodes: # apaga todos os nós da Array criada.
		node.queue_free()
	for node in enemies:
		node.queue_free()
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_packed(next_scene) # Chamando a próxima fase
