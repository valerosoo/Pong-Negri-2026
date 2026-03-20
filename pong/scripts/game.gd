extends Node2D

@onready var mapa_normal = $Mapa_Normal
@onready var mapa_hielo = $Mapa_Hielo
@onready var bot = $Bot
@onready var jugador2 = $Jugador2

var mapa
var juego_terminado = false
var ganador

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_node("Ganador").visible = false
	get_node("Pausa").visible = false
	ganador = get_node("Ganador/Ganador_Jugador")
	
	print(mapa_normal)
	print(mapa_hielo)
	print(bot)
	print(jugador2)
	
	if ConfigPartida.mapa == 1:
		mapa_normal.visible = true
		mapa_hielo.visible = false
		mapa = mapa_normal
	else:
		mapa_normal.visible = false
		mapa_hielo.visible = true
		mapa = mapa_hielo
		
	if ConfigPartida.jugadores == 1:
		bot.visible = true
		bot.set_physics_process(true)
		bot.set_process(true)

		jugador2.queue_free()
		jugador2.visible = false
		jugador2.set_physics_process(false)
		jugador2.set_process(false)

	else:
		bot.queue_free()
		bot.visible = true
		bot.set_physics_process(false)
		bot.set_process(false)

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
			ganador.text = "Ganador: J2"
			
		volver_al_menu()

	elif score_izq == 10:
		
		terminar_juego()
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
	
func terminar_juego():
	juego_terminado = true
	get_tree().paused = true
