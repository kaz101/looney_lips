extends Control


func _ready():
	var prompts = ['Kevin','coke','best','had']
	var story = '%s drank a %s and thought it was the %s thing he had ever %s.'
	print (story % prompts)
	
	$VBoxContainer/Story.text = story % prompts
