extends PopupPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()  # Ensure the popup starts hidden

# Function to open the popup
func open_popup() -> void:
	self.popup_centered()  # Open and center the popup on the screen

# Function to close the popup
func close_popup() -> void:
	self.hide()  # Hide the popup
