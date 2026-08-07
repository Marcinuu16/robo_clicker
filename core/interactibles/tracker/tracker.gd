extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	upgrade_name = "Tracker"
	print("The Tracker is tracking!")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
