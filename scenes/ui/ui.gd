extends CanvasLayer

@export var laser_label :Label
@export var grenade_label : Label
@export var player : Player
@onready var grenade_icon: TextureRect = $LaserCounter/VBoxContainer2/TextureRect
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect

func _ready():
	update_grenade_text()
	update_laser_text()

func update_laser_text():
	update_ui_color(player.laser_amount,laser_label,laser_icon)
	laser_label.text = str(player.laser_amount)
	
func update_grenade_text():
	update_ui_color(player.grenade_amount,grenade_label,grenade_icon)
	grenade_label.text = str(player.grenade_amount)


func update_ui_color(amount : int , label : Label, icon : TextureRect):
	if(amount == 0):
		label.modulate = Color.DARK_RED
		icon.modulate = Color.DARK_RED
	else:
		label.modulate = Color.DARK_GREEN
		icon.modulate = Color.DARK_GREEN
