extends Node3D

@onready var lbl = $"../../Label"
var d3_scene = load("res://d3.tscn")
var d4_scene = load("res://d4.tscn")
var d6_scene = load("res://d6.tscn")
var d8_scene = load("res://d8.tscn")
var d10_scene = load("res://d10.tscn")
var d12_scene = load("res://d12.tscn")
var d20_scene = load("res://d20.tscn")

var d_list = []
var d_count = {"d3":0, "d4":0, "d6":0, "d8":0, "d10":0, "d12":0, "d20":0}

var file_list = ["res://d3.tscn", "res://d4.tscn", "res://d6.tscn", "res://d8.tscn", "res://d10.tscn", "res://d12.tscn", "res://d20.tscn"]

var stop_them_all = false

var time_start = 0
var time_now = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("Roll"):
		_on_btn_roll_pressed()
	
	if Input.is_action_just_released("Plus"):
		if Input.is_key_pressed(KEY_1) or Input.is_key_pressed(KEY_KP_1):
			_on_btn_add_d3_pressed()
		elif Input.is_key_pressed(KEY_2) or Input.is_key_pressed(KEY_KP_2):
			_on_btn_add_d4_pressed()
		elif Input.is_key_pressed(KEY_3) or Input.is_key_pressed(KEY_KP_3):
			_on_btn_add_d6_pressed()
		elif Input.is_key_pressed(KEY_4) or Input.is_key_pressed(KEY_KP_4):
			_on_btn_add_d8_pressed()
		elif Input.is_key_pressed(KEY_5) or Input.is_key_pressed(KEY_KP_5):
			_on_btn_add_d10_pressed()
		elif Input.is_key_pressed(KEY_6) or Input.is_key_pressed(KEY_KP_6):
			_on_btn_add_d12_pressed()
		elif Input.is_key_pressed(KEY_7) or Input.is_key_pressed(KEY_KP_7):
			_on_btn_add_d20_pressed()
	if Input.is_action_just_released("Minus"):
		if Input.is_key_pressed(KEY_1) or Input.is_key_pressed(KEY_KP_1):
			_on_btn_remove_d3_pressed()
		elif Input.is_key_pressed(KEY_2) or Input.is_key_pressed(KEY_KP_2):
			_on_btn_remove_d4_pressed()
		elif Input.is_key_pressed(KEY_3) or Input.is_key_pressed(KEY_KP_3):
			_on_btn_remove_d6_pressed()
		elif Input.is_key_pressed(KEY_4) or Input.is_key_pressed(KEY_KP_4):
			_on_btn_remove_d8_pressed()
		elif Input.is_key_pressed(KEY_5) or Input.is_key_pressed(KEY_KP_5):
			_on_btn_remove_d10_pressed()
		elif Input.is_key_pressed(KEY_6) or Input.is_key_pressed(KEY_KP_6):
			_on_btn_remove_d12_pressed()
		elif Input.is_key_pressed(KEY_7) or Input.is_key_pressed(KEY_KP_7):
			_on_btn_remove_d20_pressed()
		
	if Input.is_action_just_released("D3"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d3_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d3_pressed()
			
	if Input.is_action_just_released("D4"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d4_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d4_pressed()
			
	if Input.is_action_just_released("D6"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d6_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d6_pressed()
			
	if Input.is_action_just_released("D8"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d8_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d8_pressed()
			
	if Input.is_action_just_released("D10"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d10_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d10_pressed()
			
	if Input.is_action_just_released("D12"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d12_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d12_pressed()
			
	if Input.is_action_just_released("D20"):
		if Input.is_key_pressed(KEY_KP_ADD) or Input.is_key_pressed(KEY_PLUS):
			_on_btn_add_d20_pressed()
		elif Input.is_key_pressed(KEY_KP_SUBTRACT) or Input.is_key_pressed(KEY_MINUS):
			_on_btn_remove_d20_pressed()
			
	for a in $".".get_children():
		var file = a.get_scene_file_path()
		if file in file_list:
			if stop_them_all:
				a.stop_asap = true
			if a.sleeping:
				stop_them_all = true
			time_now = Time.get_unix_time_from_system()
			if time_now - time_start >= 10:
				stop_them_all = true

func _on_btn_roll_pressed():
	stop_them_all = false
	time_start = Time.get_unix_time_from_system()
	for n in $".".get_children():
		var file = n.get_scene_file_path()
		if file in file_list:
			n.queue_free()
	for d in d_list:
		var x = d.instantiate()
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
		d_list.remove_at(i)
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
	add_dn("d12", d12_scene)

func _on_btn_remove_d12_pressed():
	remove_dn("d12", d12_scene)

func _on_btn_add_d20_pressed():
	add_dn("d20", d20_scene)

func _on_btn_remove_d20_pressed():
	remove_dn("d20", d20_scene)
