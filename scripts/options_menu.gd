extends Control

var button_type = null
@onready var fade_transition = $"Fade Transition"
@onready var fade_timer = $"Fade Transition/fade_timer"

func _on_back_pressed() -> void:
	button_type = "back"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")

func _on_volume_pressed() -> void:
	button_type = "volume"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")

func _on_configs_pressed() -> void:
	button_type = "configs"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")

func _on_fade_timer_timeout():
	if button_type == "back" :
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		
	elif button_type == "volume" :
		get_tree().change_scene_to_file("res://scenes/volume_menu.tscn")
		
	elif button_type == "configs" :
		get_tree().change_scene_to_file("res://scenes/button_menu.tscn")
