extends Node2D

var animals_to_catch_mountain = 2
func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_mountain)
func is_task_completed()->void:
	animals_to_catch_mountain = animals_to_catch_mountain - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_mountain)
	if animals_to_catch_mountain == 0:
		PlayerData.set_task_state(true)


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		PlayerData.set_task_state(false)
		get_node("Area2D").queue_free()
