extends Node2D
# Script principal do overworld do jogo.
@export var next_scene: PackedScene
var music: Resource = load("res://Music/Trilha-Floresta.mp3")
@onready var cobra = preload("res://Scenes/inimigos/cobra.tscn")
@onready var tigre = preload("res://Scenes/inimigos/tigre.tscn")
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
	var cobra_instance1 = cobra.instantiate()
	add_child(cobra_instance1) # adiciona o primeiro a cena
	cobra_instance1.position = node.position # define a posição, com base no marcador escolhido
	node = nodes[randi() % nodes.size()]
	var cobra_instance2 = cobra.instantiate()
	add_child(cobra_instance2) # adiciona o segundo a cena
	cobra_instance2.position = node.position # define a posição, com base no marcador escolhido
func _on_timer2_timeout() -> void: # função chamada quando o segundo timer de Spawner acaba:
	var nodes = get_tree().get_nodes_in_group('spawn')
	var node = nodes[randi() % nodes.size()]
	var tigre_instance = tigre.instantiate()
	add_child(tigre_instance) # adiciona a cena
	tigre_instance.position = node.position
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
