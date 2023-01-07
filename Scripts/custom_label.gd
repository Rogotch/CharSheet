tool
extends Label
class_name CustomLabel

var fonts = [
	"res://Fonts/Silver.ttf"

]

#var keys = ["NunitoSans-Regular", "NunitoSans-ExtraLight", "SourceSansPro-Regular", "SourceSansPro-ExtraLight", "DwarvenStonecraftCyr", "Skandal"]
export(int) var font_size = 14          setget setFontSize
export(Color) var font_outline_color    setget SetOutlineColor
export(int)   var font_outline_size = 0 setget SetOutlineSize
export(int, 
"Silver"
) var type setget setFontType

var Text = "" setget SetLabelText, GetLabelText
var newFont = null

func SetLabelText(newText):
	set_text(str(newText))
	Text = newText
	pass

func GetLabelText():
	return text
	pass

func SetOutlineColor(color):
	font_outline_color = color
	setFontParams()
	pass

func SetOutlineSize(size):
	font_outline_size = size
	setFontParams()
	pass

func setFontParams():
	if type == null:
		type = 0
	newFont = DynamicFont.new()
#	newFont.antialiased = true
	newFont.outline_color = font_outline_color
	newFont.outline_size = font_outline_size
	newFont.font_data = load(fonts[type]).duplicate()
#	newFont.font_data.antialiased = false
	newFont.size = font_size

	add_font_override("font", newFont)
	pass

func setFontSize(value):
	font_size = value
	setFontParams()
	pass

func setFontType(value):
	type = value
	setFontParams()
	pass
