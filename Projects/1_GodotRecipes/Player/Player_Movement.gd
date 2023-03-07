extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocity = 400.0
onready var screen_size = get_viewport().get_visible_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta): # cada frame
	var move_dir = Vector2.ZERO # vector de direccion
	if Input.is_action_pressed('move_left'):
		move_dir.x -= 1
	if Input.is_action_pressed('move_right'):
		move_dir.x += 1
	if Input.is_action_pressed('move_down'): # dir inversas
		move_dir.y += 1
	if Input.is_action_pressed('move_up'): # eje y va hacia abajo
		move_dir.y -= 1
		
	if move_dir.length() > 0:
		move_dir = move_dir.normalized() # normaliza el vector de direcn
		$AnimationPlayer.play() # get_node('AnimationPlayer').play()
		position += move_dir * velocity * delta
		
		$AnimationPlayer.flip_h = move_dir.x < 0
    



	# para que no se aleje del lugar
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
