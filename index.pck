GDPC                                                                                   res://SceneTransitionRect.tscn  �      �      y���f�R�ț��A�   res://TicTac.gd.remap   0S      !       BZ� 8�z�6H>s�(   res://TicTac.gdc`      �      GƝ����O���   res://TicTac.tscn          n      k5���iU��^��n   res://TwentyOne.gd.remap`S      $       4=߅��[�t���"t   res://TwentyOne.gdc �/             5V����T��,i\S   res://TwentyOne.tscn�J      +      �0�m��%�vA
Zv�   res://default_env.tres  �O      �       um�`�N��<*ỳ�8   res://project.binary�S      w      ����w�-���}_�   res://title.gd.remap�S              ��e��0}L�[`�D��   res://title.gdc pP      �      O7�)W���X�[gd_scene load_steps=4 format=2]

[ext_resource path="res://SceneTransitionRect.gd" type="Script" id=1]

[sub_resource type="Animation" id=1]
resource_name = "Fade"
length = 0.7
tracks/0/type = "value"
tracks/0/path = NodePath(".:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.7 ),
"transitions": PoolRealArray( 1, 1 ),
"update": 0,
"values": [ Color( 1, 1, 1, 0 ), Color( 1, 1, 1, 1 ) ]
}

[sub_resource type="Animation" id=2]
length = 0.001
tracks/0/type = "value"
tracks/0/path = NodePath(".:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 0,
"values": [ Color( 1, 1, 1, 0 ) ]
}

[node name="SceneTransitionRect" type="ColorRect"]
modulate = Color( 1, 1, 1, 0 )
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color( 0, 0, 0, 1 )
script = ExtResource( 1 )

