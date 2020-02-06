extends Actor

 
var array = ["Boy","Girl","Robot","Templerun_boy", "Templerun_girl", "Dino", "Knight", "Jack", "Ninja_boy", "Ninja_girl", "Santa", "Zombie_girl", "Zombie_boy"]
onready var what_character = get_node("/root/PlayerData").get_character()
onready var character = get_node("Sprite/"+what_character)
onready var character_objects
onready var character_animation = get_node("AnimationPlayer")
onready var bow_weapon = get_node("/root/PlayerData")
onready var character_flip = get_node("/root/PlayerData")




func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	die()


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap, FLOOR_NORMAL, true)
	character.visible = true
	move_sprite()
	turn_of_sprite()
	set_weapon()
	
	
func set_weapon()->void:
	if choosen_weapon() == false:
		character_objects = get_node("Sprite/"+what_character+"/Shoot")
		
func choosen_weapon()->bool:
	return bow_weapon.get_weapon()

	
	
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
	elif Input.is_action_pressed("move_left"):
		flip_character(true)
		character.play("Run")
		get_sprite_position("move_right")
	elif Input.is_action_pressed("move_right"):
		flip_character(false)
		character.play("Run")
		get_sprite_position("move_left")
	elif Input.is_action_pressed("mouse_left"):

		if choosen_weapon() == false:
			character.play("Shoot")
			character_objects.visible = true
			if character.flip_h == true:
				character_objects.flip_h = true
				character_animation.play(what_character + "_left")
			else:
				character_animation.play(what_character)
				character_objects.flip_h = false
	else:
		character.play("Idle")
		
		
		

	
func flip_character(right:bool)->void:
	character.flip_h = right
	character_flip.set_character_flip(right)
		
	

func get_sprite_position(direction: String)->void:
	
	if what_character == "Boy" && direction == "move_right":
			character.position.x = -40
	elif what_character == "Boy" && direction == "move_left":
			character.position.x = 40
	elif what_character == "Girl" && direction == "move_right":
			character.position.x = -10
	elif what_character == "Girl" && direction == "move_left":
			character.position.x = 0


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


func die() -> void:
	PlayerData.deaths += 1
	queue_free()
	

