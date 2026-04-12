extends StaticBody2D

@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player has entered the area")
		timer.start(3)
		print("Timer has started")

func _on_timer_timeout() -> void:
	var tween = create_tween()
	print("Tween has been created")
	tween.tween_property(self, "modulate:a", 0, 2)
	print("Object has been modulated")
	collision_shape_2d.position = Vector2(-10000,20000)
	print("Collision has been moved")
