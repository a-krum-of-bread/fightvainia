## MoveList
## doesnt contain all attacks becuse of how combo attacks are coded
## Organizes all attacks into nested dictionaries for easy access and management.
## All attacks are separately defined as variables and then categorized into folders in the editor.
## Attacks are organized into dictionaries by priority: all_specials, command_normals, neutral_normals, all_attacks.
## If air is not specified, the attack is a grounded attack.
## 
## Dictionary types and key format:
## - all_specials: Dictionary[Array, Attack] - Motion inputs (sequences like 236)
## - command_normals: Dictionary[Array, Attack] - Direction + button (no NEUTRAL motion)
## - neutral_normals: Dictionary[Array, Attack] - NEUTRAL + button only
## - all_attacks: Dictionary[Array, Attack] - Contains all attacks merged
## Key format: [is_on_ground: bool, is_facing_right: bool, motion: int, button: int]
## 
## Variable naming legend (only change variable names):
## a = air
## b = back
## u = up
## d = down
## l = left (when used as a direction)
## l = light (when used for attack button)
## r = right
## h = heavy
## p = punch
## k = kick
## qc = quarter circle
## f = forward
## dp = dragon punch
## ex = extra/EX move
## 
## This enum holds all constants for motion inputs and attacks as sequences or numbers.
## For example: DL=1 for down-left as a number, DQCR=236 as a sequence.
class_name MoveList extends BehaviourBase 
enum {DL=1,D=2,DR=3,L=4,NEUTRAL=5,R=6,UL=7,U=8,UR=9, # input directions
LK=12,HK=16,EXK=13,LP=14,HP=18,EXP=17,LPK=11,HPK=19, #attack buttons
DQCR=236,DQCL=214,UQCR=896,UQCL=874,LQCD=412,RQCD=632,LQCU=478,RQCU=698, #quarter circle motions
RDPD=623,LDPD=421,RDPU=689,LDPU=487, #dragon punch motions
DASHR=5656,DASHL=5454} 

## all of these are individual Attacks as of now there are neutral air crouch and back Attacks
@export_group("normal Attacks")

@export_subgroup("light kick normal Attacks")
@export var light_kick: Attack
@export var down_light_kick: Attack
@export var air_light_kick: Attack
@export var air_forward_kick: Attack
@export var back_light_kick: Attack
@export var air_back_kick: Attack
@onready var light_kick_normals: Dictionary[Array, Attack] = {
	#grounded right 
	[true,true,NEUTRAL,LK]: light_kick,
	[true,true,D,LK]: down_light_kick, 
	[true,true,L,LK]: back_light_kick,
	#grounded left 
	[true,false,NEUTRAL,LK]: light_kick,
	[true,false,D,LK]: down_light_kick, 
	[true,false,R,LK]: back_light_kick,
	#air right
	[false,true,NEUTRAL,LK]: air_light_kick,
	[false,true,R,LK]: air_forward_kick,
	[false,true,L,LK]: air_back_kick,
	#air left
	[false,false,NEUTRAL,LK]: air_light_kick,
	[false,false,L,LK]: air_forward_kick,
	[false,false,R,LK]: air_back_kick}

@export_subgroup("light punch normal Attacks")
@export var light_punch: Attack
@export var air_light_punch: Attack
@export var air_forward_punch: Attack
@export var down_light_punch: Attack
@export var back_light_punch: Attack
@export var air_back_punch: Attack
@onready var light_punch_normals: Dictionary[Array, Attack] = {
	#grounded right 
	[true,true,NEUTRAL,LP]: light_punch,
	[true,true,D,LP]: down_light_punch, 
	[true,true,L,LP]: back_light_punch,
	#grounded left 
	[true,false,NEUTRAL,LP]: light_punch,
	[true,false,D,LP]: down_light_punch, 
	[true,false,R,LP]: back_light_punch,
	#air right
	[false,true,NEUTRAL,LP]: air_light_punch,
	[false,true,R,LP]: air_forward_punch,
	[false,true,L,LP]: air_back_punch,
	#air left
	[false,false,NEUTRAL,LP]: air_light_punch,
	[false,false,L,LP]: air_forward_punch,
	[false,false,R,LP]: air_back_punch}

