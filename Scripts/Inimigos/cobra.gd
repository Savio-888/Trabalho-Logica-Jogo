extends Node2D

# Declaração de variaveis:
@onready var player = get_parent().get_node("Player") # Armazena o Nó do Player.
var player_pos # Usada para armazenar a posição exata do Player.
var target_pos # Usada para armazenar a posição "alvo" da cobra.
@export var max_health: int = 1 # Vida máxima.
@export var speed: float = 500. # Velocidade da Cobra.
var health: int = max_health # Vida atual;

func _process(delta):
	# Movimento da cobra:
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	look_at(player_pos) # Faz a cobra rotacionar na direção do Player
	if position.distance_to(player_pos) > 3:
		position += target_pos * speed * delta
		
	if health == 0: # Checa se a cobra está com 0 de vida, e a tira da cena se estiver.
		queue_free()

func damage(value: int): # Função para tomar dano
	health = clamp(health - value, 0, max_health)
func _on_area_2d_area_entered(area: Area2D) -> void: # Função que checa se a 
	#Area2D da cobra entrou em contato com a do Player.
	if area.is_in_group("player"):
		area.get_parent().damage(1)
		queue_free()
