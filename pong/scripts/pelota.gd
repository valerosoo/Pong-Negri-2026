extends CharacterBody2D
class_name Pelota

@export var _speed:float = 200
var _direction:= Vector2(-1,0.3)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(_direction * _speed * delta)
	
	if collision:
		var normal = collision.get_normal()
		_direction = _direction.bounce(normal)
