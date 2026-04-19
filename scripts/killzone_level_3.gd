extends Area2D

var player
@onready var checkpoint_2: Sprite2D = $"../../../Checkpoints/Checkpoint2"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died! Killzone Level 3")
	Engine.time_scale = 0.5
	timer.start()
	await get_tree().create_timer(0.5).timeout
	body.global_position = GlobalScript.checkpoint_2_pos
	print("Respawning player")
	print(global_position)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
