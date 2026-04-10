extends Control

@onready var first_project = $"../../.."

func _input(event):
	if event.is_action_pressed("pause"): # Mapped Input
		get_tree().paused = not get_tree().paused # Toggle pause state
		$".".visible = get_tree().paused # Show/hide pause menu

func _on_resume_pressed() -> void:
	first_project.pauseMenu()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
