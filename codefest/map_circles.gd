extends Node2D



var rotation_angle = 5
var angle_from = 0
var angle_to = 360
var radius = 80

var points = []





func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

func _draw():
	
	var color = Color(1.0, 0.0, 0.0, 0.1)
	radius += 0.1
	
	for i in range(len(points)):
		var center = Vector2(points[i] * 50, 200)
		draw_circle_arc_poly( center, radius, angle_from, angle_to, color )
	
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color.WHITE)
	
	for n in range(8):
		points.push_back(n)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	angle_from += rotation_angle
#	angle_to += rotation_angle

	# We only wrap angles when both of them are bigger than 360.
#	if angle_from > 360 and angle_to > 360:
#		angle_from = wrapf(angle_from, 0, 360)
#		angle_to = wrapf(angle_to, 0, 360)
	queue_redraw()
