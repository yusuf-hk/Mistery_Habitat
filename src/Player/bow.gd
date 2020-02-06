extends AnimatedSprite

onready var what_character = get_node("/root/PlayerData").get_character()
onready var bow = self
onready var arrow = get_node("arrow")
onready var bow_animation = get_node("bow_animation")
onready var flip = get_node("/root/PlayerData")
onready var bow_or_shoot = get_node("/root/PlayerData")

# Called when the node enters the scene tree for the first time.
func _process(delta) -> void:
	if get_weapon() == true:
		bow.flip_h = get_flip()
		arrow.flip_h = get_flip()
		if Input.is_action_pressed("mouse_left"):
			if get_flip() == true:
				bow_animation.play("Shoot_left")
				bow.position.x = -5
				
			elif get_flip() == false:
				bow_animation.play("Shoot")	
				bow.position.x = 5
				
		else:
			if get_flip() == true:
				bow_animation.play("Idle_left")
				bow.position.x = -5
				
			elif get_flip() == false:
				bow_animation.play("Idle")	
				bow.position.x = 5
				
				
func get_flip()->bool:
	return flip.get_character_flip()	

func get_weapon()->bool:
	var state = false
	if what_character == "Robot" or what_character == "Ninja_boy" or what_character == "Templerun_girl":
		bow.visible = false
		bow_or_shoot.set_weapon(false)
	else:
		bow.visible = true
		bow_or_shoot.set_weapon(true)
		state = true
	return state