extends Node2D

var is_finish = false



func _on_Area2D_body_entered(body):
	if body.name =="Player" && !is_finish:
		$TrollFloor/AnimationPlayer.play("slide")
		is_finish = true
