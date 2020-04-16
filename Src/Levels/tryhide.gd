extends TileMap



func _on_tryhide_tree_entered(body) -> void:
	if body.name == "Player":
		vanish()

func vanish() -> void:
	get_parent().get_node("tryhide").visible = false