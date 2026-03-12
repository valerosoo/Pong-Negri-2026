extends Node2D
class_name Mapa2PSrc

signal gol_izq
signal gol_der

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _gol_para_izq():
	print("entré")
	gol_izq.emit()

func _gol_para_der():
	print("entré der")
	gol_der.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
