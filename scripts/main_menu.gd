extends Control

var button_type = null
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _on_start_pressed() -> void:
	button_type = "start"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")
	$AudioStreamPlayer2D.stop()
		
func _on_options_pressed() -> void:
	button_type = "options"
	$"Fade Transition".show()
	$"Fade Transition/fade_timer".start()
	$"Fade Transition/AnimationPlayer".play("fade_in")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_fade_timer_timeout():
	if button_type == "start" :
		get_tree().change_scene_to_file("res://scenes/transition_level_2.tscn")
	elif button_type == "options" :
		get_tree().change_scene_to_file("res://scenes/options_menu.tscn")
