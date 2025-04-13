extends Node2D

@export var velocidad : float = 100.0

func _process(delta):
	position.x -= velocidad * delta
	
	if position.x < -200:
		queue_free()
