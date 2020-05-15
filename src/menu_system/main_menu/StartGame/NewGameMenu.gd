extends Control

onready var text = $"VBoxContainer/Chosen character text"

func _on_BoyButton_focus_entered() -> void:
	PlayerData.set_character("Boy")
	text.text = "You have chosen: Boy"

func _on_GirlButton_focus_entered() -> void:
	PlayerData.set_character("Girl")
	text.text = "You have chosen: Girl"

func _on_BackToMainMenuButton_pressed() -> void:
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")

func _on_StartGameButton_pressed() -> void:
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")
	PlayerData.setBoughtCharacter(PlayerData.character, true)
