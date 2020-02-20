extends ItemList

func _on_boy_button_focus_entered() -> String:
	PlayerData.set_character("Boy")
	return "Boy"

func _on_girl_button_focus_entered() -> String:
	PlayerData.set_character("Girl")
	return "girl"

func _on_dino_button_focus_entered() -> String:
	PlayerData.set_character("Dino")
	return "Dino"

func _on_knight_button_focus_entered() -> String:
	PlayerData.set_character("Knight")
	return "Knight"

func _on_jack_button_focus_entered() -> String:
	PlayerData.set_character("Jack")
	return "Jack"

func _on_ninja_boy_button_focus_entered() -> String:
	PlayerData.set_character("Ninja_boy")
	return "Ninja_Boy"

func _on_ninja_girl_button_focus_entered() -> String:
	PlayerData.set_character("Ninja_girl")
	return "Ninja_girl"

func _on_robot_button_focus_entered() -> String:
	PlayerData.set_character("Robot")
	return "Robot"

func _on_santa_button_focus_entered() -> String:
	PlayerData.set_character("Santa")
	return "Santa"

func _on_temple_run_boy_button_focus_entered() -> String:
	PlayerData.set_character("Templerun_boy")
	return "Templerun_boy"

func _on_temple_run_girl_button_focus_entered() -> String:
	PlayerData.set_character("Templerun_girl")
	return "Templerun_girl"

func _on_zombie_boy_button_focus_entered() -> String:
	PlayerData.set_character("Zombie_boy")
	return "Zombie_boy"
