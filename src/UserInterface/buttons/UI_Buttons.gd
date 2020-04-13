extends Node

func _on_RetryButton_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_ShopButton_pressed() -> void:
	get_parent().get_parent().get_parent().get_node("PauseOverlay").visible = false
	get_parent().get_parent().get_parent().get_node("Shop").visible = true

func _on_BackToMainMenuButton_pressed() -> void:
	get_owner().set_paused(false)
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")

func _on_QuitButton_pressed() -> void:
	get_tree().quit()
