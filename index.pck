GDPC                                                                                  res://TwentyOne.tscnp      +      �0�m��%�vA
Zv�   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://project.binary0
      w      ����w�-���}_�   res://title.gd.remap
              ��e��0}L�[`�D��   res://title.gdc P      �      O7�)W���X�[gd_scene load_steps=3 format=2]

[ext_resource path="res://TwentyOne.gd" type="Script" id=1]
[ext_resource path="res://SceneTransitionRect.tscn" type="PackedScene" id=3]

[node name="TwentyOne" type="Node"]
script = ExtResource( 1 )

[node name="ColorRect" type="ColorRect" parent="."]
margin_right = 480.0
margin_bottom = 720.0
color = Color( 0.305882, 0.415686, 0.329412, 1 )

[node name="Hit" type="Button" parent="."]
margin_left = 90.0
margin_top = 493.0
margin_right = 388.0
margin_bottom = 565.0
text = "Hit"
icon_align = 1

[node name="Stand" type="Button" parent="."]
margin_left = 93.0
margin_top = 592.0
margin_right = 389.0
margin_bottom = 663.0
action_mode = 0
button_mask = 0
text = "Stand"
icon_align = 1

[node name="ScoreLabel" type="RichTextLabel" parent="."]
margin_left = 399.0
margin_top = 446.0
margin_right = 464.0
margin_bottom = 485.0
grow_horizontal = 2
grow_vertical = 2
text = "Score: 0"

[node name="AspectRatioContainer" type="AspectRatioContainer" parent="."]
margin_left = 1.52588e-05
margin_top = 3.05176e-05
margin_right = 480.0
margin_bottom = 720.0
mouse_filter = 2

[node name="SceneTransitionRect" parent="." instance=ExtResource( 3 )]
margin_left = 1.0
margin_top = 1.0
margin_right = 1.0
margin_bottom = 1.0

[connection signal="pressed" from="Hit" to="." method="_on_Hit_pressed"]
     [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDSC   	         J      ���Ӷ���   ������ض   ���������������¶���   ������������������¶   �����϶�   ���¶���   ��������������������������Ҷ   ������������ٶ��    ����������������������������Ҷ��      0.0.1      /   MarginContainer/MainMenuContainer/Version Label    
   Version %s        res://TwentyOne.tscn      res://Options.tscn                                                      	      
               %      &      '      (      )      *      +      ,      2      9      :      ;      A      H      3YYYYY;�  Y5;�  VW�  YYYY0�  PQV�  W�  T�  �  �  YYYYYYYY0�  PQV�  �  T�  P�  QYYY0�  PQV�  �  T�  P�  QY`         [remap]

path="res://title.gdc"
ECFG      application/config/name         tic-tac-toe-21     application/run/main_scene         res://Main.tscn    display/window/size/width      8     display/window/size/height      �     display/window/dpi/allow_hidpi         #   display/window/handheld/orientation         portrait   display/window/stretch/mode         2d     display/window/stretch/aspect         expand  +   gui/common/drop_mouse_on_gui_input_disabled            input/ui_touch�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      /   input_devices/pointing/emulate_touch_from_mouse         )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres           