extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = rand_range(-10,10)
	var y = rand_range(-10,10)
	var z = rand_range(-10,10)
	set_angular_velocity(Vector3(x, y, z))


var count = 30
var opacity = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_angular_velocity()==Vector3(0,0,0):
		var face1 = $"face1"
		var face2 = $"face2"
		var face3 = $"face3"
		var face4 = $"face4"
		var face5 = $"face5"
		var face6 = $"face6"
		var ylist = {face1.global_transform.origin.y:face1,
		face2.global_transform.origin.y:face2,
		face3.global_transform.origin.y:face3,
		face4.global_transform.origin.y:face4,
		face5.global_transform.origin.y:face5,
		face6.global_transform.origin.y:face6}
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
