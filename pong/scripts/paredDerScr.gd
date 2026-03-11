extends Area2D
class_name paredDerScr

@export var score_izq:int = 0
@onready var pared_izq:paredIzqSrc = get_parent().get_node("ParedIzq")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body) -> void:
	if body.name == "Pelota":
		body.set_physics_process(false)
		var PelotaNodo = get_parent().get_parent().get_node("Pelota")
		print("Pelota: " + str(PelotaNodo))
		var mapa = get_parent().get_parent().get_node("Mapa2P")
		print(mapa)
		mapa._gol_para_der()
		score_izq += 1
		var score_der = pared_izq.score_der
		get_parent().get_node("Marcador").text = str(score_izq) + "    -    " + str(score_der)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
