extends Area2D

var health = 3
var isDead = false

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	health -= 1
	
	if health < 0:
		isDead = true
		print("You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
