extends Node

# Define the path to your CSV file
var csv_file_path = "res://Assets/Exoplanet_Cartesian_Cordinates.csv"

func _ready():
	# Call the function to read and parse the CSV file
	var data = read_csv(csv_file_path)
	if data.size() > 0:
		print("CSV Data: ", data)
	else:
		print("No data found or error reading file.")

# Function to read and parse the CSV file
func read_csv(path: String) -> Array:
	var file = FileAccess.open(path, FileAccess.READ)
	var parsed_data = []
	
	if file:
		while !file.eof_reached():
			# Read each line
			var line = file.get_line().strip_edges()
			if line:
				# Split line by commas to get each value
				var columns = line.split(",")
				parsed_data.append(columns)
		
		file.close()
		return parsed_data
	else:
		print("Error reading file at path: ", path)
		return []  # Return an empty array instead of null
