extends Node2D

@onready var pared_izq : paredIzqSrc = get_node("Mapa2P/ParedIzq")
@onready var pared_der : paredDerScr = get_node("Mapa2P/ParedDer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("GanadorJ1").visible = false
	get_node("GanadorJ2").visible = false
	get_node("Pausa").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var score_der = pared_izq.score_der
	var score_izq = pared_der.score_izq
	if score_der == 10:
		print("Gano der")
		get_tree().paused = true
		get_node("GanadorJ2").visible = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	elif score_izq == 10:
		print("Gano izq")
		get_tree().paused = true
		get_node("GanadorJ1").visible = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pausa"):
		print("Pausa")
		get_tree().paused = !get_tree().paused
		get_node("Pausa").visible = true
