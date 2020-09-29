extends Control
var player_words = []
var prompts = ['Person','noun','adjective','adverb']
var story = '%s drank a %s and thought it was the %s thing he had ever %s.'
onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var StoryBox = $VBoxContainer/Story 

func _ready():
	welcome_screen()

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)

func update_DisplayText(words):
	print(words)
	StoryBox.text = words
	PlayerText.clear()

func _on_Button_pressed():
	append_word_list()
	PlayerText.clear()
	prompt_user()

func welcome_screen():
	StoryBox.text = "Welcome to Looney Lips the Mad Libs rip off extrordinare!! Press button to begin"
	
	
func prompt_user():
	StoryBox.text = 'Alright, give me a ' + prompts[player_words.size()]
	
func append_word_list():
	player_words.append(PlayerText.text)
	
func tell_story():
	pass



func _on_StartButtom_pressed():
	update_DisplayText(PlayerText.text)
	prompt_user()
