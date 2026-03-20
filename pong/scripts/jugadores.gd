extends CharacterBody2D
class_name Jugador

@export var jugador:int = 1
var _speed:float = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Jugadores")

func _physics_process(delta):

	var direction = 0
	
	if jugador == 1:
		direction = Input.get_axis("W", "S")

	elif jugador == 2:
		direction = Input.get_axis("FlechaArriba", "FlechaAbajo")

	var motion = Vector2(0, direction * _speed * delta)
	var collision = move_and_collide(motion)
