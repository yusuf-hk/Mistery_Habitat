extends Node2D

#onready var anim_player = get_node("inPortal2D/AnimationPlayer")
var animals_to_catch = 2
func _ready() -> void:
	PlayerData.connect("animal", self, "is_task_completed")
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
func is_task_completed()->void:
	animals_to_catch = animals_to_catch - 1
	get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
	if animals_to_catch == 0:
		PlayerData.set_task_state(true)

func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport()


func teleport() -> void:
	#anim_player.play("fade_in")
	#yield(anim_player, "animation_finished")
	get_node("Player").position = PlayerData.position
