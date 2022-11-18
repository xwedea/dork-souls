extends KinematicBody2D


export var isGettingHit : bool = false
export var isDead : bool = false

func _ready():
	pass



func _physics_process(delta):
#	if isDead:
#		var removetimer : SceneTreeTimer = get_tree().create_timer(10)
#		yield(removetimer, "timeout")
#		queue_free()
#		return
	
	if isGettingHit:
		return

	$AnimationPlayer.play("idle")
	
	
func handle_hit():
	isGettingHit = true
	$AnimationPlayer.play("hit")
	
	$HealthNode.handle_damage(50)
	if $HealthNode.health <= 0:
		$AnimationPlayer.play("death")
		var removetimer : SceneTreeTimer = get_tree().create_timer(2)
		yield(removetimer, "timeout")
		queue_free()
