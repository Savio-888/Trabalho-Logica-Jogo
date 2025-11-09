extends TextureProgressBar

@export var character: Node2D

func _process(_delta):
	max_value = character.max_health
	if character.is_in_group('enemy'):
		value = character.health
	else:
		value = float(character.get_child(2).get_child(0).get_child(0).get_child(0).text)
