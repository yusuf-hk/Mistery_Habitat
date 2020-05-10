extends Button
	


func _on_PlayAgainButton_pressed() -> void:
	get_parent().get_parent().get_node("SaveText").hide()
	Global.load_scene("res://src/Levels/Forest.tscn")
