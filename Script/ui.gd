extends Control

@onready var scoreLabel:Label = $ScoreLabel

func setScore(i:int):
	scoreLabel.text = str(i)
