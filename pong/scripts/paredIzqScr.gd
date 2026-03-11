extends Area2D
class_name paredIzqSrc

@export var score_der:int = 0
@onready var pared_der : paredDerScr = get_parent().get_node("ParedDer")

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
		mapa._gol_para_izq()
		score_der += 1
		var score_izq = pared_der.score_izq
		get_parent().get_node("Marcador").text = str(score_izq) + "    -    " + str(score_der)
		
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
