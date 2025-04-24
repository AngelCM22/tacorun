extends Node

@onready var player = $Player
var scoreJugador :=0

func _ready() -> void:
	player.connect("scoreUP",subirScore)
	player.connect("playerDied",morir)

func subirScore():
	scoreJugador += 1
	$Score.text = str(scoreJugador)
	pass
func morir():
	$"Reinicio/HBoxContainer/Final Score".text = str(scoreJugador)
	$Reinicio.show()
	get_tree().paused = true
	
	
