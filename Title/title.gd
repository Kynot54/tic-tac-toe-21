extends Control

# app semver
var version = "1.5.3"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	$"MarginContainer/MainMenuContainer/Version Label".text = "Version %s" % version
	
	var logo = $MarginContainer/MainMenuContainer/PanelContainer/Logo
	var logo_container = $MarginContainer/MainMenuContainer/PanelContainer
	var logo_container_center = logo_container.get_global_transform().get_origin()
	
	logo_container_center.x += logo_container.rect_size.x/2
	logo_container_center.y += logo_container.rect_size.y/2
	
	logo.rect_pivot_offset.x = logo_container_center.x
	logo.rect_pivot_offset.y = logo_container_center.y

func _on_StartButtonCard_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
	Transit.change_scene("res://Player/PlayerCard.tscn")


func _on_OptionsButtonCard_pressed():
	Music.play_button_click(Music.ButtonType.TITLE_BUTTON)
	Transit.change_scene("res://Options/Options.tscn")


func _on_MainMenu_resized():
	var logo = $MarginContainer/MainMenuContainer/PanelContainer/Logo
	var logo_container = $MarginContainer/MainMenuContainer/PanelContainer
	var logo_container_center = logo_container.get_global_transform().get_origin()
	
	logo_container_center.x += logo_container.rect_size.x/2
	logo_container_center.y += logo_container.rect_size.y/2
	
	logo.rect_pivot_offset.x = logo_container_center.x
	logo.rect_pivot_offset.y = logo_container_center.y
