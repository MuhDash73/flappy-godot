extends Node2D

var player_scene = preload("res://scenes/player.tscn").instantiate()
var pipes_scene = preload("res://scenes/pipes.tscn").instantiate()
var menu_scene = preload("res://scenes/control.tscn").instantiate()
var state = "menu"
var score = pipes_scene.score

func _ready() -> void:
	add_child(menu_scene)
	player_scene.lost_signal.connect(lost_func)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and state == "menu":
		state = "play"
		remove_child(menu_scene)
		add_child(player_scene)
		add_child(pipes_scene)

func lost_func():
	score = pipes_scene.score
	menu_scene.change_score(score)
	print(score)
	player_scene.reset()
	pipes_scene.reset()
	remove_child(player_scene)
	remove_child(pipes_scene)
	add_child(menu_scene)
	state = "menu"
