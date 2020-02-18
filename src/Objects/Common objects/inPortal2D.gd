extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_inPortal2D_body_entered(body: PhysicsBody2D) -> void:
	teleport()

func teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	$"/root/PlayerData".transform = $dest_Position2D.transform()



