extends CharacterBody2D
@onready var hurtbox: Area2D = $Hurtbox


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready():
	hurtbox.body_entered.connect(_on_hurtbox_body_entered)

func _physics_process(delta):
	var input_vector = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100
	move_and_slide()

func _on_hurtbox_body_entered(body):
	Events.balloon_popped.emit()
	queue_free()
