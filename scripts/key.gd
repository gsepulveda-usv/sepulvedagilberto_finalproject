extends Node2D

func _ready():
	if self.name in GlobalScript.key_found:
		queue_free()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	GlobalScript.key_found.append(self.name)
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.3).timeout
	queue_free()
