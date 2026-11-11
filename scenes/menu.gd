extends Control

var high_score = 0

func change_score(score):
	high_score = max(score, high_score)
	$Score.text = "Score: " + str(score)
	$HScore.text = "Highscore: " + str(high_score)
