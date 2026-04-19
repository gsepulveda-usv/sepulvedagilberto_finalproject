extends StaticBody2D

@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label
@onready var countdown: Timer = $Label/Countdown

func time_left():
	var time_left = timer.time_left
	var second = int(time_left) % 60
	return [second]

func _process(_delta: float) -> void:
	label.text = "%02d" % time_left()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player has entered the area")
		timer.start(20)
		print("Timer has started")
		countdown.start(20)
		print("Green countdown started")

func _on_timer_timeout() -> void:
	var tween = create_tween()
	print("Tween has been created")
	tween.tween_property(self, "modulate:a", 0, 2)
	print("Object has been modulated")
	collision_shape_2d.position = Vector2(-10000,20000)
	print("Collision has been moved")
