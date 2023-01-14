extends Control

export (NodePath) var _char_name
export (NodePath) var _char_num

onready var char_name    = get_node(_char_name)
onready var char_num     = get_node(_char_num)

#var value = 8  setget set_value
#var id    = ""
#var Name  = "" setget set_name
