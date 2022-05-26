extends Spatial

onready var lbl = $"../VBoxRoll/Label"
var d3_scene = load("res://d3.tscn")
var d4_scene = load("res://d4.tscn")
var d6_scene = load("res://d6.tscn")
var d8_scene = load("res://d8.tscn")
var d10_scene = load("res://d10.tscn")

var d_list = []
var d_count = {"d3":0, "d4":0, "d6":0, "d8":0, "d10":0, "d12":0, "d20":0}

var file_list = ["res://d3.tscn", "res://d4.tscn", "res://d6.tscn", "res://d8.tscn", "res://d10.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_roll_pressed():
	for n in $".".get_children():
		var file = n.get_filename()
		if file in file_list:
			n.queue_free()
	for d in d_list:
		var x = d.instance()
		x.transform.origin = Vector3(0,10,0)
		add_child(x)


func add_dn(d_name, d_scene):
	d_list.append(d_scene)
	d_count[d_name] += 1
	lbl.text = str(d_count)


func remove_dn(d_name, d_scene):
	var i = d_list.find(d_scene)
	if i != -1:
		d_count[d_name] -= 1
		d_list.remove(i)
		lbl.text = str(d_count)


func _on_btn_add_d3_pressed():
	add_dn("d3", d3_scene)


func _on_btn_remove_d3_pressed():
	remove_dn("d3", d3_scene)


func _on_btn_add_d4_pressed():
	add_dn("d4", d4_scene)


func _on_btn_remove_d4_pressed():
	remove_dn("d4", d4_scene)


func _on_btn_add_d6_pressed():
	add_dn("d6", d6_scene)


func _on_btn_remove_d6_pressed():
	remove_dn("d6", d6_scene)


func _on_btn_add_d8_pressed():
	add_dn("d8", d8_scene)


func _on_btn_remove_d8_pressed():
	remove_dn("d8", d8_scene)


func _on_btn_add_d10_pressed():
	add_dn("d10", d10_scene)


func _on_btn_remove_d10_pressed():
	remove_dn("d10", d10_scene)


func _on_btn_add_d12_pressed():
	pass # Replace with function body.


func _on_btn_remove_d12_pressed():
	pass # Replace with function body.


func _on_btn_add_d20_pressed():
	pass # Replace with function body.


func _on_btn_remove_d20_pressed():
	pass # Replace with function body.
