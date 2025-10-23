extends Node2D

var type = "PLAYER"
signal health_changed(value: int, max_value: int)
@export var max_health: int = 3
@export var speed: float = 5.0
var health: int = max_health
var bullet_scene = preload("res://Scenes/playerbullet.tscn")
var horizontal : float
var vertical: float

func _ready():
	pass
func _process(_delta):
	horizontal = Input.get_action_strength("right") - Input.get_action_strength("left")
	vertical = Input.get_action_strength("down") - Input.get_action_strength("up")
	# Rotação do Player
	look_at(get_global_mouse_position()) # Pega a posição do mouse, e faz o personagem olhar em direção a ele.
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	# Inputs de movimentação:
	position += Vector2(horizontal*speed, vertical*speed)
	# Ações do Player
	if Input.is_action_just_pressed('shoot'): # Projétil
		var b = bullet_scene.instantiate()
		b.position = self.position
		get_parent().add_child(b)
		b.global_position = global_position
		b.rotation = rotation
func damage(value: int):
	health = clamp(health - value, 0, max_health)
	health_changed.emit(health, max_health)
