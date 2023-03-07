extends AnimatedSprite2D

func _process(delta):
	
	var attack_strenght = Input.get_action_strength("attack")
	# vector de direcciones
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		- Input.get_action_strength("up") + Input.get_action_strength("down"),
	) # es usado por if's para definir la animacion
	if input_direction.x > 0:
		set_flip_h(false)
		play("run_h")
	elif input_direction.x < 0:
		set_flip_h(true)
		play("run_h")
	elif input_direction.y != 0:
		play("run_h") # aqui no tengo animaicon vertical
	elif attack_strenght > 0:
		play("attack")
	else:
		play("idle")


		
		
		
	

		
