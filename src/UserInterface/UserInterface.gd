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


func _ready() -> void:
	PlayerData.connect("updated", self, "update_interface")
	PlayerData.connect("diamonds", self, "update_diamonds")
	PlayerData.connect("died", self, "_on_Player_died")
	PlayerData.connect("animal", self, "update_animals")
	update_interface()
	update_animals()
	update_diamonds()
	


func _on_Player_died() -> void:
	self.paused = true
	title_label.text = MESSAGE_DIED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title_label.text != MESSAGE_DIED:
		self.paused = not self.paused


func update_interface() -> void:
	score_label.text = "Coins: " + String(PlayerData.score)

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
	

