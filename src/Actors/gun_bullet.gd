extends Area2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func _process(delta: float) -> void:
	if PlayerData.bow == false:
		if Input.is_action_pressed("Space"):
			if PlayerData.get_character_flip() == true:
				get_parent().get_node("AnimationPlayer").play("Shoot_left")
				
			elif PlayerData.get_character_flip() == false:
				get_parent().get_node("AnimationPlayer").play("Shoot")
			
		
	
