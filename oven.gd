extends Area3D

@export var cooked_potato: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OmniLight3D.light_energy = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# print($Timer.time_left)
	pass




func _on_body_entered(body: Node3D):
	print(body)
	if body.is_in_group("potato"):
		body.queue_free()
		$StaticBody3D/oven_model/AnimationPlayer.play_backwards("Take 001")
		$Timer.start()
		$OmniLight3D.light_energy = 5.0
		$AudioStreamPlayer3D.play()
		print($Timer.wait_time)


func _on_body_exited(body: Node3D) -> void:
	pass


func _on_timer_timeout() -> void:
	var dish = cooked_potato.instantiate()
	get_tree().current_scene.add_child(dish)
	dish.global_position = $".".global_position
	$StaticBody3D/oven_model/AnimationPlayer.play("Take 001")
	dish.apply_central_impulse(Vector3(0,1,0) * 10)
	$Timer.stop()
	$OmniLight3D.light_energy = 0.0
	$AudioStreamPlayer3D.stop()
	$AudioStreamPlayer3D2.play()
	print("dish ready")
	
