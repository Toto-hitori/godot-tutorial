extends Node2D

var test_array = ["Test","Hello","stuff"]
func _ready():
	$Logo.rotation_degrees = 90
	for i in test_array:
		print(i)

func _process(delta):
	$Logo.rotation_degrees += 60*delta
	
	#flow -> if rotation > 180 -> 0
	if $Logo.rotation_degrees > 180: 
		$Logo.rotation_degrees = 0

	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
