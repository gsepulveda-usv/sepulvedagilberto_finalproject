extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var health = 1
var isDead: bool = false
var can_move = true
@onready var killzone: Area2D = $"../Killzone"
@onready var killzone_level_2: Area2D = $"../KillzoneLevel2"
@onready var killzone_level_3: Area2D = $"../KillzoneLevel3"
@onready var killzone_final_area: Area2D = $"../KillzoneFinalArea"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")

	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func bounce_after_stomp():
	velocity.y = -300
	
func _on_killzone_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("killzone"):
		print("Player has entered a killzone - Red Dino Script")
		velocity = Vector2.ZERO
		set_physics_process(false)
		print("Physic processes have stopped")
		animated_sprite.play("Death")
		await $AnimatedSprite2D.animation_finished

func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies") and is_on_floor():
		print("Player killed by hurtbox entered body - Red Dino Script")
		velocity = Vector2.ZERO
		print("Velocity has dropped to zero")
		set_physics_process(false)
		print("Physic processes have stopped")
		animated_sprite.play("Death")
		print("Playing death animation")
		await $AnimatedSprite2D.animation_finished
		print("Death animation has finished")

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		print("Player killed by hurtbox area entered - Red Dino Script")
		velocity = Vector2.ZERO
		print("Velocity has dropped to zero")
		set_physics_process(false)
		print("Physic processes have stopped")
		animated_sprite.play("Death")
		print("Playing death animation")
		await $AnimatedSprite2D.animation_finished
		print("Death animation has finished")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "Death":
		set_physics_process(true)
		print("Physic processes have restarted")
