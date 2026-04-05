extends Node2D

const SPEED = 60

var direction = -1
var health = 10

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	position.x += direction * SPEED * delta
	
func _on_killzone_body_entered(body: Node2D) -> void:
	if body.name == "Red Dino" :
		health = 0
		body.bounce_after_stomp()
		$AnimatedSprite2D.play("dead")
		await $AnimatedSprite2D.animation_finished
		queue_free()

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "dead":
		queue_free()

func _on_kill_box_body_entered(body: Node2D) -> void:
	if body.name == "Red Dino" :
		body.bounce_after_stomp()
		health -= 1
	print("Enemy hit! Remaining health: ", health)
	if health < 0:
		$AnimatedSprite2D.play("dead")
	await $AnimatedSprite2D.animation_finished
	queue_free()

func _on_kilzone_level_2_body_entered(body: Node2D) -> void:
	if body.name == "Red Dino" :
		health = 0
		body.bounce_after_stomp()
		$AnimatedSprite2D.play("dead")
		await $AnimatedSprite2D.animation_finished
		queue_free()
