extends CharacterBody2D

func _process(_delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction  * 500
	move_and_slide()
	if(Input.is_action_pressed("Shoot")):
		print("Shoot")
	if(Input.is_action_just_pressed("Secondary action")):
		print("Throw grenade")
