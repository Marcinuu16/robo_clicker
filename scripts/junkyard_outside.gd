extends Node2D


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
