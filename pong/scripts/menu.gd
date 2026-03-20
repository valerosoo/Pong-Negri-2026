extends Node2D

@onready var labels = [$Jugar , $Opciones]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for label in labels:
		label.gui_input.connect(_on_label_click.bind(label))


func _on_label_click(event: InputEvent, label) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if label.name == "Jugar":
			get_tree().change_scene_to_file("res://scenes/opcionesPartida.tscn")

		elif label.name == "Opciones":
			print("Opciones")
