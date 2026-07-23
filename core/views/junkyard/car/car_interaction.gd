extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	print("The car runs!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func left_click():
	print("Clicked car!")
	AutoloadGameManager.change_view("res://core/views/car/car_inside.tscn")
	
