extends StaticBody2D

var is_finish = false


func _on_Area2D_body_entered(body):
	if body.name == "Player" && !is_finish:
		if position.x > body.position.x:
			$AnimationPlayer.play("troll_left")
		else:
			$AnimationPlayer.play("troll_right")
		is_finish = true
