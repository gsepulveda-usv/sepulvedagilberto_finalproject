extends StaticBody2D

func _ready():
	if self.name in GlobalScript.opened_doors:
		queue_free()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if self.name in GlobalScript.key_found:
		$AnimationPlayer.play("open")
		$Sprite2D/AudioStreamPlayer2D2.play()
		await $AnimationPlayer.animation_finished
		GlobalScript.opened_doors.append(self.name)
		queue_free()
		
	if not self.name in GlobalScript.key_found:
		$AnimationPlayer.play("closed")
		$Sprite2D/AudioStreamPlayer2D.play()
