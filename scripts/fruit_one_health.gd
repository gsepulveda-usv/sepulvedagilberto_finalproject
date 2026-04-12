extends AnimatedSprite2D

@onready var label: Label = $Label

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label/AnimationPlayer.play("fade in and fade out")
		await $Label/AnimationPlayer.animation_finished
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.14).timeout
		queue_free()
