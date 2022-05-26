extends RigidBody

var count = 30
var opacity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var spin_magnitude = 20
	randomize()
	var x = rand_range(-1 * spin_magnitude, spin_magnitude)
	var y = rand_range(-1 * spin_magnitude, spin_magnitude)
	var z = rand_range(-1 * spin_magnitude, spin_magnitude)
	set_angular_velocity(Vector3(x, y, z))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_angular_velocity()==Vector3(0,0,0):
		var face1 = $"face1"
		var face2 = $"face2"
		var face3 = $"face3"
		var face4 = $"face4"
		var face5 = $"face5"
		var face6 = $"face6"
		var face7 = $"face7"
		var face8 = $"face8"
		var face9 = $"face9"
		var face10 = $"face10"
		var face11 = $"face11"
		var face12 = $"face12"
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
		face12.global_transform.origin.y:face12}
		var greatest_y = -100
		for i in ylist.keys():
			if i > greatest_y:
				greatest_y = i
		opacity += 0.05
		ylist[greatest_y].set_opacity(opacity)
		ylist[greatest_y].set_scale(ylist[greatest_y].get_scale()*1.01)
		count -= 1
		if count <= 0:
			set_process(false)
