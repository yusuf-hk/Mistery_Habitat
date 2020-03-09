extends Button

func _on_RetryButton_pressed() -> void:
	pass

func _on_ShopButton_pressed() -> void:
	pass

func _on_BackToMainMenuButton_pressed() -> void:
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")

func _on_QuitButton_pressed() -> void:
	pass
