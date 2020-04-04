extends Node

var characterArray = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]

func _ready() -> void:
	pass

func _on_GoBackButton_pressed() -> void:
	get_parent().get_node("Shop").visible = false
	get_parent().get_node("PauseOverlay").visible = true

func _on_BoyButton_pressed() -> void:
	var boyPrice = int($ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/PriceInformation/CoinPrice.get_text())
	var boyButton = $ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/BoyButton
	
	if (boyPrice <= PlayerData.coin) and (boyButton.get_text() == "Buy"):
		boyButton.set_text("USING")
		$ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/BoyButton.disabled = true
		$ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/PriceInformation.hide()
		PlayerData.setBoughtCharacter("Boy", true)
		PlayerData.set_character("Boy")
	elif PlayerData.getBoughtCharacter("Boy") == true:
		boyButton.set_text("USING")
		$ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/BoyButton.disabled = true
		PlayerData.set_character("Boy")
	else:
		print("You don't have enough money")

func updateCharactersInfo():
	var character
	for boughtCharacter in PlayerData.getBoughtCharacterSize():
		