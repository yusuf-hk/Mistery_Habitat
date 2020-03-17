extends Node


onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $ItemList/Coins
onready var diamond_label: Label =$ItemList/Diamonds
onready var animal_label: Label = $ItemList/Animals
onready var pause_overlay: ColorRect = $PauseOverlay
onready var title_label: Label = $PauseOverlay/Title
onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton

const MESSAGE_DIED: = "You died"

var paused: = false setget set_paused
var animal_list = []
var state = -1
var lifes = 10
var animal
var answer

func _ready() -> void:

	PlayerData.connect("coin", self, "update_coins")
	PlayerData.connect("diamonds", self, "update_diamonds")
	PlayerData.connect("died", self, "_on_Player_died")
	PlayerData.connect("animal", self, "update_animals")
	update_coins()
	update_animals()
	update_diamonds()
	restart_animal_task()

	


func _on_Player_died() -> void:
	self.paused = true
	title_label.text = MESSAGE_DIED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title_label.text != MESSAGE_DIED:
		self.paused = not self.paused


func update_coins() -> void:
	score_label.text = "Coins: " + String(PlayerData.coin)

func update_diamonds() -> void:
	diamond_label.text = "Diamonds: " + String(PlayerData.diamonds)


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func update_animals()->void:
	animal_label.text = "Animals: " + String(PlayerData.animals)
	if (orgranize()):
		adding_animal_to_list()
	animal_task()

func adding_animal_to_list()->void:
	get_node("ItemList/Animals/Animal_List").clear()
	for i in animal_list.size():
		get_node("ItemList/Animals/Animal_List").add_item(animal_list[i])


func orgranize()->bool:
	for i in PlayerData.catched_animals.size():
		var name = PlayerData.catched_animals[i]
		var animal_number = number_generator(name)
		if animal_number != 0:
			var text = name + " " + String(animal_number)
			if  text != name + " "+ String(PlayerData.catched_animals.count(name)):
				remove_all_animals_with_this_name(name)
				var new_animal = name + " " + String(animal_number+1)
				animal_list.append(new_animal)
				return true
		if number_generator(name) == 0:
			if(name in animal_list) == false:
				animal_list.append(name+ " "+ String(1))
				return true
			if name in animal_list && number_generator(name) == 1:
				remove_all_animals_with_this_name(name)
				animal_list.append(name + " " + String(2))
				return true
	return false
	
func number_generator(name:String)->int:
	for i in range(1,10):
		if name + " " + String(i) in animal_list:
			return i
	return 0
	
func remove_all_animals_with_this_name(name:String)->void:
	animal_list.remove(name)
	for i in range(0,10):
		if name + " " + String(i) in animal_list:
			animal_list.remove(i)
	


func _on_TextureButton_button_up() -> void:
	state = -state
	if state == 1:
		get_node("ItemList/Animals/Animal_List").visible = true
	elif state == -1:
		get_node("ItemList/Animals/Animal_List").visible = false
		
	

func animal_task()->void:
	print("inside animal task")
	get_node("Animal_tasks").visible = true
	animal = PlayerData.last_animal
	print(animal)
	if animal == "Bear":
		print("animal is equal to bear")
		get_node("Animal_tasks/Bear").visible = true
		check_button()
	
func check_button()->void:
	if answer == false:			
		print("wrong button pressed")
		print("answer is: "+ String(answer))
		print("life left: "+ lifes)
		lifes = lifes - 1
		if lifes == 0:
			die()
	elif answer == true:
		print("correct button pressed")
		print("answer is: "+ String(answer))
		PlayerData.coin += 100

			

func die() -> void:
	queue_free()

func restart_animal_task()->void:
	get_node("Animal_tasks").visible = false
	get_node("Animal_tasks/Bear").visible = false
	get_node("Animal_tasks/Camel").visible = false
	get_node("Animal_tasks/Cat").visible = false

func _on_Savanna_button_up() -> bool:
	var state
	print("savanna button")
	if animal == "Camel":
		answer = true
		state =  true
	elif animal == "Bear":
		answer = false
		state =  false
		lifes = lifes - 1
	check_button()
	return state
	

func _on_Grassland_button_up() -> bool:
	var state
	print("grassland button")
	if animal == "Hjort":
		answer = true
		state = true
	elif animal == "Bear":
		answer = false
		state = false
		lifes = lifes - 1
	check_button()
	return state


func _on_Polar_button_up() -> bool:
	var state
	print("polar button")
	if animal == "Pinguin":
		answer = true
		state = true
	elif animal == "Bear":
		answer =  false
		state = false
		lifes = lifes - 1
	check_button()
	return state
	


func _on_Forest_button_up() -> bool:
	var state
	print("forest button")
	if animal == "Bear":
		answer = true
		state = true
	else: 
		answer = false
		state = false
		lifes = lifes - 1
	check_button()
	return state


func _on_Water_button_up() -> bool:
	var state
	print("water button")
	if animal == "Fish":
		answer =  true
		state = true
	elif animal == "Bear":
		answer =  false
		state = false
		lifes = lifes - 1
	check_button()
	return state
