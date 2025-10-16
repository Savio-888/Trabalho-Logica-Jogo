extends Node2D

var type = "PLAYER"
signal vida_mudada(value: int, max_value: int)
@export var vida_max: int = 3
@export var vel: float = 5.0
var vida: int = vida_max

func _ready():
	pass
func _process(_delta):
	# Inputs de movimentação:
	if Input.is_action_pressed('up'): # Seta pra cima ou W
		self.position.y -= vel
	if Input.is_action_pressed('down'): # Seta pra baixo ou S
		self.position.y += vel
	if Input.is_action_pressed('left'): # Seta pra esquerda ou A
		self.position.x -= vel
	if Input.is_action_pressed('right'): # Seta pra Direita ou D
		self.position.x += vel
func tomar_dano(quant: int):
	vida = clamp(vida - quant, 0, vida_max)
	vida_mudada.emit(vida, vida_max)
