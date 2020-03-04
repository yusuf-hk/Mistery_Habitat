extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var coin: = 1




func picked() -> void:
	PlayerData.coin += coin
	anim_player.play("Picked")
	self.queue_free()


func _on_Coins_body_entered(KinematicBody2D) -> void:
	picked()
	
