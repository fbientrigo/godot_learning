extends CharacterBody2D

@export var speed : float = 100

func _physics_process(delta):
	# read input
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		- Input.get_action_strength("up") + Input.get_action_strength("down"),
	)
	
	# property
	velocity = input_direction.normalized() * speed
	move_and_slide()
	
	
	
	
	
	
