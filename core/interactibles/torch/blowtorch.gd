extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	print("The Blowtorch is blowing!")
	upgrade_name = "Blowtorch"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
