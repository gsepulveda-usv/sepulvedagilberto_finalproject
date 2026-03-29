extends Node

var coins = 0
@onready var coin_counter: Label = $"../Coins/CoinCounter"

func _process(_delta: float) -> void:
	coin_counter.text = str(coins)
