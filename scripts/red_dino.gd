extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var respawn_point = Vector2(3342, -31)
var hearts_list : Array[TextureRect]
var health = 3
var isDead = false

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

func bounce_after_stomp():
	velocity.y = -300
	
func set_checkpoint(pos):
	respawn_point = pos

func respawn_player():
	if respawn_point == Vector2.ZERO:
		get_tree().reload_current_scene()
	
