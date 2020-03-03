extends AnimatedSprite

onready var what_character = get_node("/root/PlayerData").get_character()
onready var bow = self
onready var arrow = get_node("arrow")
onready var bow_animation = get_node("bow_animation")

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if get_weapon() == true:
		bow.flip_h = get_flip()
		arrow.flip_h = get_flip()
		if Input.is_action_pressed("mouse_left"):
			if get_flip() == true:
				bow_animation.play("Shoot_left")
				bow.position.x = -7.5
				
			elif get_flip() == false:
				bow_animation.play("Shoot")	
				bow.position.x = 7.5
				
		else:
			if get_flip() == true:
				bow_animation.play("Idle_left")
				bow.position.x = -10
				
			elif get_flip() == false:
				bow_animation.play("Idle")	
				bow.position.x = 10
				
				
func get_flip()->bool:
	return PlayerData.get_character_flip()	

func get_weapon()->bool:
	var state = false
	if what_character == "Robot" or what_character == "Ninja_boy" or what_character == "Ninja_girl" or what_character == "Templerun_girl":
		bow.visible = false
		PlayerData.set_bow(false)
	else:
		bow.visible = true
		PlayerData.set_bow(true)
		state = true
	return state
