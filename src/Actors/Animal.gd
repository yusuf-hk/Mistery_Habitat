extends Actor
export var coin: = 100
var lives = 3
var animal = "Cat"

func _ready() -> void: 
	set_physics_process(false)
	_velocity.x = -speed.x

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	


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
