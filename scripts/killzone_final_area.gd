extends Area2D

var player
@onready var checkpoint_3: Sprite2D = $"../../../Checkpoints/Checkpoint3"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died! Killzone Final Area")
	Engine.time_scale = 0.5
	timer.start()
	await get_tree().create_timer(1.0).timeout
	body.global_position = GlobalScript.checkpoint_3_pos
	print("Respawning player")

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
