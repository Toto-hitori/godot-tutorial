extends CharacterBody2D
var can_laser : bool = true
var can_grenade : bool = true
signal laser
signal grenade
func _process(_delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction  * 500
	move_and_slide()
	if(Input.is_action_pressed("Shoot") and can_laser):
		shoot_laser()
	if(Input.is_action_pressed("Secondary action") and can_grenade):
		throw_grenade()

func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_grenade_timeout():
	can_grenade = true

func shoot_laser():
	laser.emit()
	can_laser = false
	$TimerLaser.start()

func throw_grenade():
	grenade.emit()
	can_grenade = false
	$GrenadeTimer.start()
