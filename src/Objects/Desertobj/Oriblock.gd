extends Area2D


func _on_Oriblock_body_entered(body):
	if body.name == "Player":
		vanish()

func vanish() -> void:
	get_node("vblock").visible = false