@export_subgroup("heavy kick normal Attacks")
@export var heavy_kick: Attack
@export var down_heavy_kick: Attack
@export var air_heavy_kick: Attack
@export var air_forward_heavy_kick: Attack
@export var back_heavy_kick: Attack
@export var air_back_heavy_kick: Attack
@onready var heavy_kick_normals: Dictionary[Array, Attack] = {
	#grounded right 
	[true,true,NEUTRAL,HK]: heavy_kick,
	[true,true,D,HK]: down_heavy_kick, 
	[true,true,L,HK]: back_heavy_kick,
	#grounded left 
	[true,false,NEUTRAL,HK]: heavy_kick,
	[true,false,D,HK]: down_heavy_kick, 
	[true,false,R,HK]: back_heavy_kick,
	#air right
	[false,true,NEUTRAL,HK]: air_heavy_kick,
	[false,true,R,HK]: air_forward_heavy_kick,
	[false,true,L,HK]: air_back_heavy_kick,
	#air left
	[false,false,NEUTRAL,HK]: air_heavy_kick,
	[false,false,L,HK]: air_forward_heavy_kick,
	[false,false,R,HK]: air_back_heavy_kick}

@export_subgroup("heavy punch normal Attacks")
@export var heavy_punch: Attack
@export var down_heavy_punch: Attack
@export var air_heavy_punch: Attack
@export var air_forward_heavy_punch: Attack
@export var back_heavy_punch: Attack
@export var air_back_heavy_punch: Attack
@onready var heavy_punch_normals: Dictionary[Array, Attack] = {
	#grounded right 
	[true,true,NEUTRAL,HP]: heavy_punch,
	[true,true,D,HP]: down_heavy_punch, 
	[true,true,L,HP]: back_heavy_punch,
	#grounded left 
	[true,false,NEUTRAL,HP]: heavy_punch,
	[true,false,D,HP]: down_heavy_punch, 
	[true,false,R,HP]: back_heavy_punch,
	#air right
	[false,true,NEUTRAL,HP]: air_heavy_punch,
	[false,true,R,HP]: air_forward_heavy_punch,
	[false,true,L,HP]: air_back_heavy_punch,
	#air left
	[false,false,NEUTRAL,HP]: air_heavy_punch,
	[false,false,L,HP]: air_forward_heavy_punch,
	[false,false,R,HP]: air_back_heavy_punch}

@export_group("special moves")
@export_subgroup("quarter circle special moves")
@export_subgroup("quarter circle special moves/down->forward")
@export var down_quarter_circle_forward_light_kick: Attack
@export var down_quarter_circle_forward_light_punch: Attack
@export var down_quarter_circle_forward_heavy_kick: Attack
@export var down_quarter_circle_forward_heavy_punch: Attack
@export_subgroup("quarter circle special moves/forward->down")
@export var forward_quarter_circle_down_light_kick: Attack
@export var forward_quarter_circle_down_light_punch: Attack
@export var forward_quarter_circle_down_heavy_kick: Attack
@export var forward_quarter_circle_down_heavy_punch: Attack
@export_subgroup("quarter circle special moves/up->forward")
@export var up_quarter_circle_forward_light_kick: Attack
@export var up_quarter_circle_forward_light_punch: Attack
@export var up_quarter_circle_forward_heavy_kick: Attack
@export var up_quarter_circle_forward_heavy_punch: Attack
@export_subgroup("quarter circle special moves/forward->up")
@export var forward_quarter_circle_up_light_kick: Attack
@export var forward_quarter_circle_up_light_punch: Attack
@export var forward_quarter_circle_up_heavy_kick: Attack
@export var forward_quarter_circle_up_heavy_punch: Attack
@export_subgroup("quarter circle special moves/down->back")
@export var down_quarter_circle_back_light_kick: Attack
@export var down_quarter_circle_back_light_punch: Attack
@export var down_quarter_circle_back_heavy_kick: Attack
@export var down_quarter_circle_back_heavy_punch: Attack
@export_subgroup("quarter circle special moves/back->down")
@export var back_quarter_circle_down_light_kick: Attack
@export var back_quarter_circle_down_light_punch: Attack
@export var back_quarter_circle_down_heavy_kick: Attack
@export var back_quarter_circle_down_heavy_punch: Attack
@export_subgroup("quarter circle special moves/up->back")
@export var up_quarter_circle_back_light_kick: Attack
@export var up_quarter_circle_back_light_punch: Attack
@export var up_quarter_circle_back_heavy_kick: Attack
@export var up_quarter_circle_back_heavy_punch: Attack
@export_subgroup("quarter circle special moves/back->up")
@export var back_quarter_circle_up_light_kick: Attack
@export var back_quarter_circle_up_light_punch: Attack
@export var back_quarter_circle_up_heavy_kick: Attack
@export var back_quarter_circle_up_heavy_punch: Attack

