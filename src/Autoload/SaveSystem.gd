extends Node

var _json_result
var do_file_exist = true

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

func save():
	var data_string = JSON.print(get_savedata())
	var file = File.new()
	
	var PATH = "res://src/menu_system/main_menu/LoadGame/json.json"
	
	file.open(PATH, file.WRITE)
	file.store_string(data_string)
	file.close()
	
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://src/menu_system/main_menu/LoadGame/loadscene.tscn", packed_scene)

func loadgame():
	var file = File.new()
	file.open("res://src/menu_system/main_menu/LoadGame/json.json", file.READ)
	var json = file.get_as_text()
	_json_result = JSON.parse(json).result
	file.close()
	_load_playerdata()
	Global.load_scene("res://src/menu_system/main_menu/LoadGame/loadscene.tscn")

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