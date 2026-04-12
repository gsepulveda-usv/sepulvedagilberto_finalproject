extends Node2D

signal healthChanged

const SPEED = 80

var direction = -1
var maxHealth = 10
var max_value = maxHealth
var currentHealth = 10
var isDead: bool = false
var current_value = currentHealth
var can_attack: bool = false
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

func _on_kill_box_body_entered(body: Node2D) -> void:
	if body.name == "Red Dino" :
		currentHealth -= 1
		currentHealth -= 1
		healthChanged.emit()
		print("Sending signal to health bar")
	print("Enemy hit! Remaining health: ", currentHealth)
	body.bounce_after_stomp()
	if currentHealth <= 0:
		print("Health is 0, Enemy is dead!")
		$AnimatedSprite2D.play("dead")
		print("Dead animation is playing")
		await $AnimatedSprite2D.animation_finished
		print("Dead animation has finished")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "dead":
		queue_free()
		print("Enemy has died")
