#FIXME THIS CLASS IS TO BE REPLACED 
#FIXME THIS CLASS IS TO BE REPLACED 
#FIXME THIS CLASS IS TO BE REPLACED 
class_name AttackAnimationPart extends Resource#FIXME THIS CLASS IS TO BE REPLACED 
@export var displacement: Vector2
@export var time_in_frames: int = 30#FIXME THIS CLASS IS TO BE REPLACED 
@export var curve: Curve
var corection: float
#FIXME THIS CLASS IS TO BE REPLACED 

func get_corection():
	if curve == null:
		print("called")
		corection = 1
	else:
		var sum: float = 0
		for point in float(time_in_frames):
			sum += curve.sample(point/time_in_frames)#FIXME THIS CLASS IS TO BE REPLACED 
		if time_in_frames%2 == 1:#FIXME THIS CLASS IS TO BE REPLACED 
			corection = sum/(time_in_frames)
		else: corection = sum/(time_in_frames)
		print("corection " +str(corection))
	
#FIXME THIS CLASS IS TO BE REPLACED 

func get_time()-> float:
	return time_in_frames/60.0
#FIXME THIS CLASS IS TO BE REPLACED 
#FIXME THIS CLASS IS TO BE REPLACED 
func get_velocty(is_facing_right: bool) -> Vector2:#FIXME THIS CLASS IS TO BE REPLACED 
	if is_facing_right:
		return displacement/get_time()
	elif is_facing_right == false:#FIXME THIS CLASS IS TO BE REPLACED 
		return Vector2(displacement.x*-1,displacement.y)/(get_time())
	else:
		push_error("tweens are not working find the error")
		return Vector2.ZERO
#FIXME THIS CLASS IS TO BE REPLACED 

	
#FIXME THIS CLASS IS TO BE REPLACED 
