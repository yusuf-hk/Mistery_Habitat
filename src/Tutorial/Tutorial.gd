extends Node2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass




func _on_Coin_tutorial_body_entered(body: PhysicsBody2D) -> void:
	get_node("Coin_collection/Label").show()


func _on_Coin_tutorial2_body_entered(body: PhysicsBody2D) -> void:
	get_node("Coin_collection").queue_free()



func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	get_node("Direction_tutorial").popup()

	
	



func _on_Button_pressed() -> void:
	get_node("Direction_tutorial").queue_free()
	

	
