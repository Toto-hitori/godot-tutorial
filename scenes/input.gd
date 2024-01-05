extends Node
signal shoot_gun
signal throw_grenade
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("Shoot") ):
		shoot_gun.emit()
		$"../CanvasLayer".update_laser_text()
	if(Input.is_action_pressed("Secondary action")):
		throw_grenade.emit()
		$"../CanvasLayer".update_grenade_text()
