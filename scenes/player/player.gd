extends Node2D

func _process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	print(direction)
	position += direction * delta * 500
	if(Input.is_action_pressed("Shoot")):
		print("Shoot")
	if(Input.is_action_just_pressed("Secondary action")):
		print("Throw grenade")
