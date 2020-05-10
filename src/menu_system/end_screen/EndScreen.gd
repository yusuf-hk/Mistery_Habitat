extends Control


onready var result: Label = $Node2D/Result

func _ready() -> void:
	result.text = result.text % [PlayerData.coin,PlayerData.diamonds, PlayerData.animals]


func _on_QuitButton2_button_up() -> void:
	get_tree().quit()
	get_node("SaveText").hide()




func _on_SaveButton_pressed() -> void:
	get_node("SaveText").show()
	SaveSystem.save()
