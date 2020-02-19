extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var diamonds: = 1




func picked() -> void:
	PlayerData.diamonds += diamonds
	anim_player.play("Picked")
	self.queue_free()
	


func _on_Diamond_body_entered(KinematicBody2D) -> void:
	picked()
