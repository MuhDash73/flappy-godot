extends CharacterBody2D
class_name pipes

var score = 0
var y = randi_range(300, 1080-300)

func _ready() -> void:
	velocity.x = -500
	reset()

func reset():
	score = 0
	position.x = 1970
	y = randi_range(300, 1080-300)
	position.y = y
	force_update_transform()

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)

	if position.x < -50:
		position.x = 1970
		score += 1
		y = randi_range(300, 1080-300)
		position.y = y
	
