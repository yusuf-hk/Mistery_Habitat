extends Control

var scene_path_to_load

func _ready():
	if (SaveSystem.do_file_exist == false):
		get_node("Menu/LoadGameWarning").show()
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
func _on_Button_pressed(scene_to_load):
	if ("StartGame" in scene_to_load) or ("QuitGame" in scene_to_load):
		scene_path_to_load = scene_to_load
		get_node("Menu/LoadGameWarning").hide()
	elif ("LoadGame" in scene_to_load):
		scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
