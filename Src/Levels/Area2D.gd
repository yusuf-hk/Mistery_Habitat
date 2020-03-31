extends Area2D



func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		vanish()

func vanish() -> void:
	get_parent().get_parent().get_node("tryhide").visible = false