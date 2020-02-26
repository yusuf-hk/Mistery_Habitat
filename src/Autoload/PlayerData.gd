extends Node
onready var bow = false
onready var character = "Robot"
onready var character_flip = false

signal updated
signal died
signal character_updated

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths



func reset():
	self.score = 0
	self.deaths = 0


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
	
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