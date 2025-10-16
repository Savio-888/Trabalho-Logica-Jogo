extends CanvasLayer

@onready var player : Node2D = $".."
@onready var barravida: Label = %barravida
func _ready():
	player.vida_mudada.connect(se_vida_muda)

func se_vida_muda(value: int, max_value: int):
	barravida.text = str(value)
