extends Area2D

@onready var start_point: Sprite2D = $"../../../Checkpoints/StartPoint"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("You died! Killzone 1")
		Engine.time_scale = 0.5
		print("Engine time slows down")
		timer.start()
		print("Timer starts")
		await get_tree().create_timer(0.5).timeout
		print("Waiting on timer to timeout")
		body.global_position = GlobalScript.start_point_pos
		print("Respawning player")
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
