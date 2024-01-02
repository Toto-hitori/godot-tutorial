extends CharacterBody2D

func _process(delta):
	var direction = Vector2(1,0)
	velocity = direction * 400
	move_and_slide()
	
func hit():
	print('damage')
