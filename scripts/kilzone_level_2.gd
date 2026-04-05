extends Area2D

var player
var checkpoint
var respawn_point = Vector2(3342, -31)
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	player.position = respawn_point
	respawn_point = checkpoint
