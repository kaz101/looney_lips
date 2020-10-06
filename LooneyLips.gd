extends Control

var player_words = []
var prompts = ['Person','noun','adjective','adverb']
var story = '%s drank a %s and thought it was the %s thing he had ever %s.'
var game_over = false

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var StoryBox = $VBoxContainer/Story 

func _ready():
	welcome_screen()
	PlayerText.grab_focus()

func welcome_screen():
	StoryBox.text = "Welcome to Looney Lips the Mad Libs rip off extrordinare!! Press button to begin"
	prompt_user()
#func _on_StartButtom_pressed():
#	_on_Button_pressed()
	
func _on_PlayerText_text_entered(new_text):
	_on_Button_pressed()

func _on_Button_pressed():
	if game_over:
		get_tree().reload_current_scene()
	elif player_words.size() < prompts.size():
		if PlayerText.text:
			append_word_list()
			StoryBox.text = ''
		if player_words.size() == prompts.size():
			end_game()
			tell_story()
			PlayerText.clear()
			player_words = []
		else:
			prompt_user()
			PlayerText.clear()
			
func prompt_user():
	StoryBox.text += ' Alright, give me a ' + prompts[player_words.size()]
	
func append_word_list():
	player_words.append(PlayerText.text)
	
func tell_story():
	StoryBox.text = story % player_words
	
func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Button.grab_focus()
	game_over = true
