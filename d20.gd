extends RigidBody3D

var count = 30
var m = Color(1,1,1,0)
var animate = false
var alpha_delta = 0.5
@onready var face_up = $face1

var stop_asap = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var spin_magnitude = 20
	randomize()
	var x = randf_range(-1 * spin_magnitude, spin_magnitude)
	var y = randf_range(-1 * spin_magnitude, spin_magnitude)
	var z = randf_range(-1 * spin_magnitude, spin_magnitude)
	set_angular_velocity(Vector3(x, y, z))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if stop_asap:
		if position[1] < 3:
			linear_damp += 0.1
			angular_damp += 0.1
	if (get_angular_velocity().is_zero_approx() or sleeping) and not animate:
		animate = true
		var face1 = $face1
		var face2 = $face2
		var face3 = $face3
		var face4 = $face4
		var face5 = $face5
		var face6 = $face6
		var face7 = $face7
		var face8 = $face8
		var face9 = $face9
		var face10 = $face10
		var face11 = $face11
		var face12 = $face12
		var face13 = $face13
		var face14 = $face14
		var face15 = $face15
		var face16 = $face16
		var face17 = $face17
		var face18 = $face18
		var face19 = $face19
		var face20 = $face20
		var ylist = {face1.global_transform.origin.y:face1,
		face2.global_transform.origin.y:face2,
		face3.global_transform.origin.y:face3,
		face4.global_transform.origin.y:face4,
		face5.global_transform.origin.y:face5,
		face6.global_transform.origin.y:face6,
		face7.global_transform.origin.y:face7,
		face8.global_transform.origin.y:face8,
		face9.global_transform.origin.y:face9,
		face10.global_transform.origin.y:face10,
		face11.global_transform.origin.y:face11,
		face12.global_transform.origin.y:face12,
		face13.global_transform.origin.y:face13,
		face14.global_transform.origin.y:face14,
		face15.global_transform.origin.y:face15,
		face16.global_transform.origin.y:face16,
		face17.global_transform.origin.y:face17,
		face18.global_transform.origin.y:face18,
		face19.global_transform.origin.y:face19,
		face20.global_transform.origin.y:face20}
		var greatest_y = -100
		for i in ylist.keys():
			if i > greatest_y:
				greatest_y = i
		face_up = ylist[greatest_y]
	if animate:
		m.a += alpha_delta
		face_up.set_modulate(m)
		face_up.global_translate(Vector3(0,0.25,0))
		count -= 1
		if count <= 0:
			set_process(false)
