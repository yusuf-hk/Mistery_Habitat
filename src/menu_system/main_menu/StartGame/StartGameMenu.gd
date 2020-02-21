extends Control

var array = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]

onready var what_character = get_node("/root/PlayerData").get_character()

func _ready() -> void:
	turn_on_sprite()
	turn_off_sprite()

func turn_on_sprite() -> void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character == some_character:
			some_character = "VBoxContainer/HBoxContainer/CenterContainer/CharacterModel/Sprite/" + some_character
			get_node(some_character).visible = true

func turn_off_sprite() -> void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character != some_character:
			some_character = "VBoxContainer/HBoxContainer/CenterContainer/CharacterModel/Sprite/" + some_character
			get_node(some_character).visible = false
			
func _on_BoyButton_focus_entered() -> String:
	PlayerData.set_character("Boy")
	return "Boy"

func _on_GirlButton_focus_entered() -> String:
	PlayerData.set_character("Girl")
	return "Girl"

func _on_DinoButton_focus_entered() -> String:
	PlayerData.set_character("Dino")
	return "Dino"

func _on_KnightButton_focus_entered() -> String:
	PlayerData.set_character("Knight")
	return "Knight"

func _on_JackButton_focus_entered() -> String:
	PlayerData.set_character("Jack")
	return "Jack"

func _on_NinjaBoyButton_focus_entered() -> String:
	PlayerData.set_character("Ninja_boy")
	return "Ninja_Boy"

func _on_NinjaGirlButton_focus_entered() -> String:
	PlayerData.set_character("Ninja_girl")
	return "Ninja_girl"

func _on_RobotButton_focus_entered() -> String:
	PlayerData.set_character("Robot")
	return "Robot"

func _on_SantaButton_focus_entered() -> String:
	PlayerData.set_character("Santa")
	return "Santa"

func _on_TemplerunButton_focus_entered() -> String:
	PlayerData.set_character("Templerun_boy")
	return "Templerun_boy"

func _on_TemplerunGirlButton_focus_entered() -> String:
	PlayerData.set_character("Templerun_girl")
	return "Templerun_girl"

func _on_ZombieBoyButton_focus_entered() -> String:
	PlayerData.set_character("Zombie_boy")
	return "Zombie_boy"