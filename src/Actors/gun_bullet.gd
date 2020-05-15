extends Area2D

#runs all the time and makes the animation for the bullet
func _process(delta: float) -> void:
	if PlayerData.bow == false:
		if Input.is_action_pressed("Space"):
			if PlayerData.get_character_flip() == true:
				get_parent().get_node("AnimationPlayer").play("Shoot_left")
				
			elif PlayerData.get_character_flip() == false:
				get_parent().get_node("AnimationPlayer").play("Shoot")
			
		
	
