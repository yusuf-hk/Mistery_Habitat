extends Actor

#variable for all the characters
var array = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]

#variable for the character that is in use
onready var what_character = get_node("/root/PlayerData").get_character()

#variable fot the character sprite
onready var character = get_node("Sprite/"+what_character)

#variable for the characters weapon if it doesnt use the bow
onready var character_objects

#variable for the characters animation
onready var character_animation = get_node("AnimationPlayer")

# ready function that will run once everytime the the game initializes
func _ready() -> void:
	#connects different variables in playerdata to this scripts functions
	PlayerData.connect("died", self, "die")
	PlayerData.connect("character_updated", self, "updateSkin")
	PlayerData.connect("character_updated", self, "set_weapon")

# runs all the time the player is moving
func _physics_process(delta: float) -> void:
	what_character = get_node("/root/PlayerData").get_character()
	character = get_node("Sprite/"+what_character)
	
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
	character.visible = true
	move_sprite()
	turn_of_sprite()

#updates the sprite
func updateSkin():
	what_character = get_node("/root/PlayerData").get_character()
	character = get_node("Sprite/"+what_character)
	turn_on_sprite()
	turn_of_sprite()
	
#turns on sprite
func turn_on_sprite():
	for i in int(array.size()):
		var some_character = array[i]
		if what_character == some_character:
			some_character = "Sprite/"+ some_character
			get_node(some_character).visible = true

#set the gun sprite if its the right character
func set_weapon()->void:
	if choosen_weapon() == false:
		var weapon = "Sprite/"+what_character+"/Shoot"

		character_objects = get_node(weapon)
	
#returns the state of wepon, true if arrow, false if gun
func choosen_weapon()->bool:
	return PlayerData.bow

#turns of the sprites
func turn_of_sprite()->void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character != some_character:
			some_character = "Sprite/"+ some_character
			get_node(some_character).visible = false

# gets the direction the player wants to go from inputs
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)

#turns on the different animated sprites for the characters
func move_sprite()-> void:
	if Input.is_action_pressed("jump"):
		character.play("Jump")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			if choosen_weapon() == false:
				character.play("Shoot")
				shoot_visibility(true)

	elif Input.is_action_pressed("move_left"):
		flip_character(true)
		character.play("Run")
		get_sprite_position("move_right")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			if choosen_weapon() == false:
				character.play("Shoot")
				shoot_visibility(true)

	elif Input.is_action_pressed("move_right"):
		flip_character(false)
		character.play("Run")
		get_sprite_position("move_left")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			if choosen_weapon() == false:
				character.play("Shoot")
				shoot_visibility(true)

	elif Input.is_action_pressed("Space"):
		PlayerData.set_arrow_state(true)
		if choosen_weapon() == false:
			character.play("Shoot")
			shoot_visibility(true)
		
	else:
		shoot_visibility(false)
		character.play("Idle")
		PlayerData.set_arrow_state(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			if choosen_weapon() == false:
				character.play("Shoot")
				shoot_visibility(true)
		
#turns on the visibility of the bullet for the right characters
func shoot_visibility(val:bool)->void:
	if PlayerData.bow == false && (PlayerData.character == "Robot" or PlayerData.character  == "Ninja_boy" or PlayerData.character  == "Ninja_girl" or PlayerData.character  == "Templerun_girl"):
		var weapon = "Sprite/"+what_character+"/Shoot"
		get_node(weapon).visible = val

#flip the character from moving either right or left
func flip_character(right:bool)->void:
	character.flip_h = right
	PlayerData.set_character_flip(right)
		
	
#set the position of the sprites so the collitionshape fits with the sprite
func get_sprite_position(direction: String)->void:
	if what_character == "Boy" && direction == "move_right":
			character.position.x = -40
	elif what_character == "Boy" && direction == "move_left":
			character.position.x = 40
	
	elif what_character == "Girl" && direction == "move_right":
			character.position.x = 20
	elif what_character == "Girl" && direction == "move_left":
			character.position.x = -5
			
	elif what_character == "Dino" && direction == "move_right":
			character.position.x = -40
	elif what_character == "Dino" && direction == "move_left":
			character.position.x = 40
	
	elif what_character == "Knight" && direction == "move_right":
			character.position.x = -15
	elif what_character == "Knight" && direction == "move_left":
			character.position.x = 15
	
	elif what_character == "Jack" && direction == "move_right":
			character.position.x = -15
	elif what_character == "Jack" && direction == "move_left":
			character.position.x = 15
	
	elif what_character == "Templerun_girl" && direction == "move_right":
			character.position.x = 10
	elif what_character == "Templerun_girl" && direction == "move_left":
			character.position.x = -10
	
	elif what_character == "Santa" && direction == "move_right":
			character.position.x = -20
	elif what_character == "Santa" && direction == "move_left":
			character.position.x = 20
			
	elif what_character == "Zombie_boy" && direction == "move_right":
			character.position.x = -10
	elif what_character == "Zombie_boy" && direction == "move_left":
			character.position.x = 10

#calculates the velocity
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

#sends signal to end the game
func die()->void:
	PlayerData.retry()
	PlayerData.retry = false
	queue_free()
