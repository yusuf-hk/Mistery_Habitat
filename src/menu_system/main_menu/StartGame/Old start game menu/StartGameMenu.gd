extends Control

var array = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]
onready var what_character = PlayerData.get_character()

func _ready() -> void:
	PlayerData.connect("character_updated", self, "update")
	
	
func update()->void:
	what_character = PlayerData.character
	print(what_character)
	turn_on_sprite()
	turn_off_sprite()

func turn_on_sprite() -> void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character == some_character:
			var character = "/root/StartGameMenu/VBoxContainer/HBoxContainer/CenterContainer/" + what_character
			get_node(character).show()


func turn_off_sprite() -> void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character != some_character:
			var character = "/root/StartGameMenu/VBoxContainer/HBoxContainer/CenterContainer/" + some_character
			get_node(character).hide()

func _on_BoyButton_focus_entered() -> void:
	PlayerData.set_character("Boy")

func _on_GirlButton_focus_entered() -> void:
	PlayerData.set_character("Girl")

func _on_DinoButton_focus_entered() -> void:
	PlayerData.set_character("Dino")

func _on_KnightButton_focus_entered() -> void:
	PlayerData.set_character("Knight")

func _on_JackButton_focus_entered() -> void:
	PlayerData.set_character("Jack")

func _on_NinjaBoyButton_focus_entered() -> void:
	PlayerData.set_character("Ninja_boy")

func _on_NinjaGirlButton_focus_entered() -> void:
	PlayerData.set_character("Ninja_girl")

func _on_RobotButton_focus_entered() -> void:
	PlayerData.set_character("Robot")

func _on_SantaButton_focus_entered() -> void:
	PlayerData.set_character("Santa")

func _on_TemplerunButton_focus_entered() -> void:
	PlayerData.set_character("Templerun_boy")

func _on_TemplerunGirlButton_focus_entered() -> void:
	PlayerData.set_character("Templerun_girl")

func _on_ZombieBoyButton_focus_entered() -> void:
	PlayerData.set_character("Zombie_boy")