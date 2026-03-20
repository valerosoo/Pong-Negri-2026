extends Node2D
class_name Mapa_Normal

signal gol_izq
signal gol_der

var score_izq := 0
var score_der := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _gol_en_izq():
	score_der += 1
	gol_izq.emit()

func _gol_en_der():
	score_izq += 1
	gol_der.emit()
