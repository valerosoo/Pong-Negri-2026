extends Node2D
class_name GameMapa2P

@export var score_der:int = 0
@export var score_izq:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = str(score_izq) + " : " + str(score_der) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
