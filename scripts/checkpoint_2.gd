extends Sprite2D

@onready var killzone_level_2: Area2D = $"../../KillzoneLevel2"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalScript.checkpoint_2_pos = $Marker2D.global_position
		if GlobalScript.previous_checkpoint_node:
			GlobalScript.previous_checkpoint_node._update_sprite()
		GlobalScript.previous_checkpoint_node = self
		_update_sprite()
		print("2nd Checkpoint Updated")

func _update_sprite() -> void:
	if $Marker2D.global_position == GlobalScript.checkpoint_2_pos:
		frame = 0.5
	else:
		frame = 0
