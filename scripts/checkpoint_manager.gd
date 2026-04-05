extends Node

var last_location
var player

func _ready() -> void:
	player = get_parent().get_node("Red Dino")
	last_location = player.global_position
