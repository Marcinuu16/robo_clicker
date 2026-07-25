extends Node2D
class_name Interaction
@export var description: String = "testter"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D.mouse_entered.connect(hover_object)
	$Area2D.mouse_exited.connect(dehover_object)
	$Area2D.input_event.connect(handle_input)
	$OutlineSprite.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func handle_input(_viewport, event, _shape):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		left_click()
		
func hover_object():
	print("mouse has entered an object")
	$OutlineSprite.visible = true
	AutoloadGameManager.update_description_gui(description)
func dehover_object():
	print("mouse has exited an object")
	$OutlineSprite.visible = false
	AutoloadGameManager.update_description_gui("")
func left_click():
	print("mouse clicked an object")
	
