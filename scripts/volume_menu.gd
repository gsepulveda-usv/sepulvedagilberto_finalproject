extends Control

var button_type = null

func _on_back_to_options_pressed() -> void:
	button_type = "back to options"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")

func _on_back_to_main_menu_pressed() -> void:
	button_type = "back to main menu"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")

func _on_fade_timer_timeout() -> void:
	if button_type == "back to options" :
		get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

	elif button_type == "back to main menu" :
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
