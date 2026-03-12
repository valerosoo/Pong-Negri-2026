extends Node2D

@onready var pared_izq : paredIzqSrc = get_node("Mapa2P/ParedIzq")
@onready var pared_der : paredDerScr = get_node("Mapa2P/ParedDer")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Ganador").visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var score_der = pared_izq.score_der
	var score_izq = pared_der.score_izq
	if score_der == 10:
		print("Gano der")
		get_tree().paused = true
		get_node("Ganador").visible = true
	elif score_izq == 10:
		print("Gano izq")
		get_tree().paused = true
		get_node("Ganador").visible = true
		
