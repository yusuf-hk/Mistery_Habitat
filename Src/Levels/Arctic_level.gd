extends Node2D

var animals_to_catch = 1
func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
func is_task_completed()->void:
	if PlayerData.retry == false:
		animals_to_catch = animals_to_catch - 1
		get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
		if animals_to_catch == 0:
			PlayerData.set_task_state(true)