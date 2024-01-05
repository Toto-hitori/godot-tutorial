extends CharacterBody2D
class_name Player

var can_laser : bool = true
var can_grenade : bool = true
signal laser(position,direction)
signal grenade(position,direction)

@export var laser_amount : int = 20
@export var grenade_amount : int = 10
@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction  * speed
	rotate_player()
	move_and_slide()


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
	laser_amount -= 1
	$GunParticles.emitting = true
	laser.emit(spawn_pos, player_direction)
	
func throw_grenade():
	var grenade_pos = $GrenadeStartPos.global_position
	var player_direction = (get_global_mouse_position() - position).normalized()
	can_grenade = false
	grenade_amount -= 1
	$GrenadeTimer.start()
	grenade.emit(grenade_pos, player_direction)

func choose_spawn_position() -> Vector2:
	var laser_markers = $LaserStartPositions.get_children()
	return laser_markers.pick_random().global_position


func _on_input_system_shoot_gun():
	if(can_laser and laser_amount > 0):
		shoot_laser()


func _on_input_system_throw_grenade():
		
	if(can_grenade and grenade_amount > 0):
		throw_grenade()
