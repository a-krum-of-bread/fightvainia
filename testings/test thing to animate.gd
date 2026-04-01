class_name AnimationComponet extends Node
@export var animation_stuff: Array[AnimationResource]
signal animate(is_facing_right: bool, animation_stuff: Array[AnimationResource],loops_times)

func start_animation(is_facing_right: bool,loops_times: int):
		animate.emit(is_facing_right, animation_stuff,loops_times)
