extends Area2D




func _on_SpikeStatic_body_entered(body):
	if body.name == "Player":
		body.die()
