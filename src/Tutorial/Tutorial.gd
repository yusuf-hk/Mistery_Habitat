extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("animal", self, "caught_first_animal")
	PlayerData.connect("animal", self, "is_task_completed")


func _on_Welcome_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Catched_animal").visible = false
	remove_area2ds("Welcome")


func _on_Coin_body_entered(body: PhysicsBody2D) -> void:
	print(true)
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Catched_animal").visible = false
	remove_area2ds("Coin")


func _on_Water_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Catched_animal").visible = false
	remove_area2ds("Water")


func _on_Portal_body_entered(body: PhysicsBody2D) -> void:
	get_node("InterfaceLayer/Tutuorial_point").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = true
	get_node("InterfaceLayer/Tutuorial_point/ColorRect/Catched_animal").visible = false
	remove_area2ds("Portal")
	
func caught_first_animal()->void:
	if PlayerData.animals == 1:
		get_node("InterfaceLayer/Tutuorial_point").visible = true
		get_node("InterfaceLayer/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/Tutuorial_point/ColorRect/Catched_animal").visible = true
	
func remove_area2ds(node: String)->void:
	var delete_area = "Tutorial_areas/" + node
	get_node(delete_area).queue_free()

func is_task_completed()->void:
	if int(PlayerData.animals) >= 2:
		PlayerData.set_task_state(true)
