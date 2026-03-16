extends CharacterBody2D
class_name Bot

@export var _speed:float = 200
@onready var _pelota = get_parent().get_parent().get_node("PelotaNodo")

var _direction:float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
	
func _physics_process(delta: float) -> void:
	position.y += _direction * _speed * delta
	var collision = move_and_slide()
	
	if collision:
		_direction = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("Tengo la pelota" + str(_pelota))
	pass
