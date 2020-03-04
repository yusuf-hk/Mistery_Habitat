extends Area2D



func _on_Oriblock_area_entered(area: Area2D) -> void:
	vanish()


func vanish() -> bool:
	get_node("OriBlock").visible = false

