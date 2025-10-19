extends Node2D

var type = "PLAYER"
signal health_changed(value: int, max_value: int)
@export var max_health: int = 3
@export var speed: float = 5.0
var health: int = max_health
var bullet_scene = preload("res://Scenes/playerbullet.tscn")

func _ready():
	pass
func _process(_delta):
	# Rotação do Player
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	# Inputs de movimentação:
	if Input.is_action_pressed('up'): # Seta pra cima ou W
		self.position.y -= speed
	if Input.is_action_pressed('down'): # Seta pra baixo ou S
		self.position.y += speed
	if Input.is_action_pressed('left'): # Seta pra esquerda ou A
		self.position.x -= speed
	if Input.is_action_pressed('right'): # Seta pra Direita ou D
		self.position.x += speed
	
	if Input.is_action_just_pressed('shoot'):
		var b = bullet_scene.instantiate()
		b.position = self.position
		get_parent().add_child(b)
		b.global_position = global_position
		b.rotation = rotation
func damage(value: int):
	health = clamp(health - value, 0, max_health)
	health_changed.emit(health, max_health)
