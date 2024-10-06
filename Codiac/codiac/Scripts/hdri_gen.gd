extends Node3D

func _ready():
	# Create a new 30x30 image (initially black)
	var image = Image.new()
	image.create(30, 30, false, Image.FORMAT_RGB8)

	# Set all pixels to black
	for y in range(30):
		for x in range(30):
			image.set_pixel(x, y, Color(0, 0, 0))  # Black color

	# Save the image as a PNG file
	var file_path = "/home/nikhil/Desktop/generated_image.png"
	var result = image.save_png(file_path)

	if result == OK:
		print("Image saved successfully to ", file_path)
	else:
		print("Error saving image.")
