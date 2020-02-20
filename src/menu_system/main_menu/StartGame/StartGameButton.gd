extends Button

func _on_Back_pressed() -> void:
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")

func _on_StartButton_pressed() -> void:
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")