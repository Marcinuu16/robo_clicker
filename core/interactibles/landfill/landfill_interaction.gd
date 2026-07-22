extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	print("The landfill is filled!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func left_click():
	print("Clicked landfill!")
	AutoloadGameManager.update_click_count(1)
	
