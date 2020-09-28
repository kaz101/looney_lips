extends Control


func _ready():
	var prompts = ['Kevin','coke','best','had']
	var story = '%s drank a %s and thought it was the %s thing he had ever %s.'
	print (story % prompts)
	
	$VBoxContainer/Story.text = story % prompts


func _on_PlayerText_text_entered(new_text):
	_update_DisplayText(new_text)

func _update_DisplayText(words):
	print(words)
	$VBoxContainer/Story.text = words
	$VBoxContainer/HBoxContainer/PlayerText.clear()


func _on_Button_pressed():
	_update_DisplayText($VBoxContainer/HBoxContainer/PlayerText.text)
