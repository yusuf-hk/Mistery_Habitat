extends Button

onready var character = PlayerData.character


func _on_Back_pressed() -> void:
	get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")
	
func _on_Start_pressed() -> void:
	PlayerData.current_habitat = "Tutorial"
	SaveSystem.save()
	Global.load_scene("res://src/Tutorial/Tutorial.tscn")
	
