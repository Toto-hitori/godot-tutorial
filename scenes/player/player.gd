extends CharacterBody2D
var can_laser : bool = true
var can_grenade : bool = true
signal laser(position,direction)
signal grenade(position,direction)

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction  * speed
	rotate_player()
	move_and_slide()
	if(Input.is_action_pressed("Shoot") and can_laser):
		shoot_laser()
	if(Input.is_action_pressed("Secondary action") and can_grenade):
		throw_grenade()

func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_grenade_timeout():
	can_grenade = true

func rotate_player():
	look_at(get_global_mouse_position())

func shoot_laser():
	var spawn_pos = choose_spawn_position()
	var player_direction = (get_global_mouse_position() - position).normalized()
	can_laser = false
	$TimerLaser.start()
	$GunParticles.emitting = true
	laser.emit(spawn_pos, player_direction)
	
func throw_grenade():
	var grenade_pos = $GrenadeStartPos.global_position
	var player_direction = (get_global_mouse_position() - position).normalized()
	can_grenade = false
	$GrenadeTimer.start()
	grenade.emit(grenade_pos, player_direction)

func choose_spawn_position() -> Vector2:
	var laser_markers = $LaserStartPositions.get_children()
	return laser_markers.pick_random().global_position
