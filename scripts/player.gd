extends CharacterBody2D

signal lost_signal

var gravity = 20
var jump_power = -750
var lost = false
var collider = false
var collision = false
var run = 0

func _ready() -> void:
	reset()

func reset():
	position.x = 128
	position.y = 540
	velocity.y = 0
	lost = false
	collision = false  
	collider = false
	run = 0
	force_update_transform()
	print("reset")

func _physics_process(delta: float) -> void:
	if run > 5:
		velocity.y += gravity
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_power

		collision = move_and_collide(velocity * delta)
		while collision:
			print(collision)
			collider = collision.get_collider()
			print(collider)
			if collider is pipes:
				lost = true
				print("collided")
				print(collider.position.x)
				print(collider)
				break
		if position.x != 128:
			print("smth else")

		if 0 > position.y or position.y > 1080 or lost:
			print(position.y)
			if position.x != 128:
				print("smth")
				print(position.x)
			lost_signal.emit()
	else:
		run += 1
