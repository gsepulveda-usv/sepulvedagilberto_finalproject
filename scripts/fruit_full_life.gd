extends AnimatedSprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.14).timeout
		queue_free()
