extends Area2D

#animation player to make the diamond float
onready var anim_player: AnimationPlayer = $AnimationPlayer

#value of one diamond
export var diamonds: = 1



# ads a diamond to the playerdata
func picked() -> void:
	PlayerData.diamonds += diamonds
	anim_player.play("Picked")
	self.queue_free()
	

#runs if coin is caught
func _on_Diamond_body_entered(KinematicBody2D) -> void:
	picked()
