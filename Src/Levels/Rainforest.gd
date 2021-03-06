extends Node2D

onready var animals_to_catch_rainforest = get_node("Animals").get_child_count()

func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_rainforest)
	SaveSystem.save()
func is_task_completed()->void:
	animals_to_catch_rainforest = animals_to_catch_rainforest - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_rainforest)
	if animals_to_catch_rainforest == 0:
		PlayerData.set_task_state(true)

func _on_Reset_portal_state_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		PlayerData.set_task_state(false)
		get_node("Reset_portal_state").queue_free()
		PlayerData.emit_signal("new_scene")
