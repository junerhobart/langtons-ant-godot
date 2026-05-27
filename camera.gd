extends Camera2D
@export var target: Node

func _process(delta):
	position = Vector2(target.w / 2, target.h / 2)

	# i'm sorry if anyone tries to read this
	zoom = Vector2(min(get_viewport_rect().size.x / target.w, get_viewport_rect().size.y / target.h), min(get_viewport_rect().size.x / target.w, get_viewport_rect().size.y / target.h))
