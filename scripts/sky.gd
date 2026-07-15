extends Node2D
var close_cloud_speed: int = 6
var far_cloud_speed: int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$CloseClouds2.position += Vector2(-close_cloud_speed,0) * delta
	$CloseClouds1.position += Vector2(-close_cloud_speed,0) * delta
	$FarClouds2.position += Vector2(far_cloud_speed,0) * delta
	$FarClouds1.position += Vector2(far_cloud_speed,0) * delta
	
	
	if($CloseClouds1.position < Vector2(-480,0)):
		$CloseClouds1.position += Vector2(960,0)
	if($CloseClouds2.position < Vector2(-480,0)):
		$CloseClouds2.position += Vector2(960,0)
	if($FarClouds1.position > Vector2(480,0)):
		$FarClouds1.position += Vector2(-960,0)
	if($FarClouds2.position > Vector2(480,0)):
		$FarClouds2.position += Vector2(-960,0)
