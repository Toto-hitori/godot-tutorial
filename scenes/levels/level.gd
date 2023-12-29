extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print('gate entered')
	print(body)


func _on_player_laser(position,direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = position 
	laser.rotation = direction.angle()
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade(position,direction):
	var grenade : RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = position
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
