extends Interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	print("The Drill is drilling!")
	upgrade_name = "Drill"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
