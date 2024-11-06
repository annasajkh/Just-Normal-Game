extends StaticBody2D


export (bool) var can_collide = true
export (bool) var is_visible = true
func _ready():
	$CollisionShape2D.disabled = !can_collide
	$MeshInstance2D.visible = is_visible
