extends Node
var click_count: int = 0
var gui_node: Control
var number_label: Label
var decor_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gui_node = get_tree().current_scene.get_node("gui")
	number_label = gui_node.get_node("Number")
	decor_label = gui_node.get_node("Decor")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_click_count(amount: int):
	click_count += amount
	update_click_gui()

func update_click_gui():
	number_label.text = str(click_count)
	decor_label.text = str(click_count)

func change_view(scene_path: String):
	var packed_scene = load(scene_path)
	if not packed_scene:
		print("Critical scene loading error!")
		return
	print(packed_scene)
	print(packed_scene.get_state().get_node_count())
	
	var container = get_tree().current_scene.get_node("CurrentScene")
	for child in container.get_children():
		child.queue_free()
	
	container.add_child(packed_scene.instantiate())
	
