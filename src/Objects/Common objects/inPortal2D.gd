class_name inPortal2D
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport(body)

# This will give you an error because the type references itself, parsing itself in an infinite loop

# Teleports the character at the target Portal2D's location
func teleport(character: KinematicBody2D) -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	print(character.position)
	character.position = PlayerData.position
