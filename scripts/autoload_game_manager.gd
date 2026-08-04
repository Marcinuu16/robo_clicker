extends Node
var click_amount: int = 0
var scrap_amount: int = 0 
var new_focus: String
var old_focus: String

var gui_node: Control
var number_label: Label
var numberD_label: Label
var description_label: Label
var descriptionD_label: Label

var is_combo = false
var click_timer: Timer

var owned_upgrades = {
	"NonUpgrade":{
		"owned":false,
		"price":0,
		"desc":"Test Dummy for now"
	},
	"WorkerGloves":{
		"owned":false,
		"price":30,
		"desc":"Cost: 30 scrap
		'Basic Gloves to get the job done'
		Grants +1 scrap per click"
	},
	"Flashlight":{
		"owned":false,
		"price":100,
		"desc":"Cost: 100 scrap
		'Allows seeing in dark spots'
		Every 5 clicks adds 10 bonus scrap"
	},
	"Magnet":{
		"owned":false,
		"price":200,
		"desc":"Cost: 200 scrap
		'A magnet helps pulling things towards you'
		10% chance of granting 3x scrap with each click"
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
		"owned":true,
		"price":800,
		"desc":"Cost: 800 scrap
		'Open any jammed door'
		Grants access to the Van"
	},
	"AngleGrinder":{
		"owned":false,
		"price":100,
		"desc":"Cost: 1000 scrap
		'Useful for cutting and polishing materials'
		Grants +25 scrap per click"
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
	numberD_label = gui_node.get_node("NumberD")
	description_label = gui_node.get_node("Description")
	descriptionD_label = gui_node.get_node("DescriptionD")
	click_timer = gui_node.get_node("ColorTimer")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_click_amount(amount: int):
	
	if owned_upgrades["WorkerGloves"]["owned"] == true:
		amount += 1
	if owned_upgrades["AngleGrinder"]["owned"] == true:
		amount += 25
	if owned_upgrades["Flashlight"]["owned"] == true and click_amount % 5 == 0:
		amount += 10
		is_combo = true
	if owned_upgrades["Magnet"]["owned"] == true and randi() % 100 < 10:
		amount *= 3
		is_combo = true
		
	click_amount += 1
	scrap_amount += amount
	update_click_gui()
	is_combo = false
	
func update_click_gui():
	number_label.text = str(scrap_amount)
	numberD_label.text = str(scrap_amount)
	if is_combo:
		number_label.label_settings.font_color = Color.RED
		get_tree().current_scene.get_node("Combo").play()
	else:
		number_label.label_settings.font_color = Color.GOLD
		get_tree().current_scene.get_node("Normal").play()
	
	click_timer.start()
	await click_timer.timeout
	number_label.label_settings.font_color = Color.WHITE
	
func update_description_gui(desc):
	description_label.text = desc
	descriptionD_label.text = desc
	
func change_focus(name,action):
	new_focus = name
	if action == "exit" and old_focus != new_focus:
		print("--- Trying to leave an body thats not even focused")
		return
	elif action == "exit" and old_focus == new_focus:
		print("--- Left an body!")
		update_description_gui("")
		return
	var upgrade_data = owned_upgrades.get(name, {})
	var description = upgrade_data.get("desc", "Test dummy")
	update_description_gui(description)
	old_focus = new_focus
	
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
	update_description_gui("")

func can_purchase(name):
	if name == "NonUpgrade" or name == "CarInter" or name == "VanInter":
		description_label.modulate = Color(1.0, 1.0, 1.0, 1.0)
		return
	if name == "LockedVan" or (scrap_amount < owned_upgrades[name].price) or owned_upgrades[name].owned == true :
		print("--- You can't purchase "+name)
		description_label.modulate = Color(1.0, 0.0, 0.0, 1.0)
		return false
	else:
		description_label.modulate = Color(1.0, 1.0, 1.0, 1.0)
		print("--- You can purchase "+name)
		return true
func purchase(name):
	owned_upgrades[name]["owned"] = true
	scrap_amount = scrap_amount - owned_upgrades[name]["price"]
	update_click_gui()
	print(owned_upgrades)
	
	

	
