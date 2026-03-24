extends CharacterBody2D
class_name Pelota

@export var _speed:float = 400
var _direction

func _ready() -> void:
	add_to_group("pelota")
	randomize()
	_setDirectionStart()
	var mapa2d = get_parent().get_parent().get_node("Mapa_Normal")
	mapa2d.gol_izq.connect(_reinicio_para_izq)
	mapa2d.gol_der.connect(_reinicio_para_der)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(_direction * _speed * delta)
	
	if collision:
		$Hit.play()
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
	global_position = get_viewport_rect().size / 2
	var jugador = get_tree().get_first_node_in_group("Jugador_Izq")
	_setDirectionToPlayer(jugador)
	set_physics_process(true)
	_speed = 400
	
func _reinicio_para_der():
	global_position = get_viewport_rect().size / 2
	var jugador = get_tree().get_first_node_in_group("Jugador_Der")
	_setDirectionToPlayer(jugador)
	set_physics_process(true)
	_speed = 400
	
func _setDirectionStart():
	var _randomStart = [-1 , 1].pick_random()
	var _randomDirection = randf_range(-1 , 1) * 0.2
	_direction = Vector2(_randomStart , _randomDirection).normalized()

func _setDirectionToPlayer(player):
	if player == null:
		return
	
	var cuerpo = player.get_node("CharacterBody2D")
	var centro_jugador = cuerpo.global_position
	
	_direction = (centro_jugador - global_position).normalized()
