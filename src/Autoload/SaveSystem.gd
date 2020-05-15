extends Node

#json result from save file
var _json_result

#Checks if the save files exist
var do_file_exist = true

#All data needed for saving the game. Taken from PlayerData.gd
func get_savedata():
	var savedata = {
	"character": PlayerData.character,
	"character flip": PlayerData.character_flip,
	"Shoot": PlayerData.shoot,
	"retry": PlayerData.retry,
	"animal_list": PlayerData.animal_lists,
	"boughtCharacters": PlayerData.boughtCharacters,
	"coin": PlayerData.coin,
	"diamond": PlayerData.diamonds,
	"deaths": PlayerData.deaths,
	"position": PlayerData.position,
	"animals": PlayerData.animals,
	"bow": PlayerData.bow,
	"task_completed": PlayerData.task_completed,
	"catched animals": PlayerData.catched_animals,
	"last animal": PlayerData.last_animal,
	"current habitat": PlayerData.get_current_habitat(),
	"tutorial": PlayerData.tutorial
	}
	return savedata

#Creates a json file which is containing all player data
#Also saving the current scene the player is in and saving it
#as a tscn file
func save():
	var data_string = JSON.print(get_savedata())
	var file = File.new()
	
	var PATH = "user://json.json"
	
	file.open(PATH, file.WRITE)
	file.store_string(data_string)
	file.close()
	
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("user://loadscene.tscn", packed_scene)

#Load the data from the json file and scene file (tscn)
func loadgame():
	var file = File.new()
	file.open("user://json.json", file.READ)
	var json = file.get_as_text()
	_json_result = JSON.parse(json).result
	file.close()
	_load_playerdata()
	Global.load_scene("user://loadscene.tscn")

#Sets the data to player data
func _load_playerdata():
	PlayerData.character = _json_result["character"]
	PlayerData.character_flip = _json_result["character flip"]
	PlayerData.shoot = _json_result["Shoot"]
	PlayerData.retry = _json_result["retry"]
	PlayerData.animal_lists = _json_result["animal_list"]
	PlayerData.boughtCharacters = _json_result["boughtCharacters"]
	PlayerData.coin = _json_result["coin"]
	PlayerData.diamonds = _json_result["diamond"]
	PlayerData.deaths = _json_result["deaths"]
	PlayerData.position = _json_result["position"]
	PlayerData.animals = _json_result["animals"]
	PlayerData.bow = _json_result["bow"]
	PlayerData.task_completed = _json_result["task_completed"]
	PlayerData.catched_animals = _json_result["catched animals"]
	PlayerData.last_animal = _json_result["last animal"]
	PlayerData.tutorial = _json_result["tutorial"]
	PlayerData.current_habitat = _json_result["current habitat"]