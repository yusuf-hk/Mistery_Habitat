extends Sprite

#list of all character
var arraylist = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]
#state variable for if the arrow has entered something else than animal
onready var state

#function for returns a value depending on 
#if the arrow has entered something else than animals
func _on_Arrow_body_entered(body) -> void:
	if arraylist.has(body.name) == false:
		state = true
	else:
		state = false
func get_arrow_state()->bool:
	return state

func _on_Arrow_body_exited(body) -> void:
	state = false
