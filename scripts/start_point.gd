extends Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalScript.start_point_pos = $Marker2D.global_position
		if GlobalScript.previous_checkpoint_node:
			GlobalScript.previous_checkpoint_node._update_sprite()
		GlobalScript.previous_checkpoint_node = self
		_update_sprite()
		print("Start Respawn Position")

func _update_sprite() -> void:
	if $Marker2D.global_position == GlobalScript.start_point_pos:
		frame = 0.5
	else:
		frame = 0
