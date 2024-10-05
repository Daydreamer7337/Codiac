extends Window

var matches = []
var planet_names = []
var button_container = "Window/ScrollContainer/VBoxContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false  # Ensure the popup starts hidden
	load_planet_names("res://CSVFiles/Exoplanet_Cartesian_Cordinates.txt")

# Function to open the popup
func open_popup() -> void:
	self.visible = true  # Open and center the popup on the screen
	self.position = Vector2i(100,100)

func close_window() -> void:
	self.visible = false


func load_planet_names(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file != null:
		while not file.eof_reached():
			var line = file.get_line()
			var columns = line.split(",")  # Split the line by commas (CSV format)
			if columns.size() > 0 and columns[0] != "pl_name":  # Avoid the header
				planet_names.append(columns[0])  # Append the first column (planet names)
		file.close()


func _search_query_submit() -> void:
	_clear_list()
	matches = []
	
	var query = $LineEdit.text
	
	if query == " ":
		return
	
	for i in planet_names:
		if query in i:
			matches.append(i)
	for i in matches:
		var Btn = Button.new()
		Btn.text = i
		$ScrollContainer/VBoxContainer.add_child(Btn)
		
func _clear_list(): #NOT WORKING. To be fixed
	var children = $ScrollContainer/VBoxContainer.get_children()
	for child in children:
		child.free()
