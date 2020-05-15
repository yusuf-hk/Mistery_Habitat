class_name outPortal2D
extends Node2D

#Relocates the player by changing the player position to this "outportal" position (coordinates)
func _ready() -> void:
	PlayerData.position = self.position
	