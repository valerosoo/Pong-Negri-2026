extends Button

func _ready():
	# Permite que funcione aunque el juego esté pausado
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Hace que el Label reciba eventos del mouse
	mouse_filter = Control.MOUSE_FILTER_STOP

func _gui_input(event):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		
		get_tree().paused = false
		get_parent().visible = false

func _input(event: InputEvent):
	if event.is_action_pressed("Pausa"):
		get_tree().paused = !get_tree().paused
		get_parent().visible = get_tree().paused
		get_viewport().set_input_as_handled()
