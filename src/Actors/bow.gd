extends Sprite

onready var what_character = get_node("/root/PlayerData").get_character()
onready var bow = self
onready var arrow = get_node("arrow")
onready var bow_animation = get_node("bow_animation")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("character_updated",self, "get_weapon")
	
func _physics_process(delta: float) -> void:
	if get_weapon() == true:
		
		if Input.is_action_pressed("Space"):
			get_node("arrow").visible = true
			if get_flip() == true:
				bow_animation.play("Shoot_Left")
				bow.position.x = -5
				
			elif get_flip() == false:
				bow_animation.play("Shoot")	
				bow.position.x = 5
				
		else:
			get_node("arrow").visible = false
			if get_flip() == true:
				bow_animation.play("Idle_Left")
				bow.position.x = -10

				
			elif get_flip() == false:
				bow_animation.play("Idle")	
				bow.position.x = 10
				
				
				
func get_flip()->bool:
	return PlayerData.get_character_flip()	

func get_weapon()->bool:
	what_character = get_node("/root/PlayerData").get_character()
	var state = false
	if what_character == "Robot" or what_character == "Ninja_boy" or what_character == "Ninja_girl" or what_character == "Templerun_girl":
		bow.visible = false
		PlayerData.set_bow(false)
	else:
		bow.visible = true
		PlayerData.set_bow(true)
		state = true
	return state



func _on_Area2D_body_entered(body) -> void:
	if Input.is_action_pressed("Space"):
		if body.name != "Panda!"|| body.name != "Polar bear" ||body.name != "Penguin"||body.name != "Monkey" ||body.name != "Brown bear"||body.name != "Camel"||body.name != "Cat"||body.name != "Boar"||body.name != "Fish"||body.name != "Vulture"||body.name != "Elephant":
			if get_flip() == true:
				bow_animation.play("Idle_Left")
				bow.position.x = -10
			elif get_flip() == false:
				bow_animation.play("Idle")	
				bow.position.x = 10
