extends Node

var characterArray = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]
onready var current_character = PlayerData.get_character()
onready var boughtCharacters = PlayerData.boughtCharacters

func _ready() -> void:
	current_character = PlayerData.get_character()
	PlayerData.connect("character_updated", self, "updateCharacters")
	updateCharacters()

func _on_GoBackButton_pressed() -> void:
	get_parent().get_node("Shop").visible = false
	get_parent().get_node("PauseOverlay").visible = true

func _on_BoyButton_pressed() -> void:
	var boyPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Boy/PriceInformation/CoinPrice.get_text())
	var boyDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Boy/PriceInformation/DiamondPrice.get_text())
	
	if (boyPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Boy"] == false) and (boyDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Boy", true)
		PlayerData.set_coin(PlayerData.coin - boyPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - boyDiamond)
	elif PlayerData.getBoughtCharacter("Boy") == true:
		PlayerData.set_character("Boy")
	else:
		print("You don't have enough money")
		
func _on_GirlButton_pressed() -> void:
	var girlPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Girl/PriceInformation/CoinPrice.get_text())
	var girlDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Girl/PriceInformation/DiamondPrice.get_text())
	
	if (girlPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Girl"] == false) and (girlDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Girl", true)
		PlayerData.set_coin(PlayerData.coin - girlPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - girlDiamond)
	elif PlayerData.getBoughtCharacter("Girl") == true:
		PlayerData.set_character("Girl")
	else:
		print("You don't have enough money")
		
func _on_RobotButton_pressed() -> void:
	var robotPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Robot/PriceInformation/CoinPrice.get_text())
	var robotDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Robot/PriceInformation/DiamondPrice.get_text())
	
	if (robotPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Robot"] == false) and (robotDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Robot", true)
		PlayerData.set_coin(PlayerData.coin - robotPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - robotDiamond)
	elif PlayerData.getBoughtCharacter("Robot") == true:
		PlayerData.set_character("Robot")
	else:
		print("You don't have enough money")

func _on_Templerun_boyButton_pressed() -> void:
	var templeBoyPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Templerun_boy/PriceInformation/CoinPrice.get_text())
	var templeBoyDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Templerun_boy/PriceInformation/DiamondPrice.get_text())
	
	if (templeBoyPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Templerun_boy"] == false) and (templeBoyDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Templerun_boy", true)
		PlayerData.set_coin(PlayerData.coin - templeBoyPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - templeBoyDiamond)
	elif PlayerData.getBoughtCharacter("Templerun_boy") == true:
		PlayerData.set_character("Templerun_boy")
	else:
		print("You don't have enough money")

func _on_Templerun_girlButton_pressed() -> void:
	var templeGirlPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Templerun_girl/PriceInformation/CoinPrice.get_text())
	var templeGirlDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Templerun_girl/PriceInformation/DiamondPrice.get_text())
	
	if (templeGirlPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Templerun_girl"] == false) and (templeGirlDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Templerun_girl", true)
		PlayerData.set_coin(PlayerData.coin - templeGirlPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - templeGirlDiamond)
	elif PlayerData.getBoughtCharacter("Templerun_girl") == true:
		PlayerData.set_character("Templerun_girl")
	else:
		print("You don't have enough money")

func _on_DinoButton_pressed() -> void:
	var dinoPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Dino/PriceInformation/CoinPrice.get_text())
	var dinoDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Dino/PriceInformation/DiamondPrice.get_text())
	
	if (dinoPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Dino"] == false) and (dinoDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Dino", true)
		PlayerData.set_coin(PlayerData.coin - dinoPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - dinoDiamond)
	elif PlayerData.getBoughtCharacter("Dino") == true:
		PlayerData.set_character("Dino")
	else:
		print("You don't have enough money")

func _on_KnightButton_pressed() -> void:
	var knightPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Knight/PriceInformation/CoinPrice.get_text())
	var knightDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Knight/PriceInformation/DiamondPrice.get_text())
	
	if (knightPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Knight"] == false) and (knightDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Knight", true)
		PlayerData.set_coin(PlayerData.coin - knightPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - knightDiamond)
	elif PlayerData.getBoughtCharacter("Knight") == true:
		PlayerData.set_character("Knight")
	else:
		print("You don't have enough money")

