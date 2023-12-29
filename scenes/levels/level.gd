extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print('gate entered')
	print(body)


func _on_player_laser(position):
	var laser = laser_scene.instantiate()
	laser.position = position
	$Projectiles.add_child(laser)

func _on_player_grenade(position):
	var grenade = grenade_scene.instantiate()
	grenade.position = position
	$Projectiles.add_child(grenade)