@onready var light_kick_specials: Dictionary[Array,Attack] = {
	#ground right quarter circle
	[true,true,DQCR,LK]: down_quarter_circle_forward_light_kick,
	[true,true,RQCD,LK]: forward_quarter_circle_down_light_kick,
	[true,true,UQCR,LK]: up_quarter_circle_forward_light_kick,
	[true,true,RQCU,LK]: forward_quarter_circle_up_light_kick,
	[true,true,DQCL,LK]: down_quarter_circle_back_light_kick,
	[true,true,LQCD,LK]: back_quarter_circle_down_light_kick,
	[true,true,UQCL,LK]: up_quarter_circle_back_light_kick,
	[true,true,LQCU,LK]: back_quarter_circle_up_light_kick,
	#ground left quarter circle
	[true,false,DQCL,LK]: down_quarter_circle_forward_light_kick,
	[true,false,LQCD,LK]: forward_quarter_circle_down_light_kick,
	[true,false,UQCL,LK]: up_quarter_circle_forward_light_kick,
	[true,false,LQCU,LK]: forward_quarter_circle_up_light_kick,
	[true,false,DQCR,LK]: down_quarter_circle_back_light_kick,
	[true,false,RQCD,LK]: back_quarter_circle_down_light_kick,
	[true,false,UQCR,LK]: up_quarter_circle_back_light_kick,
	[true,false,RQCU,LK]: back_quarter_circle_up_light_kick}

@onready var light_punch_specials: Dictionary[Array,Attack] = {
	#ground right quarter circle
	[true,true,DQCR,LP]: down_quarter_circle_forward_light_punch,
	[true,true,RQCD,LP]: forward_quarter_circle_down_light_punch,
	[true,true,UQCR,LP]: up_quarter_circle_forward_light_punch,
	[true,true,RQCU,LP]: forward_quarter_circle_up_light_punch,
	[true,true,DQCL,LP]: down_quarter_circle_back_light_punch,
	[true,true,LQCD,LP]: back_quarter_circle_down_light_punch,
	[true,true,UQCL,LP]: up_quarter_circle_back_light_punch,
	[true,true,LQCU,LP]: back_quarter_circle_up_light_punch,
	#ground left quarter circle
	[true,false,DQCL,LP]: down_quarter_circle_forward_light_punch,
	[true,false,LQCD,LP]: forward_quarter_circle_down_light_punch,
	[true,false,UQCL,LP]: up_quarter_circle_forward_light_punch,
	[true,false,LQCU,LP]: forward_quarter_circle_up_light_punch,
	[true,false,DQCR,LP]: down_quarter_circle_back_light_punch,
	[true,false,RQCD,LP]: back_quarter_circle_down_light_punch,
	[true,false,UQCR,LP]: up_quarter_circle_back_light_punch,
	[true,false,RQCU,LP]: back_quarter_circle_up_light_punch}

