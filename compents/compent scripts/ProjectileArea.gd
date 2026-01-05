@tool
class_name ProjectileArea extends HitBoxArea
@export var timer: FrameTimer
@export var attached_to_entity: bool
@export var max_lifespan_in_frames: int
@onready var previous_facing_right: bool = attack_manager.host.is_facing_right
var stay_on_right: bool #TODO use this to make a fix for the side swap porblem 
var is_active_previous: bool
var is_active: bool = false
var boxes: Array[CollisionShape2D]

# animation stuff
@export var animation_stuff: Array[AnimationResource]
signal animate(is_facing_right: bool, animation_stuff: Array[AnimationResource])

func start_animation(is_facing_right: bool):
		animate.emit(is_facing_right,animation_stuff)

func _ready():
	for child in get_children():
		if child is CollisionShape2D: boxes.append(child)
	super._ready()
	if attached_to_entity: top_level = false
	else: top_level = true


func reset_postion_detached():
	self.global_position = attack_manager.global_position 
	if attached_to_entity or attack_manager.host.is_facing_right: 
		self.scale = Vector2.ONE
	elif not attack_manager.host.is_facing_right: 
		self.scale = Vector2(-1,1)
	
	
#FIXME when attached to entiy projectile flips when it shouldn't 
func enable_disable_boxes():
	if is_active == true:
		for box in boxes:
			box.disabled = false
	elif is_active == false:
		for box in boxes:
			box.disabled = true

func lifespan_check():
	if is_active == true and is_active_changed():
		timer.start_frame_timer(max_lifespan_in_frames)
		start_animation(attack_manager.host.is_facing_right)
	elif timer.is_stoped():
		reset_postion_detached()
		timer.reset()
		is_active = false
	

func is_active_changed()->bool:
	if is_active == is_active_previous:
		is_active_previous = is_active
		return false
	else: 
		is_active_previous = is_active
		return true

func _process(_delta):
	if Engine.is_editor_hint(): pass
	else:
		lifespan_check()
		enable_disable_boxes()
		is_active_changed()
		
		