[node name="AnimationPlayer" type="AnimationPlayer" parent="."]
anims/Fade = SubResource( 1 )
anims/RESET = SubResource( 2 )
         GDSC   5      y   �     ���Ӷ���   �������������Ӷ�   �����������   ���������������   ���������������   ���   ���������Ӷ�   ��������������񶶶�   ��������������񶶶�   ���󶶶�   ���������Ӷ�   ����������Ӷ   ��������������Ŷ���   ��������������Ŷ���   ����Ŷ��   ������Ӷ   ������Ӷ   �����϶�   ������Ŷ   ��������������Ķ   ��������������Ķ   ������������Ҷ��   �����������ض���   ߶��   ���Ӷ���   ������¶   ���������Ҷ�   ���������������������Ҷ�   �����ض�   �������ض���   �����������Ŷ���   �������������������Ķ���   �������Ҷ���   ����������Ӷ   �����Ҷ�   �����Ҷ�   ������������ض��   �������������ζ�   ����������������������ض   ����������������������ڶ   ���¶���   ������Ŷ   �������������ڶ�   �����������ڶ���   �����������ڶ���   ����������������¶��   �������Ӷ���   ��Ŷ   ������������Ŷ��   �����Ӷ�   ������Ӷ$   ����������������������������������Ҷ    ���������������������������Ҷ���             res://Assets/Images/red-o.png         res://Assets/Images/blue-x.png        pressed       on_grid_button_pressed                    Player 1 Win      Player 2 Win   	                                                          Idle (No Player Turn)             Player 1 Turn         Player 2 Turn                                                       	      
                            "      $      %      -      5      ;      A      F      G      P      Y      Z      [      a      o      p      z      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4     5     6     7     8   #  9   -  :   6  ;   =  <   >  =   G  >   P  ?   Y  @   a  A   i  B   j  C   p  D   x  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P     Q     R     S     T     U   #  V   1  W   :  X   C  Y   D  Z   J  [   P  \   Q  ]   R  ^   `  _   f  `   l  a   m  b   r  c   w  d   x  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y   3YYY>�  N�  �  R�  �  R�  �  R�  �  YOYY>�  N�  �  R�  �  R�  �	  YOYY8;�
  �  T�  Y8;�  �  T�	  Y;�  LMY;�  LMY;�  YY5;�  �L  P�  QY5;�  �L  P�  QYYY0�  PQV�  ;�  W�  �  �  T�  PQ�  �  )�  �  T�  PQV�  �  L�  MT�  P�  RR�  RL�  L�  MR�  MQ�  �  T�  PQYYYYYY0�  P�  R�  QV�  ;�  W�  �  �  T�  PQ�  �  &T�  �  T�  V�  �  T�   �  �  �  �  �  �  L�  MT�!  P�  Q�  �  L�  MT�"  �  �  �  T�#  P�  Q�  �  &T�$  P�  QV�  W�%  �&  T�   �  �  W�%  �'  T�(  �  �  T�
  �  T�  �  T�  �  T�	  �  'T�  �  T�  V�  �  T�   �  �  �  �  �  �  L�  MT�!  P�  Q�  �  L�  MT�"  �  �  �  T�#  P�  Q�  �  &T�$  P�  QV�  W�%  �'  T�   �  �  W�%  �'  T�(  �  �  T�
  �  T�  �  T�  �  T�	  �  �  &�  �	  V�  T�
  �  T�  �  T�  �  T�	  �  YY0�$  P�)  QV�  ;�*  LLR�  R�
  MRL�  R�  R�  MRL�  R�  R�  MM�  ;�+  LLR�  R�  MRL�  R�  R�  MRL�
  R�  R�  MM�  ;�,  LLR�  R�  MRL�
  R�  R�  MM�  �  &�)  T�  PQ�  V�  )�-  L�*  R�+  R�,  MV�  )�.  �-  V�  &�)  T�/  P�.  LMQ�)  T�/  P�.  L�  MQ�)  T�/  P�.  L�
  MQV�  .�  �  �  .�  �  Y0�  PQV�  ;�  W�  �  �  T�  PQ�  W�%  �'  T�(  �  �  W�%  �&  T�   �  �  �  )�  �  V�  �  T�   �  �  �  �  ;�0  W�  �  �  T�  PQ�  )�1  �0  V�  �1  T�2  �  �  �  �  LM�  �  LM�  �  T�
  �  T�  �  T�  �  T�	  YY0�3  PQV�  /T�  V�  �  T�	  V�  T�  �  T�  �  W�%  �'  T�(  �  �  �  T�  V�  T�  �  T�  �  W�%  �'  T�(  �  �  �  T�  V�  T�  �  T�  �  W�%  �'  T�(  �  �  �  YYY0�4  PQV�  T�  PQY`         [gd_scene load_steps=3 format=2]

[ext_resource path="res://TicTac.gd" type="Script" id=1]
[ext_resource path="res://Assets/TitleTheme.tres" type="Theme" id=2]

[node name="TicTac" type="Node"]
script = ExtResource( 1 )

[node name="ColorRect" type="ColorRect" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0
color = Color( 0.709804, 0.709804, 0.709804, 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="MarginContainer" type="MarginContainer" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0
custom_constants/margin_right = 50
custom_constants/margin_top = 200
custom_constants/margin_left = 50
custom_constants/margin_bottom = 100
__meta__ = {
"_edit_lock_": true
}

[node name="CenterContainer" type="CenterContainer" parent="MarginContainer"]
margin_left = 50.0
margin_top = 200.0
margin_right = 1030.0
margin_bottom = 1820.0

[node name="SquaresGridContainer" type="GridContainer" parent="MarginContainer/CenterContainer"]
margin_left = 186.0
margin_top = 506.0
margin_right = 794.0
margin_bottom = 1114.0
rect_min_size = Vector2( 600, 600 )
size_flags_horizontal = 3
size_flags_vertical = 3
columns = 3

[node name="0Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_right = 200.0
margin_bottom = 200.0
rect_min_size = Vector2( 200, 200 )

[node name="1Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 204.0
margin_right = 404.0
margin_bottom = 200.0
rect_min_size = Vector2( 200, 200 )

[node name="2Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 408.0
margin_right = 608.0
margin_bottom = 200.0
rect_min_size = Vector2( 200, 200 )

[node name="3Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_top = 204.0
margin_right = 200.0
margin_bottom = 404.0
rect_min_size = Vector2( 200, 200 )

[node name="4Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 204.0
margin_top = 204.0
margin_right = 404.0
margin_bottom = 404.0
rect_min_size = Vector2( 200, 200 )

[node name="5Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 408.0
margin_top = 204.0
margin_right = 608.0
margin_bottom = 404.0
rect_min_size = Vector2( 200, 200 )

[node name="6Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_top = 408.0
margin_right = 200.0
margin_bottom = 608.0
rect_min_size = Vector2( 200, 200 )

[node name="7Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 204.0
margin_top = 408.0
margin_right = 404.0
margin_bottom = 608.0
rect_min_size = Vector2( 200, 200 )

[node name="8Texture" type="TextureRect" parent="MarginContainer/CenterContainer/SquaresGridContainer"]
margin_left = 408.0
margin_top = 408.0
margin_right = 608.0
margin_bottom = 608.0
rect_min_size = Vector2( 200, 200 )

[node name="TicTacToeGrid" type="GridContainer" parent="MarginContainer/CenterContainer"]
modulate = Color( 1, 1, 1, 0.172549 )
margin_left = 190.0
margin_top = 510.0
margin_right = 790.0
margin_bottom = 1110.0
rect_min_size = Vector2( 600, 600 )
theme = ExtResource( 2 )
columns = 3

[node name="0Buton" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_right = 198.0
margin_bottom = 198.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "0"

[node name="1Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 202.0
margin_right = 399.0
margin_bottom = 198.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "1"

[node name="2Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 403.0
margin_right = 600.0
margin_bottom = 198.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "2"

[node name="3Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_top = 202.0
margin_right = 198.0
margin_bottom = 399.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "3"

[node name="4Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 202.0
margin_top = 202.0
margin_right = 399.0
margin_bottom = 399.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "4"

[node name="5Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 403.0
margin_top = 202.0
margin_right = 600.0
margin_bottom = 399.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "5"

[node name="6Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_top = 403.0
margin_right = 198.0
margin_bottom = 600.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "6"

[node name="7Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 202.0
margin_top = 403.0
margin_right = 399.0
margin_bottom = 600.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "7"

[node name="8Button" type="Button" parent="MarginContainer/CenterContainer/TicTacToeGrid"]
margin_left = 403.0
margin_top = 403.0
margin_right = 600.0
margin_bottom = 600.0
size_flags_horizontal = 3
size_flags_vertical = 3
text = "8"

[node name="DebugItemsVBox" type="VBoxContainer" parent="."]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -322.0
margin_top = 64.0
margin_right = 322.0
margin_bottom = 381.0

[node name="DEBUGChangePlayerButton" type="Button" parent="DebugItemsVBox"]
margin_right = 644.0
margin_bottom = 105.0
theme = ExtResource( 2 )
text = "Change Player"

[node name="DEBUGCurrentPlayerLabel" type="Label" parent="DebugItemsVBox"]
margin_top = 109.0
margin_right = 644.0
margin_bottom = 208.0
theme = ExtResource( 2 )
text = "current player here"
align = 1

[node name="DEBUGResetButton" type="Button" parent="DebugItemsVBox"]
margin_top = 212.0
margin_right = 644.0
margin_bottom = 317.0
theme = ExtResource( 2 )
text = "Reset"

[connection signal="pressed" from="DebugItemsVBox/DEBUGChangePlayerButton" to="." method="_on_DEBUGChangePlayerButton_pressed"]
[connection signal="pressed" from="DebugItemsVBox/DEBUGResetButton" to="." method="_on_DEBUGResetButton_pressed"]
  GDSC   !   Y   u        ���Ӷ���   ���������������¶���   ������������������¶   ���ݶ���   ����������Ҷ   ����Ӷ��   �����϶�   �����������ݶ���   �߶�   ���������������Ҷ���   ߶��   ��Ѷ   ��������������������Ķ��   ����   ܶ��   ����������Ӷ   ���ƶ���   ���������������¶���   �������ݶ���   ���������ڶ�   ���¶���   �����Ҷ�   ����������Ӷ   �����Ӷ�   ������Ӷ   ����Ӷ��   �������ض���   ��������Ҷ��   ��������������Ҷ   ����������������Ķ��   ���Ҷ���   ����Ķ��   �����������������Ӷ�      rank      2         suit      Clovers       value               sprite        res://Cards/Clovers_2_white.png       3               res://Cards/Clovers_3_white.png       4               res://Cards/Clovers_4_white.png       5               res://Cards/Clovers_5_white.png       6               res://Cards/Clovers_6_white.png       7               res://Cards/Clovers_7_white.png       8               res://Cards/Clovers_8_white.png       9      	         res://Cards/Clovers_9_white.png       10     
          res://Cards/Clovers_10_white.png      Jack   "   res://Cards/Clovers_Jack_white.png        Queen      #   res://Cards/Clovers_Queen_white.png       King   "   res://Cards/Clovers_King_white.png        Ace       res://Cards/Clovers_A_white.png       Hearts        res://Cards/Hearts_2_white.png        res://Cards/Hearts_3_white.png        res://Cards/Hearts_4_white.png        res://Cards/Hearts_5_white.png        res://Cards/Hearts_6_white.png        res://Cards/Hearts_7_white.png        res://Cards/Hearts_8_white.png        res://Cards/Hearts_9_white.png        res://Cards/Hearts_10_white.png    !   res://Cards/Hearts_Jack_white.png      "   res://Cards/Hearts_Queen_white.png     !   res://Cards/Hearts_King_white.png         res://Cards/Hearts_A_white.png        Spades        res://Cards/Pikes_2_white.png         res://Cards/Pikes_3_white.png         res://Cards/Pikes_4_white.png         res://Cards/Pikes_5_white.png         res://Cards/Pikes_6_white.png         res://Cards/Pikes_7_white.png         res://Cards/Pikes_8_white.png         res://Cards/Pikes_9_white.png         res://Cards/Pikes_10_white.png         res://Cards/Pikes_Jack_white.png   !   res://Cards/Pikes_Queen_white.png          res://Cards/Pikes_King_white.png      res://Cards/Pikes_A_white.png         Diamonds      res://Cards/Tiles_2_white.png         res://Cards/Tiles_3_white.png         res://Cards/Tiles_4_white.png         res://Cards/Tiles_5_white.png         res://Cards/Tiles_6_white.png         res://Cards/Tiles_7_white.png         res://Cards/Tiles_8_white.png         res://Cards/Tiles_9_white.png         res://Cards/Tiles_10_white.png         res://Cards/Tiles_Jack_white.png   !   res://Cards/Tiles_Queen_white.png          res://Cards/Tiles_King_white.png      res://Cards/Tiles_A_white.png                   3         Score:    ffffff�?   �      ,                                                      	      
                                       .      A      T      g      z      �      �      �      �      �      �      �                &     9      L  !   _  "   r  #   �  $   �  %   �  &   �  '   �  (   �  )   �  *   
  +     ,     -   1  .   D  /   W  0   j  1   }  2   �  3   �  4   �  5   �  6   �  7   �  8     9     :     ;   )  <   <  =   O  >   b  ?   u  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I     J     K     L   	  M   
  N     O     P     Q   !  R   "  S   #  T   )  U   *  V   8  W   A  X   M  Y   U  Z   _  [   f  \   g  ]   h  ^   n  _   r  `   {  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t     u   3YYYYYYY5;�  VW�  YYYY�  Y;�  L�  �  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�	  R�  V�
  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�  R�  V�  R�  V�  R�  V�  OR�  NV�   R�  V�  R�  V�  R�  V�!  OR�  NV�"  R�  V�  R�  V�  R�  V�#  OR�  NV�$  R�  V�  R�  V�  R�  V�%  OR�  NV�&  R�  V�  R�  V�  R�  V�'  OR�  �  NV�  R�  V�(  R�  V�  R�  V�)  OR�  NV�  R�  V�(  R�  V�	  R�  V�*  OR�  NV�  R�  V�(  R�  V�  R�  V�+  OR�  NV�  R�  V�(  R�  V�  R�  V�,  OR�  NV�  R�  V�(  R�  V�  R�  V�-  OR�  NV�  R�  V�(  R�  V�  R�  V�.  OR�  NV�  R�  V�(  R�  V�  R�  V�/  OR�  NV�  R�  V�(  R�  V�  R�  V�0  OR�  NV�  R�  V�(  R�  V�  R�  V�1  OR�  NV�   R�  V�(  R�  V�  R�  V�2  OR�  NV�"  R�  V�(  R�  V�  R�  V�3  OR�  NV�$  R�  V�(  R�  V�  R�  V�4  OR�  NV�&  R�  V�(  R�  V�  R�  V�5  OR�  �  NV�  R�  V�6  R�  V�  R�  V�7  OR�  NV�  R�  V�6  R�  V�	  R�  V�8  OR�  NV�  R�  V�6  R�  V�  R�  V�9  OR�  NV�  R�  V�6  R�  V�  R�  V�:  OR�  NV�  R�  V�6  R�  V�  R�  V�;  OR�  NV�  R�  V�6  R�  V�  R�  V�<  OR�  NV�  R�  V�6  R�  V�  R�  V�=  OR�  NV�  R�  V�6  R�  V�  R�  V�>  OR�  NV�  R�  V�6  R�  V�  R�  V�?  OR�  NV�   R�  V�6  R�  V�  R�  V�@  OR�  NV�"  R�  V�6  R�  V�  R�  V�A  OR�  NV�$  R�  V�6  R�  V�  R�  V�B  OR�  NV�&  R�  V�6  R�  V�  R�  V�C  OR�  �  NV�  R�  V�D  R�  V�  R�  V�E  OR�  NV�  R�  V�D  R�  V�	  R�  V�F  OR�  NV�  R�  V�D  R�  V�  R�  V�G  OR�  NV�  R�  V�D  R�  V�  R�  V�H  OR�  NV�  R�  V�D  R�  V�  R�  V�I  OR�  NV�  R�  V�D  R�  V�  R�  V�J  OR�  NV�  R�  V�D  R�  V�  R�  V�K  OR�  NV�  R�  V�D  R�  V�  R�  V�L  OR�  NV�  R�  V�D  R�  V�  R�  V�M  OR�  NV�   R�  V�D  R�  V�  R�  V�N  OR�  NV�"  R�  V�D  R�  V�  R�  V�O  OR�  NV�$  R�  V�D  R�  V�  R�  V�P  OR�  NV�&  R�  V�D  R�  V�  R�  V�Q  OYMYY;�  LMYY;�  �R  YYY0�  PQV�  �  PQ�  )�  �K  P�  QV�  �	  PQ�  �  Y0�  PQV�  �  )�
  �K  P�X  P�  Q�S  QV�  ;�  �  T�  PQ�  ;�  �  T�  P�R  R�T  Q�  ;�  �  L�
  M�  �  L�
  M�  L�  M�  �  L�  M�  �  �  Y0�	  PQV�  &�  V�  ;�  �  T�  PQ�  �  �  L�  M�  W�  T�  �U  �>  P�  Q�  �  T�  P�  Q�  ;�  �  T�  PQ�  �  T�  �L  P�  L�  MQ�  �  T�  �  P�V  R�V  Q�  �  T�  �  P�W  R�X  Q�  �  P�  Q�  Y0�  PQV�  �	  PQ�  Y0�  PQV�  )�  �  V�  �  T�  P�  Q�  �  T�  PQYY0�   PQV�  �  �R  �  W�  T�  �U  �>  P�  QY`[gd_scene load_steps=3 format=2]

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

path="res://TicTac.gdc"
               [remap]

path="res://TwentyOne.gdc"
            [remap]

path="res://title.gdc"
ECFG      application/config/name         tic-tac-toe-21     application/run/main_scene         res://Main.tscn    display/window/size/width      8     display/window/size/height      �     display/window/dpi/allow_hidpi         #   display/window/handheld/orientation         portrait   display/window/stretch/mode         2d     display/window/stretch/aspect         expand  +   gui/common/drop_mouse_on_gui_input_disabled            input/ui_touch�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����   alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script      /   input_devices/pointing/emulate_touch_from_mouse         )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres           