extends VBoxContainer

signal value_changed

export (NodePath) var _char_name
export (NodePath) var _char_num
export (NodePath) var _dec
export (NodePath) var _inc

onready var char_name    = get_node(_char_name)
onready var char_num     = get_node(_char_num)
onready var dec          = get_node(_dec)
onready var dec_text     = dec.get_node("txt")
onready var inc          = get_node(_inc)
onready var inc_text     = inc.get_node("txt")

var value = 8 setget set_value
var Name = "" setget set_name

func _ready():
	set_value(value)
	pass

func set_value(new_value):
	value = new_value
	char_num.value = value
	update_labels()
	emit_signal("value_changed")
	pass

func set_name(new_value):
	Name = new_value
	char_name.Text = new_value
	pass

func _on_inc_pressed():
	set_value(value+1)
	pass


func _on_dec_pressed():
	set_value(value-1)
	pass

func update_labels():
	block_dec(!Global.pointbuy_table.keys().has(value-1))
	if Global.pointbuy_table.keys().has(value-1):
		dec_text.Text = "+" + str(get_down_cost())
	else:
		dec_text.Text = "MIN"
	
	block_inc(!Global.pointbuy_table.keys().has(value+1))
	if Global.pointbuy_table.keys().has(value+1):
		inc_text.Text = "-" + str(get_up_cost())
	else:
		inc_text.Text = "MAX"
	pass

func block_dec(flag):
	dec.disabled = flag
	pass

func block_inc(flag):
	inc.disabled = flag
	pass

func get_up_cost():
	return Global.pointbuy_table[value+1] - Global.pointbuy_table[value]
	pass

func get_down_cost():
	return Global.pointbuy_table[value] - Global.pointbuy_table[value-1]
	pass

func get_cost():
	return Global.pointbuy_table[value]
	pass
