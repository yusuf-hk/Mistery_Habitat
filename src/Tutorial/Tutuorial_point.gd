extends Control
var value
var button_state
func _ready() -> void:
	button_state = false



func _on_Button_pressed() -> void:
	value = false
	self.visible = value
	get_node("ColorRect").visible = value
	get_node("ColorRect/Welcome").visible = value
	get_node("ColorRect/Coins and diamonds").visible = value
	get_node("ColorRect/Hidden_rooms").visible = value
	get_node("ColorRect/Portal").visible = value
	button_state = true
	
	
func get_button_state()->bool:
	return button_state