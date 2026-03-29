extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player = $AnimationPlayer

	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		game_manager.coin += 1
		animation_player.play("pickup")
		queue_free()
