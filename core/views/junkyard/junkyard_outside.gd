extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("------ VIEW: JUNKYARD OUTSIDE")
	if AutoloadGameManager.owned_upgrades["Crowbar"]["owned"] == true:
		$LockedVanInteraction.queue_free()
	else:
		$Van.queue_free()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
