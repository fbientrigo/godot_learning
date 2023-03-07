extends KinematicBody2D

#	este codigo incluye el movimiento bajo un potencial
#	U(x)
#	donde despues de resolver la integral analiticamente
#	\int dt = \int dx / sqrt( (2/m)(E - U(x)) )
#	se escribe
# 	x = sqrt(2E/m) sin( sqrt(k/m) t + phi_0 )



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var E = 20000.0
export var m = 1.0
export var k = 25.0

var A = sqrt(2*E/m)
var omega =  sqrt(k/m)

var t = 0.0
var front = true
onready var rprime = get_node("../star") # se recomienda usar grupos


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("idle")

func _process(delta):
	# gira en torno a lo importante
	t += delta
	position.x = rprime.position.x + A*sin( omega * t )
	position.y = rprime.position.y
	
	# controlar si esa delante o atras z_index
	# necesito algo que me controle la velocidad
	# si va a la izquierda, que este detras
	# si va a la derecha, que este delante
	# usamos la derivada del seno entonces, el coseno:
	if cos(omega * t) < 0: # cuando es neg, va hacia la izq
		z_index = 0
	else: # cuando es positivo va hacia la derecha
		z_index = 1
		
	
	# --- esta seccion es para resetear t
	#print(t)
	# no es necesario, t aumenta app en 1 cada segundo
	# le tomaria 5.7**292 años llegar al limite
	
	# ya que rapidamente escala a valores grandes prefiero reiniciarlo
	# print(fmod(10.0,3.0)) # 10.0 % 3.0 dara error, por ser floats
	#if fmod(omega*t, 2*PI) <= 0.008: # cerca de 2pi se puede resetear
	#	print('reseting t')
	#	t = 0
