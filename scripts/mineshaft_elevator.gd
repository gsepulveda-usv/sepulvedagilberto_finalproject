extends Node2D

@onready var red_dino: CharacterBody2D = $"../Red Dino"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		set_physics_process(false)
		$TextureRect/AnimationPlayer.play("fade_to_black")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/end_of_level.tscn")
