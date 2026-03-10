extends CharacterBody2D
class_name Jugador

@export var _speed:float = 200
var _direction:float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

func _input(event: InputEvent) -> void:

	if event.is_action("W"):
		_direction = -1
	
	if event.is_action("S"):
		_direction = 1
	
	if event.is_released():
		_direction = 0
	
func _physics_process(delta: float) -> void:
	position.y += _direction * _speed * delta
	var collision = move_and_slide()
	
	if collision:
		_direction = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
