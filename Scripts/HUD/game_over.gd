extends Control


func _on_tryagain_pressed() -> void:
	get_tree().change_scene_to_file(Scenemanager.previous_scene_path) # Volta pra cena anterior (fase atual do jogo)


func _on_close_pressed() -> void: # Volta para tela principal.
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
