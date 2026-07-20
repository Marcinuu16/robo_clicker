extends Node2D
var click_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_van_area_2d_mouse_entered() -> void:
	$VanArea2D/CollisionPolygon2D/Sprite2D.visible = true

func _on_van_area_2d_mouse_exited() -> void:
	$VanArea2D/CollisionPolygon2D/Sprite2D.visible = false

func _on_car_area_2d_mouse_entered() -> void:
	$CarArea2D/CollisionPolygon2D/Sprite2D.visible = true

func _on_car_area_2d_mouse_exited() -> void:
	$CarArea2D/CollisionPolygon2D/Sprite2D.visible = false

func _on_scrap_area_2d_mouse_entered() -> void:
	$ScrapArea2D/CollisionPolygon2D/Sprite2D.visible = true

func _on_scrap_area_2d_mouse_exited() -> void:
	$ScrapArea2D/CollisionPolygon2D/Sprite2D.visible = false

func _on_scrap_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Collecting some scrap at ", event.position)
			click_count += 1
			update_ui()

func _on_car_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Entering the car at ", event.position)

func _on_van_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Entering the van at ", event.position)

func update_ui():
	$Gui/Label.text = str(click_count)
	$Gui/Label2.text = str(click_count)
