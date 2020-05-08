extends Node


onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $ItemList/Coins
onready var diamond_label: Label =$ItemList/Diamonds
onready var animal_label: Label = $ItemList/Animals
onready var pause_overlay: ColorRect = $PauseOverlay
onready var title_label: Label = $PauseOverlay/PauseMenu/Title
onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton
onready var animplayer = get_node("animplayer")

onready var habitat_name = get_owner().get_name()

const MESSAGE_DIED: = "You died"

var paused: = false setget set_paused
var animal_list = PlayerData.animal_lists
var state = -1
var lifes = 10
var animal
var answer

func _ready() -> void:
	PlayerData.connect("coin", self, "update_coins")
	PlayerData.connect("diamonds", self, "update_diamonds")
	PlayerData.connect("died", self, "_on_Player_died")
	PlayerData.connect("animal", self, "animal_task")
	PlayerData.connect("tutorial", self, "tutorial_state")
	PlayerData.connect("new_scene", self, "update_list")
	update_coins()
	update_animals()
	update_diamonds()
	restart_animal_task()
	PlayerData.set_current_habitat(habitat_name)
	
func update_list():
	animal_list = PlayerData.animal_lists
	update_animals()
	
func tutorial_state():
	$Tutuorial_point.visible = PlayerData.tutorial
	scene_tree.paused = PlayerData.tutorial
func _on_Player_died() -> void:
	animal_list.clear()
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
	if value == false:
		get_node("PauseOverlay/SaveText").hide()


func update_animals()->void:
	animal_list = PlayerData.animal_lists
	animal_label.text = "Animals: " + String(PlayerData.animals)
	if (orgranize()):
		adding_animal_to_list()
	else:
		update_Itemslist()

func update_Itemslist()->void:
	PlayerData.animal_lists = animal_list
	get_node("ItemList/Animals/Animal_List").clear()
	for i in animal_list.size():
		get_node("ItemList/Animals/Animal_List").add_item(animal_list[i])
	

func adding_animal_to_list()->void:
	PlayerData.animal_lists = animal_list
	get_node("ItemList/Animals/Animal_List").clear()
	for i in animal_list.size():
		get_node("ItemList/Animals/Animal_List").add_item(animal_list[i])


func orgranize()->bool:
	var value = false
	for i in PlayerData.catched_animals.size():
		var name = PlayerData.catched_animals[i]
		var animal_number = number_generator(name)
		var element = name + " "+ String(animal_number)
		if animal_number != 0 && animal_number >= 2:
			var text = name + " " + String(animal_number)
			if  text != name + " "+ String(PlayerData.catched_animals.count(name)):
				remove_all_animals_with_this_name(name)
				var new_animal = name + " " + String(animal_number+1)
				animal_list.append(new_animal)
				value = true
		if animal_number == 0 && is_animal_in_list(name)==false:
			if(name in animal_list) == false:
				animal_list.append(name+ " "+ String(1))
				value= true
		if element in animal_list && animal_number == 1:
			var Playerdata_number = PlayerData.catched_animals.count(name)
			if animal_number < Playerdata_number:
				remove_all_animals_with_this_name(name)
				animal_list.append(name + " " + String(2))
				value = true
	return value
	
func number_generator(name:String)->int:
	for i in (PlayerData.catched_animals.size()+1):
		if name + " " + String(i) in PlayerData.animal_lists:
			return i
	return 0
	
func is_animal_in_list(name:String)->bool:
	for i in (PlayerData.catched_animals.size()+1):
		if name + " " + String(i) in PlayerData.animal_lists:
			return true
	return false
	
func remove_all_animals_with_this_name(name:String)->void:
	for i in PlayerData.catched_animals.size():
		if name + " " + String(i) in animal_list:
			var test = name + " " + String(i) 
			var position = get_position(test)
			animal_list.remove(position)
			
func get_position(name:String)->int:
	for i in animal_list.size()+1:
		if name == animal_list[i]:
			return i
	return 0


func _on_TextureButton_button_up() -> void:
	state = -state
	if state == 1:
		get_node("ItemList/Animals/Animal_List").visible = true
	elif state == -1:
		get_node("ItemList/Animals/Animal_List").visible = false
		
	

func animal_task()->void:
	if PlayerData.retry == false:
		scene_tree.paused = true
		get_node("Animal_tasks").visible = true
		animal = PlayerData.last_animal


	
