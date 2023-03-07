extends Node2D

var velocity = 0 # velocidad inicial
export var omega = PI / 10 
var r0 = position.x # posicion inicial
export var x_modified = 100 # lo moveremos por esto

func _ready():
	position.x = r0 + x_modified # lo movemos de su posicion

func _physics_process(delta):
    # d2x/dt2 = - omega x
    # d v /dt = - omega x
    velocity = velocity - omega * (position.x - r0)
    position.x += velocity * delta