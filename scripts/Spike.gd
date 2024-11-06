extends Node2D

onready var anim = $Spike/AnimationPlayer
var is_animated = false
export (bool) var enter_trigger = true

func _on_Spike_body_entered(body):
	if body.name == "Player" && enter_trigger:
		if !is_animated:
			anim.play("appear")
		body.die()


func _on_Spike_body_exited(body):
	if body.name == "Player" && !enter_trigger:
		anim.play("appear")
		is_animated = true
		enter_trigger = true
