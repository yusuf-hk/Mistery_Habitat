class_name inPortal2D
extends Node2D


func _on_Area2D_body_entered(body: KinematicBody2D) -> void:
	if body != null && body.name == "Player":
		teleport(body)


func teleport(character: KinematicBody2D) -> void:
	character.position = PlayerData.position



