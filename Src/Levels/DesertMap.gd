extends Node2D

#onready var anim_player = get_node("inPortal2D/AnimationPlayer")
onready var animals_to_catch_desert = get_node("Animals").get_child_count()

func _ready() -> void:
	PlayerData.set_task_state(false)
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_desert)
	SaveSystem.save()
func is_task_completed()->void:
	animals_to_catch_desert = animals_to_catch_desert - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_desert)
	if animals_to_catch_desert == 0:
		PlayerData.set_task_state(true)

func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport()


func teleport() -> void:
	get_node("Player").position = PlayerData.position


func _on_Reset_portal_state_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		PlayerData.set_task_state(false)
		get_node("Reset_portal_state").queue_free()
		PlayerData.emit_signal("new_scene")
