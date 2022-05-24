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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_angular_velocity()==Vector3(0,0,0):
		var face1 = $"face1"
		face1.set_visible(true)
		face1.set_scale(face1.get_scale()*1.01)
		count -= 1
		if count <= 0:
			set_process(false)
