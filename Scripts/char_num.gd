extends VBoxContainer

export (NodePath) var _num
export (NodePath) var _mod

onready var num = get_node(_num)
onready var mod = get_node(_mod)

var characteristic = Characteristic.new()

var value setget set_value

func _ready():
	characteristic.connect("value_changed", self, "set_numbers")
	set_numbers()
	pass

func set_numbers():
	num.Text = characteristic.value
	mod.Text = ("+" if characteristic.value > 11 else "") + str(characteristic.modifier)
	pass

func set_value(new_value):
	value = new_value
	characteristic.value = new_value
	pass
