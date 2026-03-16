extends Node2D
class_name OpcionesPartida

var mapa_seleccionado = 0
var cantidad_jugadores = 0

@onready var mapa1 = $Normal
@onready var mapa2 = $Hielo
@onready var jugador1 = $UnJugador
@onready var jugador2 = $DosJugadores

func seleccionar_mapa1():
	mapa_seleccionado = 1
	actualizar_colores()

func seleccionar_mapa2():
	mapa_seleccionado = 2
	actualizar_colores()

func seleccionar_unJugador():
	cantidad_jugadores= 1
	actualizar_colores_jug()

func seleccionar_dosJugadores():
	cantidad_jugadores = 2
	actualizar_colores_jug()

func actualizar_colores():
	mapa1.modulate = Color.WHITE
	mapa2.modulate = Color.WHITE
	
	if mapa_seleccionado == 1:
		mapa1.modulate = Color.GREEN
	elif mapa_seleccionado == 2:
		mapa2.modulate = Color.GREEN
	

func actualizar_colores_jug():
	jugador1.modulate = Color.WHITE
	jugador2.modulate = Color.WHITE
	
	if cantidad_jugadores == 1:
		jugador1.modulate = Color.GREEN
	elif cantidad_jugadores == 2:
		jugador2.modulate = Color.GREEN

func arrancar_partida():
	if mapa_seleccionado == 1 and cantidad_jugadores == 1:
		get_tree().change_scene_to_file("res://scenes/game_1p_normal.tscn")
	elif mapa_seleccionado == 1 and cantidad_jugadores == 2:
		get_tree().change_scene_to_file("res://scenes/game_2p_normal.tscn")
