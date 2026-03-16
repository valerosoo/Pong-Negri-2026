extends CharacterBody2D
class_name Pelota

@export var _MaxAngle = deg_to_rad(60)
@export var _speed:float = 400
var _direction

func _ready() -> void:
	randomize()
	_setDirectionStart()
	var mapa2d = get_parent().get_parent().get_node("Mapa2P_Normal")
	print(mapa2d)
	mapa2d.gol_izq.connect(_reinicio_para_izq)
	mapa2d.gol_der.connect(_reinicio_para_der)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(_direction * _speed * delta)
	
	if collision:
		var collider = collision.get_collider()
		print("Collider" + str(collider))
		if collider.is_in_group("Jugadores"):
			var jugador_centro = collider.global_position.y
			var ball_pos = collision.get_position().y
			var forma = collider.get_node("CollisionShape2D").shape
			var jugador_alt = forma.size.y
			var offset = (ball_pos - jugador_centro) / (jugador_alt / 2)
			offset *=2.5
			offset = clamp(offset, -1, 1)
			var angulo = offset * _MaxAngle
			var dir_x = -sign(_direction.x)
			_direction = Vector2(dir_x * cos(angulo), sin(angulo)).normalized()
			if abs(_direction.y) < 0.3:
				_direction.y = sign(_direction.y) * 0.2
				_direction = _direction.normalized()
			position += _direction * 5
		
		else:
			var normal = collision.get_normal()
			_direction = _direction.bounce(normal)

func _reinicio_para_izq():
	_setDirection(-1)
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	
func _reinicio_para_der():
	_setDirection(1)
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	
func _setDirectionStart():
	var _randomStart = [-1 , 1].pick_random()
	var _randomDirection = randf_range(-1 , 1) * 0.2
	_direction = Vector2(_randomStart , _randomDirection).normalized()
	
func _setDirection(start):
	var _randomDirection = randf_range(-1 , 1) * 0.2
	_direction = Vector2(start , _randomDirection)
