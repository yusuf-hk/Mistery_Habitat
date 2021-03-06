extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1
export var coin: = 700
var lives = 3
var animal = "Fish"

var fish_state = true

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	if fish_state:
		update_fish_skin()
		fish_state = false
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1

func update_fish_skin():
	var fisharray =  ["Blue Fish", "Green Fish", "Orange Fish", "Purple Fish", "Red Fish"]
	var fish = fisharray[randi() % fisharray.size()]
	
	if fish == "Blue Fish":
		$AnimatedSprite.play(fish)
	elif fish == "Green Fish":
		$AnimatedSprite.play(fish)
	elif fish == "Orange Fish":
		$AnimatedSprite.play(fish)
	elif fish == "Purple Fish":
		$AnimatedSprite.play(fish)
	elif fish == "Red Fish":
		$AnimatedSprite.play(fish)

func _on_Area2D_area_entered(area: Area2D) -> void:
	if PlayerData.get_arrow_state() == true:
		time_to_live()
		if lives == 0:
			die()
	
func die()->void:
	PlayerData.coin += coin
	PlayerData.set_animal_list(animal)
	queue_free()
	
func time_to_live()->void:
	lives = lives -1