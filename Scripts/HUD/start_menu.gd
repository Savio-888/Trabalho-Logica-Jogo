extends Control


func _on_startbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/fases/Fase1.tscn") # Leva à primeira fase do jogo.


func _on_exit_pressed() -> void:
	get_tree().quit() # Sai do jogo.


func _on_tutorial_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/fases/Tutorial.tscn") # Leva ao tutorial do jogo.
