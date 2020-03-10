class_name inPortal2D
extends Area2D


func _on_inPortal2D_body_entered(body: KinematicBody2D) -> void:
	teleport(body)


func teleport(character: KinematicBody2D) -> void:
	print(character.position)
	character.position = PlayerData.position
