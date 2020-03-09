extends Button

func _on_Back_pressed() -> void:
	Global.goto_scene("res://src/menu_system/title_screen/TitleScreen.tscn")
	
func _on_Start_pressed() -> void:
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")
