extends Node2D

onready var sprite = $Sprite

func _ready():
	$Overlay/BottomControls/Speed/SpeedSlider.value = sprite.speed
	$Overlay/BottomControls/Speed/SpeedLabel.text = "Speed: " + str(sprite.speed)
	$Overlay/BottomControls/AngularSpeed/AngularSpeedSlider.value = sprite.angular_speed
	$Overlay/BottomControls/AngularSpeed/AngularSpeedLabel.text = "Angular Speed: " + str(sprite.angular_speed)


func _on_SpeedSlider_value_changed(value):
	sprite.speed = value
	$Overlay/BottomControls/Speed/SpeedLabel.text = "Speed: " + str(value)
	$Overlay/BottomControls/Speed/SpeedSlider.focus_mode = Control.FOCUS_NONE
	


func _on_AngularSpeedSlider_value_changed(value):
	sprite.angular_speed = value
	$Overlay/BottomControls/AngularSpeed/AngularSpeedLabel.text = "Angular Speed: " + str(value)
	$Overlay/BottomControls/AngularSpeed/AngularSpeedSlider.focus_mode = Control.FOCUS_NONE


func _on_ChangeImageButton_pressed():
	$Overlay/FileDialog.popup()
