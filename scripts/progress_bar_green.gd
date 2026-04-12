extends TextureProgressBar

@onready var green_mini_boss: Node2D = $".."

func _ready() -> void:
	green_mini_boss.healthChanged.connect(update)
	update()

func update():
	value = green_mini_boss.currentHealth * 10 / green_mini_boss.maxHealth
