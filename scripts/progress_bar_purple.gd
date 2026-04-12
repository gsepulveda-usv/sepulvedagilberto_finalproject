extends TextureProgressBar

@onready var purple_mini_boss: Node2D = $".."

func _ready() -> void:
	purple_mini_boss.healthChanged.connect(update)
	update()

func update():
	value = purple_mini_boss.currentHealth * 10 / purple_mini_boss.maxHealth
