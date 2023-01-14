extends Control

signal update_values

export (NodePath) var _characteristics_grid
export (NodePath) var _points_txt
onready var characteristics_grid = get_node(_characteristics_grid)
onready var points_txt = get_node(_points_txt)

onready var pb_char_class = preload("res://Entities/PB_char.tscn")

var points = 27

func _ready():
	set_all_chars()
	pass # Replace with function body.

func set_all_chars():
	for characteristic in Character.characteristics:
		var new_pb = pb_char_class.instance()
		characteristics_grid.add_child(new_pb)
		new_pb.Name  = characteristic.id + "_name"
		new_pb.id    = characteristic.id
		new_pb.value = characteristic.value
		points -= new_pb.get_cost()
		new_pb.connect("value_changed", self, "get_points_value")
		new_pb.connect("new_value",     self, "set_char_value"  , [characteristic.id])
	update_counter()
	set_disabled()
	pass

func update_counter():
	points_txt.Text = points
	pass

func set_disabled():
	var all_pb = characteristics_grid.get_children()
	var max_value = Global.pointbuy_table.keys()[-1]
	for pb in all_pb:
		pb.block_inc(pb.get_up_cost() > points if max_value > pb.value else true)
	pass

func get_points_value():
	var all_pb = characteristics_grid.get_children()
	points = 27
	for pb in all_pb:
		points -= pb.get_cost()
	update_counter()
	set_disabled()
	pass

func set_char_value(value, id):
	var characteristic = Character.get_characteristic_by_id(id)
	characteristic.value = value
	print(Character.characteristics)
	prints("health", Character.get_max_health_value())
	pass
