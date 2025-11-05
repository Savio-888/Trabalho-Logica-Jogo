extends Control


func _on_startbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/fases/Fase1.tscn")


func _on_menu_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_tutorial_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/fases/Tutorial.tscn")
