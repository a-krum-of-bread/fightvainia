extends Area2D
@export var animation_stuff: Array[AnimationResource]
signal animate(is_facing_right: bool, animation_stuff: Array[AnimationResource])

func start_animation():
		animate.emit(true,animation_stuff)


func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		start_animation()
	print(position)
		 
