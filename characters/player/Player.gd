extends KinematicBody2D


export var GRAVITY = 30
const MAXFALLSPEED = 200
const MAXSPEED = 200
const JUMPFORCE = 600
const ACCELERATION = 40

var velocity = Vector2.ZERO
var facing_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#var isAttacking : bool = false 

func _physics_process(delta):
	# DIRECTION
	if facing_right:
		$AnimatedSprite.scale.x = 1
	else:
		$AnimatedSprite.scale.x = -1
	
	# Handling gravity
	velocity.y += GRAVITY
	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
		
		
	# HORIZONTAL MOVEMENT
	velocity.x = clamp(velocity.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("move_right"):
		velocity.x += ACCELERATION
		facing_right = true
		$AnimationPlayer.play("run")
	elif Input.is_action_pressed("move_left"):
		velocity.x -= ACCELERATION
		facing_right = false
		$AnimationPlayer.play("run")
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
		$AnimationPlayer.play("idle")
	
	# JUMP
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			print("JUMP ACTION")
			velocity.y -= JUMPFORCE
			$AnimationPlayer.play("jump")
	else:
		if velocity.y > 0:
			$AnimationPlayer.play("fall")
		elif velocity.y < 0:
			$AnimationPlayer.play("jump")
		
	# Setting the position
	var motion = move_and_slide(velocity, Vector2.UP)
	
	
	
