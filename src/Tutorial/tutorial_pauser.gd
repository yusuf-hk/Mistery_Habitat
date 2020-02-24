extends Node


func _on_Button_button_up() -> void:
	self.queue_free()


func _on_Area2D_body_entered() -> void:
	get_node("Node2D/Keys").visible = true
	get_node("ItemList").visible = true
