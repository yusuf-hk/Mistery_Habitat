extends Actor

 
var array = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_boy"]

onready var what_character = get_node("/root/PlayerData").get_character()
onready var character = get_node("Sprite/"+what_character)
onready var character_objects
onready var character_animation = get_node("AnimationPlayer")

func _ready() -> void:
	PlayerData.connect("died", self, "die")
	PlayerData.connect("character_updated", self, "updateSkin")
	PlayerData.connect("character_updated", self, "set_weapon")


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
	character.visible = true
	move_sprite()
	turn_of_sprite()
	updateSkin()
	set_weapon()
	

	
func set_weapon()->void:
	if choosen_weapon() == false:
		var weapon = "Sprite/"+what_character+"/Shoot"

		character_objects = get_node(weapon)
	
		
func choosen_weapon()->bool:
	return PlayerData.bow

func updateSkin():
	what_character = get_node("/root/PlayerData").get_character()
	character = get_node("Sprite/"+what_character)
	turn_on_sprite()
	turn_of_sprite()

func turn_on_sprite():
	for i in int(array.size()):
		var some_character = array[i]
		if what_character == some_character:
			some_character = "Sprite/"+ some_character
			get_node(some_character).visible = true
	
func turn_of_sprite()->void:
	for i in int(array.size()):
		var some_character = array[i]
		if what_character != some_character:
			some_character = "Sprite/"+ some_character
			get_node(some_character).visible = false


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)
	
	
	
	
func move_sprite()-> void:

	if Input.is_action_pressed("jump"):
		character.play("Jump")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			character.play("Shoot")
			shoot_visibility(true)

	elif Input.is_action_pressed("move_left"):
		flip_character(true)
		character.play("Run")
		get_sprite_position("move_right")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			character.play("Shoot")
			shoot_visibility(true)

	elif Input.is_action_pressed("move_right"):
		flip_character(false)
		character.play("Run")
		get_sprite_position("move_left")
		shoot_visibility(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			character.play("Shoot")
			shoot_visibility(true)

	elif Input.is_action_pressed("Space"):
		PlayerData.set_arrow_state(true)
		character.play("Shoot")
		shoot_visibility(true)
		
	else:
		shoot_visibility(false)
		character.play("Idle")
		PlayerData.set_arrow_state(false)
		if Input.is_action_pressed("Space"):
			PlayerData.set_arrow_state(true)
			character.play("Shoot")
			shoot_visibility(true)
		
		
func shoot_visibility(val:bool)->void:
	if PlayerData.bow == false && (PlayerData.character == "Robot" or PlayerData.character  == "Ninja_boy" or PlayerData.character  == "Ninja_girl" or PlayerData.character  == "Templerun_girl"):
		var weapon = "Sprite/"+what_character+"/Shoot"
		get_node(weapon).visible = val
	
func flip_character(right:bool)->void:
	character.flip_h = right
	PlayerData.set_character_flip(right)
		
	

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


func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse: float) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	return Vector2(linear_velocity.x, stomp_jump)

	
func die()->void:
	PlayerData.retry()
	PlayerData.retry = false
	queue_free()
