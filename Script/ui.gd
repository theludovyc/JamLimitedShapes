extends Control
class_name UI

@onready var scoreLabel:Label = $ScoreLabel
@onready var occludeRect:ColorRect = $OccludeRect
@onready var gameOverLabel:Label = $GameOverLabel

var score_tmp := 0

var score_tween:Tween

func setScore(i:int):
	if is_instance_valid(score_tween):
		score_tween.kill()
	
	score_tween = create_tween()
	
	score_tween.tween_method(update_score_label, score_tmp, i, 2)
	score_tween.set_ease(Tween.EASE_OUT)
	score_tween.set_trans(Tween.TRANS_CIRC)
	
func update_score_label(i:int):
	score_tmp = i
	
	scoreLabel.text = str(score_tmp)

func setGameOver(b:bool):
	occludeRect.visible = b
	gameOverLabel.visible = b
