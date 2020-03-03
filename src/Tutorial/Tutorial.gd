extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass



func _on_Welcome_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = true
	remove_area2ds("Welcome")


func _on_Coin_body_entered(body: PhysicsBody2D) -> void:
	print(true)
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
	remove_area2ds("Coin")


func _on_Water_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
	remove_area2ds("Water")


func _on_Portal_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = true
	remove_area2ds("Portal")
	
func remove_area2ds(node: String)->void:
	var delete_area = "Tutorial_areas/" + node
	print(delete_area)
	get_node(delete_area).queue_free()
