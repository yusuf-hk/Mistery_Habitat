extends Node2D

#onready var anim_player = get_node("inPortal2D/AnimationPlayer")
func _ready() -> void:
	pass

func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport()


func teleport() -> void:
	#anim_player.play("fade_in")
	#yield(anim_player, "animation_finished")
	get_node("Player").position = PlayerData.position
