tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

func _on_Portal2D_body_entered(body):
	teleport()


func teleport() -> void:
	anim_player.play("face_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


