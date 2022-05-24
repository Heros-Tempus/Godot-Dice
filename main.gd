extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


var d6_scene = load("res://d6.tscn")

var d_list = []
var d_count = {"d3":0, "d4":0, "d6":0}

func _on_btn_add_d6_pressed():
	d_list.append(d6_scene)
	d_count["d6"] += 1
	$"../Label".text = str(d_count)


func _on_btn_remove_d6_pressed():
	var i = d_list.find(d6_scene)
	if i != -1:
		d_count["d6"] -= 1
		d_list.remove(i)
		$"../Label".text = str(d_count)


func _on_btn_roll_pressed():
	for n in $".".get_children():
		if n.get_filename() == "res://d6.tscn":
			n.queue_free()
		
		
	for d in d_list:
		var x = d.instance()
		x.transform.origin = Vector3(0,10,0)
		add_child(x)
