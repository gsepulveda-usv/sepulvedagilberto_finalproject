extends ProgressBar

@onready var green_mini_boss: Node2D = $"../.."

func _ready() -> void:
	green_mini_boss.healthChanged.connect(update)
	update()
	print("Health bar connected")

func update():
	value = green_mini_boss.currentHealth / green_mini_boss.maxHealth
	print("Updating health bar")
