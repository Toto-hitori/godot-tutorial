extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print('gate entered')
	print(body)


func _on_player_laser(pos,direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = direction.angle()
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade(pos,direction):
	var grenade : RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
