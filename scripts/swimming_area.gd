extends Area2D

@onready var player: Player = Thunder._current_player

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	if "swim" in player.movements:
		return
	
	var swimming_script = preload("res://modules/swimming/scripts/movement_swim.gd")
	player.movements.swim = swimming_script

func _physics_process(delta: float) -> void:
	if overlaps_body(player):
		player.states.set_state("swim")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.states.set_state("swim")

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.states.set_state("default")
