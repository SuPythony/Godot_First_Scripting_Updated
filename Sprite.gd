extends Sprite

var speed = 400
var angular_speed = PI
var auto = false
var my_delta = 0
var vertical_dir = Vector2.UP
var horizontal_dir = 1


func _process(delta):
	my_delta = delta
	if auto:
		rotation += angular_speed * horizontal_dir * delta
		var velocity = vertical_dir.rotated(rotation) * speed
		position += velocity * delta
	else:
		var direction = 0
		if Input.is_action_pressed("ui_left"):
			direction = -1
		if Input.is_action_pressed("ui_right"):
			direction = 1
		rotation += angular_speed * direction * delta
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("ui_up"):
			velocity = Vector2.UP.rotated(rotation) * speed
		if Input.is_action_pressed("ui_down"):
			velocity = Vector2.DOWN.rotated(rotation) * speed
		position += velocity * delta
			


func _on_CentreButton_pressed():
	position.x = 512
	position.y = 300
	rotation = 0


func _on_AutoMoveCheckbox_toggled(button_pressed):
	auto = button_pressed
	$"../Overlay/AutoMoveControl/VerticalDir".visible = button_pressed
	$"../Overlay/AutoMoveControl/HorizontalDir".visible = button_pressed
	$"../Overlay/AutoMoveControl/AutoMoveCheckbox".release_focus()


func _on_FileDialog_file_selected(path):
	var image = Image.new()
	var error = image.load(path)
	if error != OK:
		$"../Overlay/ImageError".popup()
		$"../Timer".start()
	var new_texture = ImageTexture.new()
	new_texture.create_from_image(image)
	texture = new_texture


func _on_Timer_timeout():
	$"../Overlay/ImageError".hide()


func _on_HSlider_value_changed(value):
	horizontal_dir = value
	$"../Overlay/AutoMoveControl/HorizontalDir/HSlider".focus_mode = Control.FOCUS_NONE


func _on_VSlider_value_changed(value):
	if value == 1:
		vertical_dir = Vector2.UP
	else:
		vertical_dir = Vector2.DOWN
	$"../Overlay/AutoMoveControl/VerticalDir/VSlider".focus_mode = Control.FOCUS_NONE
