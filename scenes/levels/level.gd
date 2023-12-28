extends Node2D

var test_array = ["Test","Hello","stuff"]
func _ready():
	for i in test_array:
		print(i)


func _on_gate_player_entered_gate(body):
	print('gate entered')
	print(body)


func _on_player_laser():
	print('laser from level')


func _on_player_grenade():
	print('throw grenade from level')
