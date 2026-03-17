extends CharacterBody2D
class_name Bot

@export var _speed:float = 200
@onready var _pelota = get_parent().get_parent().get_node("PelotaNodo/Pelota")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ruta PelotaNodo/Pelota existe? ", get_parent().has_node("PelotaNodo/Pelota"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if _pelota._direction.x > 0 and _pelota.position.x < position.x:
		var tiempo = (_pelota.position.x - position.x) / (_pelota._direction.x * _pelota._speed)
		var y_futura = _pelota.position.y + _pelota._direction.y * _pelota._speed * tiempo
			
		while y_futura < 0 or y_futura > 720:
			if y_futura < 0:
				y_futura = -y_futura
			elif y_futura > 720:
				y_futura = 2*720-y_futura
		y_futura+=randf_range(-20,20)
		var error = y_futura-position.y
		position.y += clamp(error, -_speed * delta, _speed * delta)
			
	else: 
		position.y += clamp(0, -_speed * delta, _speed * delta)
	
	move_and_slide()
		
