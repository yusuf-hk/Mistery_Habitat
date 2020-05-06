extends Node2D

onready var scene_tree: SceneTree = get_tree()
onready var animals_to_catch = get_node("Animals").get_child_count()
onready var habitat_name = get_node("/root/Tutorial level").get_name()

func _ready() -> void:
	PlayerData.connect("animal", self, "caught_first_animal")
	PlayerData.connect("animal", self, "is_task_completed")
	PlayerData.set_current_habitat(habitat_name)
	SaveSystem.save()


func _on_Welcome_body_entered(body: KinematicBody2D) -> void:
	PlayerData.set_task_state(false)
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
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
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
		var delete_area = "Coin_collection"
		get_node(delete_area).queue_free()

func _on_Water_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
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
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
		remove_area2ds("Portal")
		
func _on_Shoot_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
		remove_area2ds("Shoot")
		
func _on_Meny_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player":
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = true
		remove_area2ds("Meny")
			
func caught_first_animal()->void:
	if PlayerData.animals == 1:
		PlayerData.tutorial = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Coins and diamonds").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Welcome").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Hidden_rooms").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Portal").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Catched_animal").visible = true
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Shoot").visible = false
		get_node("InterfaceLayer/UserInterface/Tutuorial_point/ColorRect/Meny").visible = false
		
		
func remove_area2ds(node: String)->void:
	var delete_area = "Tutorial_areas/" + node
	get_node(delete_area).queue_free()

func is_task_completed()->void:
	if PlayerData.retry == false:
		animals_to_catch = animals_to_catch - 1
		get_node("Portal2D/ColorRect/ItemList/Label2").text = String(animals_to_catch)
		if animals_to_catch == 0:
			PlayerData.set_task_state(true)

