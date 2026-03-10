extends Area2D
class_name paredIzqSrc

@export var score_izq:int = 0
@onready var pared_der : Area2D = get_parent().get_node("ParedDer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body) -> void:
	if body.name == "Pelota":
		print("Gol")
		score_izq += 1
		var score_der = pared_der.score_der
		get_parent().get_node("Label").text = str(score_izq) + " : " + str(score_der)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