func check_button()->void:
	if answer == false:			
		lifes = lifes - 1
		get_node("Animal_tasks/Label2").text = "Your lives left: "+ String(lifes)
		if lifes == 0:
			die()
	elif answer == true:
		PlayerData.coin += 100
		update_animals()
		scene_tree.paused = false
		animplayer.play("Task_fade")
	

			

func die() -> void:
	PlayerData.animals = PlayerData.animals - 1
	restart_animal_task()
	PlayerData.set_deaths(true)

func restart_animal_task()->void:
	get_node("Animal_tasks").visible = false
	answer = false

func _on_Savanna_button_up() -> void:
	if animal == "Camel":
		answer = true
		animplayer.play("Savanna_True")
	elif animal == "Bear":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Cat":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Elephant":
		answer = true
		animplayer.play("Savanna_True")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Boar":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Panda":
		answer = false
		animplayer.play("Savanna_false")
	elif animal == "Vulture":
		answer = true
		animplayer.play("Savanna_true")
	check_button()
	

func _on_Grassland_button_up() -> void:
	if animal == "Bear":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Cat":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Camel":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Elephant":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Boar":
		answer = true
		animplayer.play("Grassland_True")
	elif animal == "Panda":
		answer = false
		animplayer.play("Grassland_False")
	elif animal == "Vulture":
		answer = true
		animplayer.play("Grassland_true")
	check_button()


func _on_Polar_button_up() -> void:
	if animal == "Penguin":
		animplayer.play("Polar_True")
		answer = true
	elif animal == "Bear":
		answer =  false
		animplayer.play("Polar_false")
	elif animal == "Cat":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Camel":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Elephant":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Polar Bear":
		answer = true
		animplayer.play("Polar_True")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Boar":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Panda":
		answer = false
		animplayer.play("Polar_false")
	elif animal == "Vulture":
		answer = false
		animplayer.play("Polar_false")
	check_button()

	


func _on_Forest_button_up() -> void:
	if animal == "Bear":
		answer = true
		animplayer.play("Forest_True")
	elif animal == "Cat":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Camel":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Elephant":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Forest_False")
	elif animal == "Boar":
		answer = true
		animplayer.play("Forest_True")
	elif animal == "Panda":
		answer = true
		animplayer.play("Forest_True")
	elif animal == "Vulture":
		answer = false
		animplayer.play("Forest_False")
	check_button()



func _on_Water_button_up() -> void:
	if animal == "Fish":
		animplayer.play("Water_True")
		answer =  true
	elif animal == "Bear":
		answer =  false
		animplayer.play("Water_False")
	elif animal == "Cat":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Camel":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Elephant":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Boar":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Panda":
		answer = false
		animplayer.play("Water_False")
	elif animal == "Vulture":
		answer = false
		animplayer.play("Water_False")
	check_button()




func _on_Dessert_button_up() -> void:
	if animal == "Bear":
		answer =  false
		animplayer.play("dessert_false")
	elif animal == "Cat":
		answer = true
		animplayer.play("dessert_true")
	elif animal == "Camel":
		answer = true
		animplayer.play("dessert_true")
	elif animal == "Elephant":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Penguin":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Monkey":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Boar":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Panda":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Vulture":
		answer = true
		animplayer.play("dessert_true")
	check_button()




func _on_Mountain_button_up() -> void:
	if animal == "Bear":
		answer =  false
		animplayer.play("Mountain_False")
	elif animal == "Cat":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Camel":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Elephant":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Monkey":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Boar":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Panda":
		answer = false
		animplayer.play("Mountain_False")
	elif animal == "Vulture":
		answer = false
		animplayer.play("Mountain_False")
	check_button()


func _on_Jungle_button_up() -> void:
	if animal == "Bear":
		answer =  false
		animplayer.play("Jungle_False")
	elif animal == "Cat":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Camel":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Elephant":
		answer = false
		animplayer.play("dessert_false")
	elif animal == "Polar Bear":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Penguin":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Monkey":
		answer = true
		animplayer.play("Jungle_True")
	elif animal == "Boar":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Panda":
		answer = false
		animplayer.play("Jungle_False")
	elif animal == "Vulture":
		answer = false
		animplayer.play("Jungle_False")
	check_button()


func _on_SaveButton_pressed() -> void:
	get_node("PauseOverlay/SaveText").show()
	SaveSystem.save()
