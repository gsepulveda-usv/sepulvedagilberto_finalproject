extends AnimatedSprite2D

@onready var game_manager: Node = %GameManager

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		%GameManager.coins += 1
		$AudioStreamPlayer.play()
		await get_tree().create_timer(0.12).timeout
		queue_free()
		
