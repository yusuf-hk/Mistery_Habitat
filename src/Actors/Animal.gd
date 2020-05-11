extends Actor

const GRAVITY = 10
const SPEED = -200
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1
export var coin: = 700
var lives = 3
var animal = "Cat"

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	velocity.x = SPEED * direction
	
	if direction == 1:
		$Cat.flip_h = true
	else:
		$Cat.flip_h = false
		
	$Cat.play("Run")
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1

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
