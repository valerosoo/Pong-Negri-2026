extends CharacterBody2D
class_name Pelota

@export var _speed:float = 200
var _direction:= Vector2(-1,0.3)

func _ready() -> void:
	var mapa2d = get_parent().get_parent().get_node("Mapa2P")
	print(mapa2d)
	mapa2d.gol_izq.connect(_reinicio_para_izq)
	mapa2d.gol_der.connect(_reinicio_para_der)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(_direction * _speed * delta)
	
	if collision:
		var normal = collision.get_normal()
		_direction = _direction.bounce(normal)

func _reinicio_para_izq():
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	
func _reinicio_para_der():
	_direction = Vector2(1,0.3)
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	
