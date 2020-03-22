extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

func _ready():
	pass
	
	
	
func _physics_process(delta: float) -> void:
	velocity.x = SPEED * direction
	
	if direction == 1:
		$AnimationPlayer.play("move_right")
	else:
		$AnimationPlayer.play("move_left")
		
	
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	
	
	if is_on_wall():
		direction = direction * -1
	#	$RayCast2D.position.x *= -1
		
	#if $RayCast2D.is_colliding() == false:
	#	direction = direction * -1
	#	$RayCast2D.position.y *= -1
		