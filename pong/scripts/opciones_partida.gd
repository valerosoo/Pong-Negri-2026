extends Node2D
class_name OpcionesPartida

var mapa_seleccionado = 0
var cantidad_jugadores = 0

@onready var mapa1 = $Normal
@onready var jugador1 = $UnJugador
@onready var jugador2 = $DosJugadores

func seleccionar_mapa1():
	$Click.play()
	await $Click.finished
	mapa_seleccionado = 1
	actualizar_colores()

func seleccionar_unJugador():
	$Click.play()
	await $Click.finished
	cantidad_jugadores= 1
	actualizar_colores_jug()

func seleccionar_dosJugadores():
	$Click.play()
	await $Click.finished
	cantidad_jugadores = 2
	actualizar_colores_jug()

func actualizar_colores():
	mapa1.modulate = Color.WHITE
	
	if mapa_seleccionado == 1:
		mapa1.modulate = Color.GREEN
	

func actualizar_colores_jug():
	jugador1.modulate = Color.WHITE
	jugador2.modulate = Color.WHITE
	
	if cantidad_jugadores == 1:
		jugador1.modulate = Color.GREEN
	elif cantidad_jugadores == 2:
		jugador2.modulate = Color.GREEN

func arrancar_partida():
	$Click.play()
	await $Click.finished
	ConfigPartida.mapa = mapa_seleccionado
	ConfigPartida.jugadores = cantidad_jugadores
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")
