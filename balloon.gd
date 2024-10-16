extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	var input_vector = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100
	move_and_slide()