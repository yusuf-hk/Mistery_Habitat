extends Node

onready var character = "Boy"
onready var character_flip = false
onready var shoot = false

signal coin
signal diamonds
signal died
signal position
signal animal
signal character_updated
signal bow
signal task_completed
signal character_bought

var boughtCharacters = {
	"Boy": false,
	"Girl": false,
	"Robot": false,
	"Templerun_boy": false,
	"Templerun_girl": false,
	"Dino": false,
	"Knight": false,
	"Jack": false,
	"Ninja_boy": false,
	"Ninja_girl": false,
	"Santa": false,
	"Zombie_boy": false
	}

var coin: = 10000 setget set_coin
var diamonds: = 0 setget set_diamonds
var deaths: = false setget set_deaths
var position setget set_position
var animals: = 0 setget set_animals
var bow: = false setget set_bow
var task_completed: = false setget set_task_state
var catched_animals:= [] 
var last_animal

func reset():
	self.coin = 0
	self.diamonds = 0
	self.deaths = 0
	self.animals = 0
	self.bow = false
	self.catched_animals.clear()


func set_coin(new_coin: int) -> void:
	coin = new_coin
	emit_signal("coin")
	
func set_position(new_pos:Vector2)->void:
	position = new_pos
	emit_signal("position")

func set_diamonds(new_diamonds:int)->void:
	diamonds = new_diamonds
	emit_signal("diamonds")
	
func set_animals(new_value:int) -> void:
	animals = new_value
	emit_signal("animal")

func set_deaths(new_value: bool) -> void:
	deaths = new_value
	emit_signal("died")

func set_task_state(task_state:bool)->void:
	task_completed = task_state
	emit_signal("task_completed")

func set_animal_list(new_animal:String)->void:
	last_animal = new_animal
	print(last_animal + " in playerdata")
	catched_animals.append(new_animal)
	set_animals(int(catched_animals.size()))
	
func set_character(player: String) ->void:
	character = player
	emit_signal("character_updated")
	print("character updated to " + character)
	
func get_character()->String:
	return character

func setBoughtCharacter(c: String, bought: bool) -> void:
	boughtCharacters[c] = bought
	emit_signal("character_bought")
	print(boughtCharacters)
	
func getBoughtCharacter(c: String) -> bool:
	print("This is a test" + str(boughtCharacters[c]))
	return boughtCharacters[c]
	
func getBoughtCharacterSize() -> int:
	return boughtCharacters.size()
	
func getBoughtCharactersList():
	return boughtCharacters

func set_bow(value:bool)->void:
	bow = value
	emit_signal("bow")

func set_character_flip(flip:bool)->void:
	character_flip = flip
	
func get_character_flip()->bool:
	return character_flip

func set_arrow_state(arrow_state:bool)->void:
	shoot = arrow_state
	
func get_arrow_state()->bool:
	return shoot