extends CharacterBody2D

@export var velocidad : float = 500.0
@export var fuerza_salto : float = 400.0
@export var gravedad : float = 1000.0  # Puedes ajustar la gravedad si es necesario

func _physics_process(delta):
	# Movimiento horizontal
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1  # Mover hacia arriba
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1  # Mover hacia abajo

	# Normalizar el vector de entrada para evitar que el movimiento diagonal sea más rápido
	velocity = input_vector.normalized() * velocidad

	# Mostrar si el personaje está tocando el suelo
	print("¿Está en el piso?: ", is_on_floor())

	# Saltar si está en el suelo
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -fuerza_salto
	else:
		# Aplicar gravedad mientras está en el aire
		velocity.y += gravedad * delta

	# Mover al personaje
	move_and_slide()
