extends Node2D

var animals_to_catch_level_1 = 2
func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_level_1)
func is_task_completed()->void:
	animals_to_catch_level_1 = animals_to_catch_level_1 - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_level_1)
	if animals_to_catch_level_1 == 0:
		PlayerData.set_task_state(true)


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	PlayerData.set_task_state(false)
	get_node("Area2D").queue_free()