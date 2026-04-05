extends Node2D

var player_scene = preload("res://scenes/red_dino.tscn")
var player = null

func _process(_delta: float) -> void:
	if player == null:
		var new_object = player_scene.instantiate()
		new_object.position = position
		get_parent().add_child(new_object)
		player = new_object
