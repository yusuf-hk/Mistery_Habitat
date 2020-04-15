extends Button

onready var character = get_node("/root/PlayerData").character

func _on_Back_pressed() -> void:
	PlayerData.setBoughtCharacter(character, true)
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")
	
func _on_Start_pressed() -> void:
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")
