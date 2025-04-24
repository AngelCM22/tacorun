extends CharacterBody2D

var speed := 500
var jump_force := 900
var gravity := 40

signal scoreUP
signal playerDied

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var inputVel = Input.get_axis("ui_left", "ui_right")
	velocity.x = inputVel * speed
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_force
	
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("indle")
		
	if inputVel != 0:
		animated_sprite_2d.flip_h = inputVel < 0

func subirScore():
	emit_signal("scoreUP")

func morirse():
	emit_signal("playerDied")
