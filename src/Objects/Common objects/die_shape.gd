extends Node2D

#sets death to true if the body is entered
func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	PlayerData.set_deaths(true)
