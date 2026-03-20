extends Area2D
class_name Paredes

@export var arco:int = 1 #numero referencia a que jugador le pertenece

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body) -> void:
	if body.name == "Pelota":
		body.set_physics_process(false)
		
		var mapa = get_parent().get_parent().get_node("Mapa_Normal")
		if arco == 1:
			mapa._gol_en_izq()
		elif arco == 2:
			mapa._gol_en_der()
			
		get_parent().get_node("Marcador").text = str(mapa.score_izq) + "    -    " + str(mapa.score_der)
