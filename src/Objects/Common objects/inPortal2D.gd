class_name inPortal2D
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_inPortal2D_body_entered(body: PhysicsBody2D) -> void:
	teleport()

# This will give you an error because the type references itself, parsing itself in an infinite loop
export var target := _on_inPortal2D_body_entered()

# Teleports the character at the target Portal2D's location
func teleport(character: Character, target_name: String = "") -> void:
	var portals_container: Node = get_parent()
	var target := portals_container.find(target_name) as inPortal2D
	if not target:
		return
	character.global_position = target.global_position
