extends Node2D

export var defined_initial_positon: Vector2;
export var b_use_initial_position: bool; # default

export var velocity: Vector2 = Vector2(0,0);
export var omega: float = PI / 10;

# para oscilador harmonico requerimos una pos. inicial y un desplz
# eso define la nueva fuerza.
var displacement: Vector2;
export var use_initial_displacement: bool; # default

var r0
var r_modified: Vector2



func _ready():
	
	r0 = fUse_initial_position(b_use_initial_position); #fixed origin
	r_modified = Vector2(200,0)

	print(r_modified - r0)
		


func fUse_initial_position(bool_for_position):
	if bool_for_position == true:
		return defined_initial_positon
	else:
		return position

	

func fUse_initial_displacement(bool_for_displacement):
	if bool_for_displacement == true:
		return displacement
	else:
		return position


func _physics_process(delta):
	# d2x/dt2 = - omega x
	# d v /dt = - omega x
	velocity = velocity - omega * (r_modified - r0)
	position += velocity * delta
