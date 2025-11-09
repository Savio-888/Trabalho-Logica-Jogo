extends Node2D

var type = "PLAYER"
signal health_changed(value: int, max_value: int)
var max_health: int = 6
@export var speed: float = 10.0
@onready var screen_size = get_viewport_rect().size
var health: int = max_health
var bullet_scene = preload("res://Scenes/playerbullet.tscn")
var horizontal : float
var vertical: float

func _ready():
	pass
func _process(_delta):
	# Variavéis para o movimento do player:
	horizontal = Input.get_action_strength("right") - Input.get_action_strength("left")
	vertical = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Fazendo com que o player não consiga sair da tela:
	var player_size = $Area2D/CollisionShape2D.shape.size
	position.x = clamp(position.x, player_size.x, screen_size.x - player_size.x)
	position.y = clamp(position.y, player_size.y, screen_size.y - player_size.y)
	look_at(get_global_mouse_position())
	if rotation_degrees >= 90 or rotation_degrees <= -90:
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
	
	# Inputs de movimentação:
	position += Vector2(horizontal*speed, vertical*speed)
	# Ações do Player
	if Input.is_action_just_pressed('shoot'): # Projétil
		var b = bullet_scene.instantiate()
		b.position = self.position
		get_parent().add_child(b)
		b.global_position = global_position
func damage(value: int):
	health = clamp(health - value, 0, max_health)
	health_changed.emit(health, max_health)
