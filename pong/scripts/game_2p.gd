extends Node2D

@onready var mapa = $Mapa_Normal
var juego_terminado = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_node("GanadorJ1").visible = false
	get_node("GanadorJ2").visible = false
	get_node("Pausa").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if juego_terminado:
		return
	
	var score_der = mapa.score_der
	var score_izq = mapa.score_izq
	
	if score_der == 10:
		juego_terminado = true
		get_tree().paused = true
		get_node("GanadorJ2").visible = true
		volver_al_menu()

	elif score_izq == 10:
		juego_terminado = true
		get_tree().paused = true
		get_node("GanadorJ1").visible = true
		volver_al_menu()
		
func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Pausa"):
		print("Pausa")
		get_tree().paused = !get_tree().paused
		get_node("Pausa").visible = true
		
func volver_al_menu():

	await get_tree().create_timer(3).timeout
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
