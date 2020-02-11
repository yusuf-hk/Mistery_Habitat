extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 10




func picked() -> void:
	PlayerData.score += score
	anim_player.play("Picked")
	self.queue_free()


func _on_Coins_body_entered(KinematicBody2D) -> void:
	picked()
	
