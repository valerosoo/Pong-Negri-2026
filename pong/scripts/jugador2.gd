extends CharacterBody2D
class_name Jugador2

@export var _speed:float = 200
var _direction:float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Jugadores")

func _input(event: InputEvent) -> void:

	if event.is_action("FlechaArriba"):
		_direction = -1
	
	if event.is_action("FlechaAbajo"):
		_direction = 1
	
	if event.is_action_released("FlechaArriba") or event.is_action_released("FlechaAbajo"):
		_direction = 0
	
func _physics_process(delta: float) -> void:
	position.y += _direction * _speed * delta
	var collision = move_and_slide()
	
	if collision:
		_direction = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
