extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	print("The van runs!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func left_click():
	print("Clicked vam!")
	AutoloadGameManager.change_view("res://core/views/van/van_inside.tscn")
