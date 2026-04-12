extends TextureProgressBar

@onready var blue_mini_boss: Node2D = $".."

func _ready() -> void:
	blue_mini_boss.healthChanged.connect(update)
	update()

func update():
	value = blue_mini_boss.currentHealth * 10 / blue_mini_boss.maxHealth
