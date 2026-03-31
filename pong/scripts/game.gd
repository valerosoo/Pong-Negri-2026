extends Node2D

@onready var mapa_normal = $Mapa_Normal
@onready var bot = $Bot
@onready var jugador2 = $Jugador2
@onready var bot2 = $Bot2
@onready var jugador = $Jugador

var mapa
var juego_terminado = false
var ganador

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_node("Ganador").visible = false
	get_node("Pausa").visible = false
	ganador = get_node("Ganador/Ganador_Jugador")
	
	if ConfigPartida.mapa == 1:
		mapa_normal.visible = true
		mapa = mapa_normal
		
	if ConfigPartida.jugadores == 1:
		bot.visible = true
		bot.set_physics_process(true)
		bot.set_process(true)

		jugador2.queue_free()
		jugador2.visible = false
		jugador2.set_physics_process(false)
		jugador2.set_process(false)
		
		bot2.queue_free()
		bot2.visible = false
		bot2.set_physics_process(false)
		bot2.set_process(false)

	elif ConfigPartida.jugadores == -1:
		bot.visible = true
		bot.set_physics_process(true)
		bot.set_process(true)
		
		bot2.visible = true
		bot2.set_physics_process(true)
		bot2.set_process(true)

		jugador2.queue_free()
		jugador2.visible = false
		jugador2.set_physics_process(false)
		jugador2.set_process(false)
		
		jugador.queue_free()
		jugador.visible = false
		jugador.set_physics_process(false)
		jugador.set_process(false)

	else:
		bot.queue_free()
		bot.visible = true
		bot.set_physics_process(false)
		bot.set_process(false)
		
		bot2.queue_free()
		bot2.visible = true
		bot2.set_physics_process(false)
		bot2.set_process(false)

		jugador2.visible = true
		jugador2.set_physics_process(true)
		jugador2.set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if juego_terminado:
		return
	
	var score_der = mapa.score_der
	var score_izq = mapa.score_izq
	
	if score_der == 10:
		terminar_juego()
		
		if ConfigPartida.jugadores == 1:
			ganador.text = "Ganador: Bot"
		
		else:
			ganador.text = "Ganador: Jugador 2"
		
		get_node("Ganador").visible = true
		volver_al_menu()

	elif score_izq == 10:
		
		terminar_juego()
		get_node("Ganador").visible = true
		volver_al_menu()
		
func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Pausa"):
		print("Pausa")
		get_tree().paused = !get_tree().paused
		get_node("Pausa").visible = true
		
func volver_al_menu():
	get_tree().paused = true
	$Ganar.play()
	await  $Ganar.finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func terminar_juego():
	juego_terminado = true
	get_tree().paused = true
