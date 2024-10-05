extends Window

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false  # Ensure the popup starts hidden

# Function to open the popup
func open_popup() -> void:
	self.visible = true  # Open and center the popup on the screen
	self.position = Vector2i(100,100)

func close_window() -> void:
	self.visible = false
