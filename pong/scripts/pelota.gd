extends CharacterBody2D
class_name Pelota

@export var _speed:float = 400
var _direction

func _ready() -> void:
	randomize()
	_setDirectionStart()
	var mapa2d = get_parent().get_parent().get_node("Mapa_Normal")
	print(mapa2d)
	mapa2d.gol_izq.connect(_reinicio_para_izq)
	mapa2d.gol_der.connect(_reinicio_para_der)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(_direction * _speed * delta)
	
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("Jugadores") or collider is Bot:
			var paddle_center = collider.global_position.y
			var paddle_height = collider.get_node("CollisionShape2D").shape.size.y
			var hit_pos = global_position.y

			var offset = (hit_pos - paddle_center) / (paddle_height / 2.0)
			var max_angle = deg_to_rad(45)
			var angle = offset * max_angle
			
			_direction = Vector2(-sign(_direction.x) * cos(angle),sin(angle)).normalized()
			
			# proteger contra trayectorias demasiado verticales
			var min_x = 0.4
			if abs(_direction.x) < min_x:
				if _direction.x >= 0:
					_direction.x = min_x
				else:
					_direction.x = -min_x
				
				_direction = _direction.normalized()
		
		else:
			var normal = collision.get_normal()
			_direction = _direction.bounce(normal)
		_speed *= 1.05
		position += collision.get_normal() * 4

func _reinicio_para_izq():
	_setDirection(-1)
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	_speed = 400
	
func _reinicio_para_der():
	_setDirection(1)
	position = Vector2(0,0)
	get_parent().get_node("Pelota").set_physics_process(true)
	_speed = 400
	
func _setDirectionStart():
	var _randomStart = [-1 , 1].pick_random()
	var _randomDirection = randf_range(-1 , 1) * 0.2
	_direction = Vector2(_randomStart , _randomDirection).normalized()
	
func _setDirection(start):
	var _randomDirection = randf_range(-1 , 1) * 0.2
	_direction = Vector2(start , _randomDirection)

	
