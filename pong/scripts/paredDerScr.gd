extends Area2D
class_name paredDerScr

@export var score_der:int = 0
@onready var pared_izq : Area2D = get_parent().get_node("ParedIzq")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body) -> void:
	if body.name == "Pelota":
		print("Gol")
		score_der += 1
		var score_izq = pared_izq.score_izq
		get_parent().get_node("Label").text = str(score_izq) + " : " + str(score_der)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
