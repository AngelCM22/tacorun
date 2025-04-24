extends Node2D

var muchostacos = preload("res://tacos.tscn")

func _ready() -> void:
	$Timer.stop()
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()

func _on_timer_timeout() -> void:
	var tacos = muchostacos.instantiate()
	add_child(tacos)
