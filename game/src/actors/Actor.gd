extends KinematicBody2D

# specifying the class name allows other scripts to etend
class_name Actor

const UP_DIRECTION: = Vector2.UP

export var speed: = Vector2(300.0, 1000.0)

# vertical acceleration
# adding the ".0" informs godot that this is a decimal and not an integer
export var gravity: = 4000.0

# ": =" informs the variable to inherit the type of its definition
var _velocity: = Vector2.ZERO
