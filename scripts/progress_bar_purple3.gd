extends TextureProgressBar

@onready var purple_mini_boss_3: Node2D = $".."

func _ready() -> void:
	purple_mini_boss_3.healthChanged.connect(update)
	update()

func update():
	value = purple_mini_boss_3.currentHealth * 10 / purple_mini_boss_3.maxHealth
