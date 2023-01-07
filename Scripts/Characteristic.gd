tool
extends Resource

class_name Characteristic

signal value_changed

#export (Character.CHARACTERISTIC) var char_type
export (int) var value = 10 setget set_value

var modifier = 0 setget , get_modifier

func set_value(new_value):
	value = new_value
	get_modifier()
	emit_signal("value_changed")
	pass

func get_modifier():
	var result_value = value - 10
	var result_mod = floor(result_value/2.0 if result_value <= 0 else result_value/2.0)
	modifier = result_mod
	return result_mod
#	print(result_mod)
	pass
