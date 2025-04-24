extends Area2D

var esTaco = false
var carrito = preload("res://Assets/ChatGPT Image 11 abr 2025, 21_02_47.png")

func _ready() -> void:
	if randf() > .5:
		esTaco = true
	if !esTaco:
		$"ChatGptImage11Abr2025,210623".texture = carrito

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if esTaco:
			body.subirScore()
		else:
			body.morirse()
		queue_free()
			
func _process(delta: float) -> void:
	position.y += 1
		
		
