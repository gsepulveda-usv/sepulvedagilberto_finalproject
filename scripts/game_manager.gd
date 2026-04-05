extends Node

var coins = 0
@onready var coin_counter = $CoinInterface/CoinCounter

func _process(_delta: float) -> void:
	coin_counter.text = "Coins = " + str(coins)
