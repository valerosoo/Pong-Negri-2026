extends CharacterBody2D
class_name Bot

@export var _speed:float = 200
@onready var _pelota = get_parent().get_parent().get_node("PelotaNodo/Pelota")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ruta PelotaNodo/Pelota existe? ", get_parent().has_node("PelotaNodo/Pelota"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var altura = get_viewport_rect().size.y
	print("altura" + str(altura))
	if _pelota._direction.x > 0:
		var tiempo = (position.x - _pelota.position.x) / (_pelota._direction.x * _pelota._speed)
		var y_futura = _pelota.position.y + _pelota._direction.y * _pelota._speed * tiempo
			
		while y_futura < 0 or y_futura > altura:
			if y_futura < 0:
				y_futura = -y_futura
			elif y_futura > altura:
				y_futura = 2*altura-y_futura
		y_futura+=randf_range(-20,20)
		var error = y_futura-position.y
		position.y += clamp(error, -_speed * delta, _speed * delta)
			
	else: 
		var target = altura / 2
		var error = target - position.y
		position.y += clamp(error, -_speed * delta, _speed * delta)
	
	move_and_slide()
		
