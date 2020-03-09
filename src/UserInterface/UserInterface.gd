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
var state = -1

func _ready() -> void:
	PlayerData.connect("updated", self, "update_interface")
	PlayerData.connect("diamonds", self, "update_diamonds")
	PlayerData.connect("died", self, "_on_Player_died")
	PlayerData.connect("animal", self, "update_animals")
	update_interface()
	update_animals()

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
	for i in int(PlayerData.catched_animals.size()):
		var name = String(PlayerData.catched_animals[i])
		print(name)
		get_node("ItemList/Animals/Animal_List").add_item(name)

func _on_TextureButton_button_up() -> void:
	state = -state
	if state == 1:
		get_node("ItemList/Animals/Animal_List").visible = true
	elif state == -1:
		get_node("ItemList/Animals/Animal_List").visible = false