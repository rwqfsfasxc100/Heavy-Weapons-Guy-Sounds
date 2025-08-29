extends "res://sfx/thruster.gd"

onready var HeavyLoop = get_node_or_null("HeavyLoop")
onready var HeavyStart = get_node_or_null("HeavyStart")
var can_use = true

func _ready():
	if HeavyLoop == null:
		can_use = false
	if HeavyStart == null:
		can_use = false

func _physics_process(delta):
	audioLoop.volume_db = -80
	audioStart.volume_db = -80
	if not can_use:
		return
	if not ship.setup or ship.frozen or ship.dummy:
		return
	if targetPower == 0and gimbalCurrent == gimbalTarget:
		if HeavyLoop.is_playing():
			HeavyLoop.stop()
			HeavyStart.stop()
		return
	if targetPower>0 and playerControlled:
		if not HeavyLoop.playing:
			HeavyLoop.play()
			HeavyStart.play()

	else:
		if HeavyLoop.is_playing():
			HeavyLoop.stop()
			HeavyStart.stop()
	

