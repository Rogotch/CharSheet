extends Resource

class_name dice_roller

var rng = RandomNumberGenerator.new()



func _ready():
	pass


func roll_dice(dice_sides : int) -> int:
	rng.randomize()
	return 1 + rng.randi()%dice_sides
	pass

func roll_dices(dices_count : int, dice_sides : int) -> Array:
	var result = []
	for i in dices_count:
		result.append(roll_dice(dice_sides))
	return result
	pass

func adv_roll(dices_count : int, dice_sides : int, advantage : bool) -> int:
	var result_roll = roll_dices(dices_count, dice_sides)
	result_roll.sort()
	print(result_roll)
	return result_roll[-1] if advantage else result_roll[0]
	pass
