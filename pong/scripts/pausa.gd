extends Label

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_tree().paused = false
		get_parent().visible = false
		get_viewport().set_input_as_handled()

	if event.is_action_pressed("Pausa"):
		get_tree().paused = !get_tree().paused
		get_parent().visible = get_tree().paused
		get_viewport().set_input_as_handled()
