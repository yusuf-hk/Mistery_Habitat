extends Node
onready var bow = false
onready var character = "Robot"
onready var character_flip = false
onready var shoot = false

signal updated
signal diamonds
signal died
signal position
signal animal
signal character_updated

var score: = 0 setget set_score
var diamonds: = 0 setget set_diamonds
var deaths: = 0 setget set_deaths
var position setget set_position
var animals: = 0 setget set_animals
var catched_animals:= [] 

func reset():
	self.score = 0
	self.diamonds = 0
	self.deaths = 0
	self.animals = 0
	self.catched_animals.clear()


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")
	
func set_position(new_pos:Vector2)->void:
	position = new_pos
	emit_signal("position")

func set_diamonds(new_diamonds:int)->void:
	diamonds = new_diamonds
	emit_signal("diamonds")
	
func set_animals(new_value:int) -> void:
	animals = new_value
	emit_signal("animal")

func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")

func set_animal_list(new_animal:String)->void:
	catched_animals.append(new_animal)
	set_animals(int(catched_animals.size()))

	
	
func set_character(player: String) ->void:
	character = player
	emit_signal("character_updated")
	print("character updated to " + character)
	
func get_character()->String:
	return character



func set_weapon(value:bool)->void:
	bow = value

func get_weapon()->bool:
	return bow

func set_character_flip(flip:bool)->void:
	character_flip = flip
	
	
func get_character_flip()->bool:
	return character_flip

func set_arrow_state(arrow_state:bool)->void:
	shoot = arrow_state
	
func get_arrow_state()->bool:
	return shoot