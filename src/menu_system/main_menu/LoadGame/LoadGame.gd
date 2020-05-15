extends Node
"""
Checks if the load save game is existing in the folder system
if exist, it will load the player data and change to the habitat
if not, it will return to the title screen
"""
func _ready() -> void:
	var file2Check = File.new()
	var doFileExists = file2Check.file_exists("user://json.json")
	var doFileExists2 = file2Check.file_exists("user://loadscene.tscn")
	if doFileExists and doFileExists2:
		SaveSystem.do_file_exist = true
		SaveSystem.loadgame()
	else:
		SaveSystem.do_file_exist = false
		get_tree().change_scene("res://src/menu_system/title_screen/TitleScreen.tscn")