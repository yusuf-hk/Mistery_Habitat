extends Node2D

onready var scene_tree: SceneTree = get_tree()
var animals_to_catch = 3

func _ready() -> void:
	PlayerData.connect("animal", self, "caught_first_animal")
	PlayerData.connect("animal", self, "is_task_completed")


func _on_Welcome_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		remove_area2ds("Welcome")

func _on_Coin_tutorial_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		remove_area2ds("Coin")

func _on_Water_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		remove_area2ds("Water")


func _on_Portal_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		remove_area2ds("Portal")
		
			
func caught_first_animal()->void:
	if PlayerData.animals == 1:
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = true
		
		
func remove_area2ds(node: String)->void:
	var delete_area = "Tutorial_areas/" + node
	get_node(delete_area).queue_free()

func is_task_completed()->void:
	if PlayerData.retry == false:
		animals_to_catch = animals_to_catch - 1
		get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
		if animals_to_catch == 0:
			PlayerData.set_task_state(true)



