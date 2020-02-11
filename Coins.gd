extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var PlayerData = get_node("/root/PlayerData")

export var score: = 10


func _on_Coins_body_entered(body: PhysicsBody2D) -> void:
	picked()

func picked() -> void:
	PlayerData.score += score
	anim_player.play("picked")