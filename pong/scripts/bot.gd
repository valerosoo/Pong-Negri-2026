extends CharacterBody2D
class_name Bot

@export var _speed: float = 200
var _pelota

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var altura = get_viewport_rect().size.y
	print("Altura: " + str(altura))
	var bajo_pantalla = altura/2
	print("Bajo: " + str(bajo_pantalla))
	var alto_pantalla = -bajo_pantalla
	print("Alto: " + str(alto_pantalla))
	
	var root = get_parent().get_parent()
	
	#Este while es porque al jugar al modo vs bot y seleccionas rapido el modo, no llega a cargar la pelota y crashea.
	#No está en ready porque no llegaba a cargarlo tampoco
	while _pelota == null:
		if root.has_node("PelotaNodo/Pelota"):
			_pelota = root.get_node("PelotaNodo/Pelota")
		await get_tree().process_frame
	
	if _pelota._direction.x < 0:
		position.y += clamp(0 - position.y, -_speed * delta, _speed * delta)
		move_and_slide()
		return
	
	if _pelota._direction.x > 0:
		
		
		print("Pelota ", _pelota.global_position.x)
		print("Bot ", global_position.x)
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
