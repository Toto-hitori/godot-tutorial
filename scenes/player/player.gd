extends CharacterBody2D
var can_laser : bool = true
var can_grenade : bool = true
signal laser(position)
signal grenade(position)
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
	var spawn_pos = choose_spawn_position()
	can_laser = false
	$TimerLaser.start()
	laser.emit(spawn_pos)

func throw_grenade():
	var grenade_pos = $GrenadeStartPos.global_position
	can_grenade = false
	$GrenadeTimer.start()
	grenade.emit(grenade_pos)

func choose_spawn_position() -> Vector2:
	var laser_markers = $LaserStartPositions.get_children()
	return laser_markers.pick_random().global_position
