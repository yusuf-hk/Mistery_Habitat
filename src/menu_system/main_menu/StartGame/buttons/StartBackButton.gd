extends Button

onready var character = get_node("/root/PlayerData").character

func _on_Back_pressed() -> void:
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")
	PlayerData.setBoughtCharacter(character, true)
	
func _on_Start_pressed() -> void:
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")
