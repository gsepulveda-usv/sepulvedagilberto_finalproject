extends Control

func _ready() -> void:
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")
	$"Fade Transition/fade_timer".start(2)

func _on_fade_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/godot_logo.tscn")
