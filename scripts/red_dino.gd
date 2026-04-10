extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var hearts_list : Array[TextureRect]
var health = 3
var isDead: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var h_box_container: HBoxContainer = $"../GameManager/HealthInterface/HBoxContainer"
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

func _ready() -> void:
	var hearts_parent = $"../GameManager/HealthInterface/HBoxContainer"
	for child in hearts_parent.get_children():
		hearts_list.append(child)
	print(hearts_list)

func take_damage():
	if health > 0:
		health -= 1
		print(health)
		$Damage.play("Damage")
		update_heart_display()
		
func update_heart_display():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = 1 < health

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

	if isDead:
		return
	for collision in get_slide_collision_count():
		var col = get_slide_collision(collision)
		if col.get_collider().is_in_group("enemy"):
			dead()

func bounce_after_stomp():
	velocity.y = -300
	
func dead():
	if isDead:
		isDead = true
		print("Player is Dead")
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("Death")
		print("Playing death animation")
		$CollisionShape2D.disbaled = true
		await $AnimatedSprite2D.animation_finished
		print("Death animation has finished")
		self.queue_free()

func _on_animated_sprite_2d_animation_finished() -> void:
	if isDead == true:
		queue_free()
