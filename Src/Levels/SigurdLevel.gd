extends Node2D
#onready var anim_player = get_node("inPortal2D/AnimationPlayer")
onready var animals_to_catch_desert = get_node("Animals").get_child_count()

func _ready() -> void:
	PlayerData.set_task_state(false)
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_desert)
func is_task_completed()->void:
	animals_to_catch_desert = animals_to_catch_desert - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch_desert)
	if animals_to_catch_desert == 0:
		PlayerData.set_task_state(true)

func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport()


func teleport() -> void:
	#anim_player.play("fade_in")
	#yield(anim_player, "animation_finished")
	get_node("Player").position = PlayerData.position


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	PlayerData.set_task_state(false)
	get_node("Area2D").queue_free()
	PlayerData.emit_signal("new_scene")
