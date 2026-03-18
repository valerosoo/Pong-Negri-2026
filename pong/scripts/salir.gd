extends Button

func _ready():
	# Permite que funcione aunque el juego esté pausado
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
