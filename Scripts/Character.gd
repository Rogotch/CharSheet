extends Node

#class_name Character

#enum CHARACTERISTIC {STR, DEX, CON, WIS, INT, CHA}

var test_params = [
	{id = "str", value = 8},
	{id = "dex", value = 8},
	{id = "con", value = 8},
	{id = "wis", value = 8},
	{id = "int", value = 8},
	{id = "cha", value = 8},
]

var characteristics = [
#	{id = "str", value = 10},
#	{id = "dex", value = 10},
#	{id = "con", value = 10},
#	{id = "wis", value = 10},
#	{id = "int", value = 10},
#	{id = "cha", value = 10},
]

var additional_chars = [
	{id = "str", value = 1, source = "race_goliaph"},
]

var level = 1
var health = 0
var health_dices = {8 : 1}
var ac = 10
var armor = 0
var initiative = 0

func _ready():
	load_character()
	pass

func load_character():
	characteristics = []
	for test_char in test_params:
		var new_char = Characteristic.new()
		new_char.set_characteristic(test_char.id, test_char.value)
		characteristics.append(new_char)
	pass

func get_characteristic_by_id(id):
	for characteristic in characteristics:
		if characteristic.id == id:
			return characteristic
	pass

func get_characteristic_mod_by_id(id):
	var characteristic = Characteristic.new()
	characteristic.value = get_full_characteristic_value_by_id(id)
	return characteristic.modifier
	pass

func get_full_characteristic_value_by_id(id):
	var selected_characteristic
	for characteristic in characteristics:
		if characteristic.id == id:
			selected_characteristic = characteristic
			break
	var additional_value = get_full_characteristic_up_by_id(id)
	return selected_characteristic.value + additional_value
	pass

func get_full_characteristic_up_by_id(id):
	var all_ups = get_all_characteristic_ups_by_id(id)
	var additional_value = 0
	for up in all_ups:
		additional_value += up.value
	return additional_value
	pass

func get_all_characteristic_ups_by_id(id):
	var all_ups = []
	for characteristic in additional_chars:
		if characteristic.id == id:
			all_ups.append(characteristic)
	return all_ups
	pass

func get_max_health_value():
	var fin_value = 0
	var all_health_dices = health_dices.keys()
	for health_dice in all_health_dices:
		for i in health_dices[health_dice]:
			fin_value += health_dice/2 + 1 + get_characteristic_mod_by_id("con")
	return  fin_value
	pass
