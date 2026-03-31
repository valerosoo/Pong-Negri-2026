extends Bot
class_name Bot2

func _physics_process(delta: float) -> void:
	if _pelota == null:
		return
	
	var altura = get_viewport_rect().size.y
	var bajo_pantalla = altura/2
	var alto_pantalla = -bajo_pantalla
	
	if _pelota._direction.x > 0:
		position.y += clamp(0 - position.y, -_speed * delta, _speed * delta)
		return
	
	if _pelota._direction.x < 0:
		
		var tiempo = (global_position.x - _pelota.global_position.x  ) / (_pelota._direction.x * _pelota._speed)
		tiempo = clamp(tiempo, 0, 2)
		
		var y_futura = _pelota.position.y + _pelota._direction.y * _pelota._speed * tiempo
		
		while (y_futura < alto_pantalla or y_futura > bajo_pantalla):
			
			if y_futura < alto_pantalla:
				y_futura = -altura - y_futura
			
			elif y_futura > bajo_pantalla:
				y_futura = altura - y_futura

		var error = y_futura - position.y
		
		position.y += clamp(error, -_speed * delta, _speed * delta)
	move_and_slide()
