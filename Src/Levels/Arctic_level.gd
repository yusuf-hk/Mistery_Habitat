extends Node2D

var animals_to_catch_arctic = 1
func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_arctic)
func is_task_completed()->void:
	PlayerData.set_task_state(false)
	if PlayerData.retry == false:
		animals_to_catch_arctic = animals_to_catch_arctic - 1
		get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_arctic)
		if animals_to_catch_arctic == 0:
			PlayerData.set_task_state(true)

func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		PlayerData.set_task_state(false)
		get_node("Area2D").queue_free()
		PlayerData.emit_signal("new_scene")