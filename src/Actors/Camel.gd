extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1
export var coin: = 200
var lives = 3
var animal = "Camel"

func _ready():
	pass
	
	
#	Makes the animal walk in x-direction
func _physics_process(delta: float) -> void:
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimationPlayer.play("move_right")
	else:
		$AnimationPlayer.play("move_left")
		
		
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	
#	Makes the animal turn if it hits a wall/animal/person
	if is_on_wall():
		direction = direction * -1


#	If arrow enters the animals Area2D, it either loses a life or dies if zero lives remains
func _on_Area2D_area_entered(area: Area2D) -> void:
	if PlayerData.get_arrow_state() == true:
		time_to_live()
		if lives == 0:
			die()

#	If animal dies, the player gets coins and the animal on the list
func die()->void:
	PlayerData.coin += coin
	PlayerData.set_animal_list(animal)
	queue_free()
	
#	If animal is hit by arrow, the animal loses a life
func time_to_live()->void:
	lives = lives -1
