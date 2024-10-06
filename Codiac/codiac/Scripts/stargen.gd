extends CPUParticles3D

@onready var particle_system = $CPUParticles3D  # Change this to your particle system node path

# Function to load star data from a text file
func _ready():
	load_star_data("res://CSVFiles/Gaia/GaiaSource_1.txt")

func load_star_data(file_path: String) -> Array:
	var stars = []
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		print("Failed to open file: ", file_path)
		return stars

	while not file.eof_reached():
		var line = file.get_line().strip_edges()
		if line != "":
			var columns = line.split(",")
			if columns.size() >= 4:  # Ensure there are enough columns
				var x = float(columns[1])  # X coordinate
				var y = float(columns[2])  # Y coordinate
				var z = float(columns[3])  # Z coordinate
				var radius = float(columns[4])
				var intens = float(columns[5])
				stars.append(Vector3(x, y, z))  # Add position as Vector3 to the array

	file.close()
	
	particle_system.amount = stars.size()
	var positions = PackedVector3Array()
	
	for star in stars:
		positions.append(star)
	
	particle_system.set_particle_positions(positions)  # Assign the positions to particles
	particle_system.set_emission_enabled(true)  # Enable particle emission

	
	
	
	return stars
