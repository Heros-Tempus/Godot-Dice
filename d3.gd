extends RigidBody3D

var count = 30
var m = Color(1,1,1,0)
var animate = false
var alpha_delta = 0.5
@onready var face_up = $face1

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
	if (get_angular_velocity().is_zero_approx() or sleeping) and not animate:
		animate = true
		var face1 = $face1
		var face2 = $face2
		var face3 = $face3
		var ylist = {face1.global_transform.origin.y:face1,
		face2.global_transform.origin.y:face2,
		face3.global_transform.origin.y:face3}
		var greatest_y = -100
		for i in ylist.keys():
			if i > greatest_y:
				greatest_y = i
		face_up = ylist[greatest_y]
	if animate:
		m.a += alpha_delta
		face_up.set_modulate(m)
		face_up.set_scale(face_up.get_scale()*1.01)
		count -= 1
		if count <= 0:
			set_process(false)
