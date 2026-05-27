extends Sprite2D

@export var h: int = 250
@export var w: int = 250

@export var speedx: int

var x: int = h/2
var y: int = w/2

#| dir | direction |
#| 0   | up        |
#| 1   | right     |
#| 2   | down      |
#| 3   | left      |
var dir: int = 0

var img: = Image.create(w, h, false, Image.FORMAT_L8)

func _ready():
	offset = Vector2(h/2,w/2)
	
	img.fill(Color(1.0,1.0,1.0))

	texture = ImageTexture.create_from_image(img)

func step():
	var cp = img.get_pixel(x, y)
	
	if cp.r == 1:
		img.set_pixel(x, y, Color(0.0,0.0,0.0))
		dir += 1
	elif cp.r == 0:
		img.set_pixel(x, y, Color(1.0,1.0,1.0))
		dir -= 1
	else:
		img.set_pixel(x, y, Color(randf(), randf(), randf(), 1.0))
		dir -= 1

	dir = (dir + 4) % 4

	if dir == 0: y -= 1
	elif dir == 1: x += 1
	elif dir == 2: y += 1
	elif dir == 3: x -= 1

	x = (x + w) % w
	y = (y + h) % h

	texture.update(img)
	
func _process(_delta):
	for i in speedx:
		step()
