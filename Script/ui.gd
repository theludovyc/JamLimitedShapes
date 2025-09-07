extends Control
class_name UI

@onready var scoreLabel:Label = $ScoreLabel
@onready var occludeRect:ColorRect = $OccludeRect
@onready var gameOverLabel:Label = $GameOverLabel

func setScore(i:int):
	scoreLabel.text = str(i)

func setGameOver(b:bool):
	occludeRect.visible = b
	gameOverLabel.visible = b