func _on_JackButton_pressed() -> void:
	var jackPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Jack/PriceInformation/CoinPrice.get_text())
	var jackDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Jack/PriceInformation/DiamondPrice.get_text())
	
	if (jackPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Jack"] == false) and (jackDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Jack", true)
		PlayerData.set_coin(PlayerData.coin - jackPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - jackDiamond)
	elif PlayerData.getBoughtCharacter("Jack") == true:
		PlayerData.set_character("Jack")
	else:
		print("You don't have enough money")

func _on_Ninja_boyButton_pressed() -> void:
	var ninjaBoyPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Ninja_boy/PriceInformation/CoinPrice.get_text())
	var ninjaBoyDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Ninja_boy/PriceInformation/DiamondPrice.get_text())
	
	if (ninjaBoyPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Ninja_boy"] == false) and (ninjaBoyDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Ninja_boy", true)
		PlayerData.set_coin(PlayerData.coin - ninjaBoyPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - ninjaBoyDiamond)
	elif PlayerData.getBoughtCharacter("Ninja_boy") == true:
		PlayerData.set_character("Ninja_boy")
	else:
		print("You don't have enough money")

func _on_Ninja_girlButton_pressed() -> void:
	var ninjaGirlPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Ninja_girl/PriceInformation/CoinPrice.get_text())
	var ninjaGirlDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Ninja_girl/PriceInformation/DiamondPrice.get_text())
	
	if (ninjaGirlPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Ninja_girl"] == false) and (ninjaGirlDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Ninja_girl", true)
		PlayerData.set_coin(PlayerData.coin - ninjaGirlPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - ninjaGirlDiamond)
	elif PlayerData.getBoughtCharacter("Ninja_girl") == true:
		PlayerData.set_character("Ninja_girl")
	else:
		print("You don't have enough money")

func _on_SantaButton_pressed() -> void:
	var santaPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Santa/PriceInformation/CoinPrice.get_text())
	var santaDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Santa/PriceInformation/DiamondPrice.get_text())
	
	if (santaPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Santa"] == false) and (santaDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Santa", true)
		PlayerData.set_coin(PlayerData.coin - santaPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - santaDiamond)
	elif PlayerData.getBoughtCharacter("Santa") == true:
		PlayerData.set_character("Santa")
	else:
		print("You don't have enough money")

func _on_Zombie_boyButton_pressed() -> void:
	var zombieBoyPrice = int($ShopMenu/SkinsSelection/VBoxContainer/Zombie_boy/PriceInformation/CoinPrice.get_text())
	var zombieBoyDiamond = int($ShopMenu/SkinsSelection/VBoxContainer/Zombie_boy/PriceInformation/DiamondPrice.get_text())
	
	if (zombieBoyPrice <= PlayerData.coin) and (PlayerData.boughtCharacters["Zombie_boy"] == false) and (zombieBoyDiamond <= PlayerData.diamonds):
		PlayerData.setBoughtCharacter("Zombie_boy", true)
		PlayerData.set_coin(PlayerData.coin - zombieBoyPrice)
		PlayerData.set_diamonds(PlayerData.diamonds - zombieBoyDiamond)
	elif PlayerData.getBoughtCharacter("Zombie_boy") == true:
		PlayerData.set_character("Zombie_boy")
	else:
		print("You don't have enough money")


func updateCharacters():
	current_character = PlayerData.get_character()
	boughtCharacters = PlayerData.boughtCharacters
	characterArray = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]
	
	for i in characterArray.size():
		var boughtcharacter = boughtCharacters[characterArray[i]]
		var character = characterArray[i]
		var characterButton = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/" + character + "Button"
		var characterPriceInformation = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/PriceInformation"
		
		if boughtcharacter == false:
			get_node(characterButton).disabled = false
			get_node(characterButton).set_text("Buy")
			get_node(characterPriceInformation).show()
	
	for i in characterArray.size():
		var boughtcharacter = boughtCharacters[characterArray[i]]
		var character = characterArray[i]
		var characterButton = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/" + character + "Button"
		var characterPriceInformation = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/PriceInformation"

		if  boughtcharacter == true:
			get_node(characterButton).disabled = false
			get_node(characterButton).set_text("USE")
			get_node(characterPriceInformation).hide()

	for i in characterArray.size():
		var boughtcharacter = boughtCharacters[characterArray[i]]
		var character = characterArray[i]
		var characterButton = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/" + character + "Button"
		var characterPriceInformation = "ShopMenu/SkinsSelection/VBoxContainer/" + character + "/PriceInformation"
		
		if character == current_character:
			get_node(characterButton).disabled = true
			get_node(characterButton).set_text("USING")
			get_node(characterPriceInformation).hide()