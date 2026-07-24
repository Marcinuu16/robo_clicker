extends Node
var click_count: int = 0
var gui_node: Control
var number_label: Label
var decor_label: Label
var click_timer: Timer

var owned_upgrades = {
	"WorkerGloves":{
		"owned":false,
		"price":30,
		"desc":"Basic Gloves to get the job done; Grants +1 scrap per click"
	},
	"Flashlight":{
		"owned":false,
		"price":100,
		"desc":"Allows seeing in dark spots; Every 3 clicks adds 5 bonus scrap"
	},
	"Magnet":{
		"owned":false,
		"price":200,
		"desc":"A magnet helps pulling things towards you; 15% chance of granting +10 scrap with each click"
	},
	"FoldingChair":{
		"owned":false,
		"price":500,
		"desc":"Strategic resting spot; Unlocks idle scrap collection every 1s"
	},
	"CarBattery":{
		"owned":false,
		"price":1500,
		"desc":"Necessary to start the engine of any modern vehicle; Grants 1.5x scrap per click"
	},
	"Crowbar":{
		"owned":false,
		"price":3000,
		"desc":"Open any jammed door; Grants access to the Van"
	},
	"AngleGrinder":{
		"owned":false,
		"price":5000,
		"desc":"Useful for cutting and polishing materials; Grants +25 scrap per click"
	},
	"Blowtorch":{
		"owned":false,
		"price":10000,
		"desc":"Are you a welder?; 5% chance of granting +250 scrap with each click"
	},
	"RoofRack":{
		"owned":false,
		"price":20000,
		"desc":"You must have one in your garage; Grants 2.5x scrap per click"
	},
	"CarJack":{
		"owned":false,
		"price":35000,
		"desc":"Suprisngly simple, yet effective at lifting; Every 10 clicks adds 100 bonus scrap"
	},
	"ImpactWrench":{
		"owned":false,
		"price":50000,
		"desc":"VRRRRRRRRRR-BRRRT-BRRRT; Flat +200 scrap bonus"
	},
	"ConveyorBelt":{
		"owned":false,
		"price":100000,
		"desc":"Factorio at home; Idle scrap collection every 0.1 seconds"
	},
	"Crane":{
		"owned":false,
		"price":5000000,
		"desc":"This is a giant fucking crane with a BIG magent; Suprise"
	}
}
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gui_node = get_tree().current_scene.get_node("gui")
	number_label = gui_node.get_node("Number")
	decor_label = gui_node.get_node("Decor")
	click_timer = gui_node.get_node("ColorTimer")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_click_count(amount: int):
	click_count += amount
	update_click_gui()

func update_click_gui():
	number_label.text = str(click_count)
	decor_label.text = str(click_count)
	number_label.label_settings.font_color = Color.GOLD
	click_timer.start()
	await click_timer.timeout
	number_label.label_settings.font_color = Color.WHITE

func change_view(scene_path: String):
	var packed_scene = load(scene_path)
	if not packed_scene:
		print("Critical scene loading error!")
		return
	print(packed_scene)
	print(packed_scene.get_state().get_node_count())
	
	var container = get_tree().current_scene.get_node("CurrentScene")
	for child in container.get_children():
		child.queue_free()
	
	container.add_child(packed_scene.instantiate())
	
