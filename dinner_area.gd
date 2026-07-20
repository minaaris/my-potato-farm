extends Area3D
@onready var fade: CanvasLayer = $"../Fade"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	print(body)
	if body.is_in_group("baked_potato"):
		body.queue_free()
		await fade.fade(1.0, 3).finished
		await fade.fade(0.0, 3).finished
		print("eat")


func _on_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
