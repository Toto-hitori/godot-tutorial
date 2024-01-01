extends RigidBody2D

@export var speed = 750

func explosion():
	$AnimationPlayer.play("explosion")
