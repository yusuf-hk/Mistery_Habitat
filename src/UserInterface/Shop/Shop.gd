extends Node

func _ready() -> void:
	pass

func _on_GoBackButton_pressed() -> void:
	get_parent().get_node("Shop").visible = false
	get_owner().get_node("PauseOverlay").visible = true

#func _on_BoyButton_pressed() -> void:
#	var boyPrice = int($ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Boy/DiamondPrice.get_text())
#	if(boyPrice <= PlayerData.diamonds):
#		PlayerData.set_diamonds(-boyPrice)
#		PlayerData.set_bought_boy(true)
#		print("success")
#
#
#func _on_DinoButtton_pressed() -> void:
#	var dinoPrice = int($ShopMenu/HBoxContainer/SkinsSelection/VBoxContainer/Dino/DiamondPrice.get_text())
#	if (dinoprice <= PlayerData.diamonds):
#		PlayerData.set_diamonds(-dinoPrice)
#		PlayerData.set_bought_dino(true)
#		print("success")
#	else:
#		print("fail")