@onready var heavy_kick_specials: Dictionary[Array,Attack] = {
	#ground right quarter circle
	[true,true,DQCR,HK]: down_quarter_circle_forward_heavy_kick,
	[true,true,RQCD,HK]: forward_quarter_circle_down_heavy_kick,
	[true,true,UQCR,HK]: up_quarter_circle_forward_heavy_kick,
	[true,true,RQCU,HK]: forward_quarter_circle_up_heavy_kick,
	[true,true,DQCL,HK]: down_quarter_circle_back_heavy_kick,
	[true,true,LQCD,HK]: back_quarter_circle_down_heavy_kick,
	[true,true,UQCL,HK]: up_quarter_circle_back_heavy_kick,
	[true,true,LQCU,HK]: back_quarter_circle_up_heavy_kick,
	#ground left quarter circle
	[true,false,DQCL,HK]: down_quarter_circle_forward_heavy_kick,
	[true,false,LQCD,HK]: forward_quarter_circle_down_heavy_kick,
	[true,false,UQCL,HK]: up_quarter_circle_forward_heavy_kick,
	[true,false,LQCU,HK]: forward_quarter_circle_up_heavy_kick,
	[true,false,DQCR,HK]: down_quarter_circle_back_heavy_kick,
	[true,false,RQCD,HK]: back_quarter_circle_down_heavy_kick,
	[true,false,UQCR,HK]: up_quarter_circle_back_heavy_kick,
	[true,false,RQCU,HK]: back_quarter_circle_up_heavy_kick}

@onready var heavy_punch_specials: Dictionary[Array,Attack] = {
	#ground right quarter circle
	[true,true,DQCR,HP]: down_quarter_circle_forward_heavy_punch,
	[true,true,RQCD,HP]: forward_quarter_circle_down_heavy_punch,
	[true,true,UQCR,HP]: up_quarter_circle_forward_heavy_punch,
	[true,true,RQCU,HP]: forward_quarter_circle_up_heavy_punch,
	[true,true,DQCL,HP]: down_quarter_circle_back_heavy_punch,
	[true,true,LQCD,HP]: back_quarter_circle_down_heavy_punch,
	[true,true,UQCL,HP]: up_quarter_circle_back_heavy_punch,
	[true,true,LQCU,HP]: back_quarter_circle_up_heavy_punch,
	#ground left quarter circle
	[true,false,DQCL,HP]: down_quarter_circle_forward_heavy_punch,
	[true,false,LQCD,HP]: forward_quarter_circle_down_heavy_punch,
	[true,false,UQCL,HP]: up_quarter_circle_forward_heavy_punch,
	[true,false,LQCU,HP]: forward_quarter_circle_up_heavy_punch,
	[true,false,DQCR,HP]: down_quarter_circle_back_heavy_punch,
	[true,false,RQCD,HP]: back_quarter_circle_down_heavy_punch,
	[true,false,UQCR,HP]: up_quarter_circle_back_heavy_punch,
	[true,false,RQCU,HP]: back_quarter_circle_up_heavy_punch}

# Organized dictionaries for priority checking
@onready var all_specials: Dictionary[Array, Attack] = {}
@onready var command_normals: Dictionary[Array, Attack] = {}
@onready var neutral_normals: Dictionary[Array, Attack] = {}
@onready var all_attacks: Dictionary[Array, Attack] = {}

# removes all the nulls and filters attacks into priority categories
func _ready():
	var normals_temp: Dictionary[Array, Attack] = {}
	
	# Merge all normals into temp dictionary
	normals_temp.merge(light_kick_normals)
	normals_temp.merge(light_punch_normals)
	normals_temp.merge(heavy_kick_normals)
	normals_temp.merge(heavy_punch_normals)
	
	# Merge all specials
	all_specials.merge(light_kick_specials)
	all_specials.merge(light_punch_specials)
	all_specials.merge(heavy_kick_specials)
	all_specials.merge(heavy_punch_specials)
	
	# Filter normals into command_normals and neutral_normals
	for key in normals_temp.keys():
		if normals_temp[key] == null:
			continue # Skip null entries
		
		# key[2] is the motion value
		if key[2] == NEUTRAL:
			neutral_normals[key] = normals_temp[key]
		else:
			command_normals[key] = normals_temp[key]
	
	# Remove nulls from specials
	for key in all_specials.keys():
		if all_specials[key] == null:
			all_specials.erase(key)
	
	# Merge everything into all_attacks (for compatibility/debugging)
	all_attacks.merge(all_specials)
	all_attacks.merge(command_normals)
	all_attacks.merge(neutral_normals)
	
	print("Specials: ", all_specials.size())
	print("Command Normals: ", command_normals.size())
	print("Neutral Normals: ", neutral_normals.size())
	print("Total Attacks: ", all_attacks.size())
	
	super._ready() # behavior base
