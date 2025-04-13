extends Node2D

@export var carrito_escena: PackedScene
@export var tiempo_entre_carritos: float = 1.5
@export var rango_y: Vector2 = Vector2(50, 400)
@export var posicion_spawn_x: float = 1000  # O el borde derecho de tu juego

var timer := 0.0

func _process(delta):
	timer -= delta
	if timer <= 0:
		spawn_carrito()
		timer = tiempo_entre_carritos

func spawn_carrito():
	if carrito_escena:
		var carrito = carrito_escena.instantiate()
		carrito.position = Vector2(posicion_spawn_x, randf_range(rango_y.x, rango_y.y))
		get_parent().add_child(carrito)
