extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $ColorRect/Label
@onready var label_2: Label = $ColorRect/Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.color.a = 0.0
	label.modulate.a = 0.0
	label_2.modulate.a = 0.0

func fade(target_alpha: float, duration: float = 1.0):
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", target_alpha, duration)
	tween.parallel().tween_property(label, "modulate:a", target_alpha, duration)
	tween.tween_property(label_2, "modulate:a", target_alpha, 1)
	return tween
