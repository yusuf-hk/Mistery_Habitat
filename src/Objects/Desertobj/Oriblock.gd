extends Area2D

#Detects if the player (not animals or other objets) enters this area
func _on_Oriblock_body_entered(body):
	if body.name == "Player":
		vanish()

#Makes the block that has been entered vanish
func vanish() -> void:
	get_node("vblock").visible = false




