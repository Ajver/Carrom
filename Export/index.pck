GDPC                                                                                @   res://.import/OnePixel.png-3ea1e370e7eab155778c362efa934567.stex       d       U��|�X{
�m��sH@   res://.import/circle.png-10953cad44a8947fbdd4128a631e9e52.stex  �H      Q      �\
�
E%E���$�><   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex [      �      �p��<f��r�g��.�   res://OnePixel.png.import   p      �      p��}�����Q�P�H$   res://Scenes/Board/Board.gd.remap   @k      -       ҽzU*����t��&s   res://Scenes/Board/Board.gdc 
      	      �U�1g5	��U���D,    res://Scenes/Board/Board.tscn         �      �h1�?�ĒFqo3�    res://Scenes/Board/Corner.tscn  �      d      7�6H�,�Fc���z		(   res://Scenes/Board/DisksManager.gd.remappk      4       ��+��O�]rtwãC$   res://Scenes/Board/DisksManager.gdc @      �
      �yT#�V~F��m`�/�=    res://Scenes/Disks/Disk.gd.remap�k      ,       ��yy��#>�L݄��   res://Scenes/Disks/Disk.gdc �%      @      �֯3D�˒���V   res://Scenes/Disks/Disk.tscn0(      4      ����"�no�oj�3�,   res://Scenes/Disks/DiskPhysicsMaterial.tres p,      U       ?�r��:RuV�Z�$   res://Scenes/Disks/MainDisk.gd.remap�k      0       ���,�R#�2)��    res://Scenes/Disks/MainDisk.gdc �,      �	      �N�4t�~g�쯟×�    res://Scenes/Disks/MainDisk.tscn�6      �	      �$<�a�nV��c~��$   res://Scenes/Disks/Pointer.gd.remap l      /       a�g�@iξ�t����j    res://Scenes/Disks/Pointer.gdc  `@            ���y[b��Ac�n�Z   res://circle.png.import �W      �      ���ѝߎ��D�5���W   res://default_env.tres  pZ      �       K��+fr��s����   res://icon.png  @l      i      ����󈘥Ey��
�   res://icon.png.import   �h      �      �����%��(#AB�   res://project.binary�y      k      GH�ѲӴFbথ��G`            GDST              H   PNG �PNG

   IHDR         ĉ   IDAT�c� 	���U�    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/OnePixel.png-3ea1e370e7eab155778c362efa934567.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://OnePixel.png"
dest_files=[ "res://.import/OnePixel.png-3ea1e370e7eab155778c362efa934567.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
    GDSC             S      ���ӄ�   �����������Ķ���   �����������Ķ���   �����϶�   �������Ӷ���   �����¶�   ����¶��   ����¶��   �������������Ҷ�   ����嶶�   �����������������Ӷ�   ��������������������Ҷ��                   
                                  	   &   
   '      0      9      ?      C      D      L      3YY5;�  W�  YY0�  PQX=V�  �  PQYY0�  PQX=V�  �  T�  PQ�  Y0�  P�  QX=V�  &�  T�  P�	  QV�  �  T�
  PQ�  �  PQ�  Y0�  PQX=V�  �  T�  PQ`       [gd_scene load_steps=9 format=2]

[ext_resource path="res://Scenes/Board/Board.gd" type="Script" id=1]
[ext_resource path="res://OnePixel.png" type="Texture" id=2]
[ext_resource path="res://Scenes/Board/Corner.tscn" type="PackedScene" id=3]
[ext_resource path="res://circle.png" type="Texture" id=4]
[ext_resource path="res://Scenes/Board/DisksManager.gd" type="Script" id=5]

[sub_resource type="PhysicsMaterial" id=3]
bounce = 1.0

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 465, 65 )

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 90, 300 )

[node name="Board" type="Node2D"]
position = Vector2( 512, 300 )
script = ExtResource( 1 )

[node name="BoardBackground" type="Sprite" parent="."]
modulate = Color( 0.576471, 0.521569, 0.372549, 1 )
position = Vector2( -2, 0 )
scale = Vector2( 600, 600 )
texture = ExtResource( 2 )

[node name="Corner" parent="." instance=ExtResource( 3 )]
position = Vector2( -287, -285 )

[node name="Corner2" parent="." instance=ExtResource( 3 )]
position = Vector2( 283, -285 )
rotation = 1.5708

[node name="Corner3" parent="." instance=ExtResource( 3 )]
position = Vector2( 283, 285 )
rotation = 3.14159

[node name="Corner4" parent="." instance=ExtResource( 3 )]
position = Vector2( -287, 285 )
rotation = 4.71239

[node name="CenterOfBoard" type="Position2D" parent="."]

[node name="circle" type="Sprite" parent="CenterOfBoard"]
modulate = Color( 0.619608, 0.447059, 0.447059, 1 )
scale = Vector2( 0.8, 0.8 )
texture = ExtResource( 4 )

[node name="DisksManager" type="Node2D" parent="."]
script = ExtResource( 5 )

[node name="Edges" type="StaticBody2D" parent="."]
collision_layer = 32
collision_mask = 0
physics_material_override = SubResource( 3 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Edges"]
position = Vector2( -12, -365 )
shape = SubResource( 1 )

[node name="CollisionShape2D2" type="CollisionShape2D" parent="Edges"]
position = Vector2( 8, 365 )
shape = SubResource( 1 )

[node name="CollisionShape2D3" type="CollisionShape2D" parent="Edges"]
position = Vector2( 388, 0 )
shape = SubResource( 2 )

[node name="CollisionShape2D4" type="CollisionShape2D" parent="Edges"]
position = Vector2( -392, 0 )
shape = SubResource( 2 )

     [gd_scene load_steps=4 format=2]

[ext_resource path="res://circle.png" type="Texture" id=1]
[ext_resource path="res://OnePixel.png" type="Texture" id=2]

[sub_resource type="CircleShape2D" id=1]
radius = 5.0

[node name="Corner" type="Area2D" groups=[
"corners",
]]
modulate = Color( 0.152941, 0.152941, 0.152941, 1 )
collision_layer = 8
collision_mask = 0

[node name="Sprite" type="Sprite" parent="."]
scale = Vector2( 0.15, 0.15 )
texture = ExtResource( 1 )

[node name="Sprite2" type="Sprite" parent="Sprite"]
position = Vector2( -66.6666, -66.6667 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite3" type="Sprite" parent="Sprite"]
position = Vector2( -66.6666, 0 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite4" type="Sprite" parent="Sprite"]
position = Vector2( -66.6666, 66.6667 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite5" type="Sprite" parent="Sprite"]
position = Vector2( -33.3334, 66.6667 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite6" type="Sprite" parent="Sprite"]
position = Vector2( 0, -66.6667 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite7" type="Sprite" parent="Sprite"]
position = Vector2( 66.6666, -66.6667 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="Sprite8" type="Sprite" parent="Sprite"]
position = Vector2( 66.6666, -33.3333 )
scale = Vector2( 66.6667, 66.6667 )
texture = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

            GDSC   +      S   �     ���ӄ�   ���ݶ���   �������ݶ���   �����������嶶��   ������������ݶ��   ������   ��������������   ��������������Ӷ   �������Ӷ���   ������������������ض   ������������Ҷ��   ���ݶ���   �����������ض���   ���������Ӷ�   �����������������Ŷ�   ����酶�   ����������ݶ   ��������   ������������Ŷ�   ��������ݶ��   �������Ӷ���   ��������Ҷ��   �������ض���   䶶�   ����Ӷ��   �������酶��   ߶��   �����ζ�   �����϶�   ������������ض��   ������������Ӷ��   �������Ӷ���   ���������������Ķ���   �������Ŷ���   ����׶��   ��������������϶   �����޶�   �����������������Ӷ�   ��������������������Ҷ��   ���������Ҷ�   �������Ӷ���   �����������Ķ���   �����������Ҷ���      res://Scenes/Disks/Disk.tscn       res://Scenes/Disks/MainDisk.tscn   �      =      p                     �A  �������?            register_new_disks    ��ʡE��?                  �@                  @@        �������?      timeout                                            #      -   	   6   
   8      9      @      A      H      O      P      U      V      ^      b      g      h      i      q      y            �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -     .     /     0     1     2     3   %  4   .  5   3  6   9  7   @  8   F  9   G  :   N  ;   R  <   T  =   U  >   ]  ?   i  @   k  A   l  B   p  C   q  D   y  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   3YY;�  �D  PQY;�  �D  P�  QYY:�  L�  �K  P�  R�  R�  QR�  �K  P�  R�  R�  QR�  �K  P�  R�  R�  QYMYY;�  V�  �  YY:�  V�  �  Y:�  V�  �  YY;�  �	  YY0�  PQX=V�  �	  PQ�  �
  P�
  Q�  �  Y0�	  PQX=V�  )�  �  PQV�  �  T�  PQ�  Y0�  PQX=V�  ;�  �  �  �  �  P�  T�  R�  L�  MQ�  �  P�  R�  Q�  �  P�  �  R�  Q�  �  P�  �  RZ�  Q�  �  ;�  �  T�  PQ�  �  P�  Q�  �  T�  �  P�  R�  �  Q�  Y0�  P�  V�  R�  V�  QV�  ;�  Z�  �  �  )�  �C  P�  QV�  ;�  P�  Q�  �  ;�  �  P�  Q�  �  �  �  P�  P�  R�  QR�  L�  �  MQ�  �  �  �  �  Y0�  P�  R�  QV�  ;�  �  T�  PQ�  �  P�  Q�  �  T�  �  �  �  T�   PQ�  �  T�  �  �  Y0�!  P�"  QV�  &�  V�  .�  �  )�  �  PQV�  &�  T�#  T�$  PQ�  V�  .�  �  �%  PQ�  Y0�&  PQX=V�  )�  �  PQV�  �  T�'  PQ�  �  AP�(  PQT�)  P�  QR�  Q�  �  �  �  Y0�%  PQX=V�  )�  �  PQV�  �  T�%  PQ�  �  �  �	  YY0�*  P�  QX=V�  �  -`              GDSC            K      ��������τ�   �����������Ķ���   ���������������Ķ���   �۶�   ���������Ҷ�   ���Ӷ���   ����������   �����������������Ӷ�   ������������   �����������������Ҷ�   ���׶���   ����������ƶ   ���������Ӷ�   �����������Ҷ���          corners                          	                           	   !   
   "      *      .      /      6      ?      C      3YY;�  YY0�  P�  QV�  �  �  �  Y0�  PQX=V�  �  �  �  Y0�  PQX=V�  �  �  YY0�	  P�
  QV�  &�
  T�  P�  QV�  �  PQ�  �  T�  PQ`[gd_scene load_steps=6 format=2]

[ext_resource path="res://Scenes/Disks/DiskPhysicsMaterial.tres" type="PhysicsMaterial" id=1]
[ext_resource path="res://Scenes/Disks/Disk.gd" type="Script" id=2]
[ext_resource path="res://circle.png" type="Texture" id=3]

[sub_resource type="CircleShape2D" id=1]
radius = 15.0

[sub_resource type="CircleShape2D" id=2]
radius = 15.0

[node name="Disk" type="RigidBody2D" groups=[
"disks",
]]
collision_layer = 2
collision_mask = 38
mode = 1
mass = 0.5
physics_material_override = ExtResource( 1 )
continuous_cd = 2
linear_damp = 4.0
angular_damp = 1.0
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
scale = Vector2( 0.15, 0.15 )
texture = ExtResource( 3 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Area2D" type="Area2D" parent="."]
collision_layer = 2
collision_mask = 8

[node name="CollisionShape2D" type="CollisionShape2D" parent="Area2D"]
shape = SubResource( 2 )

[connection signal="area_entered" from="Area2D" to="." method="_on_Corner_entered"]
            [gd_resource type="PhysicsMaterial" format=2]

[resource]
rough = true
bounce = 1.0

           GDSC   )      Z   �     ��������τ�   ��������Ҷ��   ����������ض   ���׶���   ���ׄ�   ������Ķ   ������Ķ   ����������������ض��   �����嶶   �����¶�   ����¶��   ���Ӷ���   ����������   ����¶��   �������������Ҷ�   ����綶�   ��������������ض   ��������������������ض��   �������ض���   ����������������������Ҷ   �������Ӷ���   ��������   ���������������������Ҷ�   ���������������Ŷ���   ����׶��   ����Ŷ��   ��������������������Ŷ��   ���Ӷ���   �����Ŷ�   ���������������������Ŷ�   ����������������Ҷ��   ���Ӷ���   ���������������Ҷ���   ��������   �������ׄ�������������Ҷ   ���϶���   ���������������������Ҷ�   �������ׄ�������������Ҷ   ���������Ҷ�   �����������������Ӷ�   ����������������          n      �      �      �      �     ,        grab                                                                       	   "   
   #      (      2      ;      =      >      G      M      O      P      Y      d      e      i      o      w      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2     3   
  4     5     6     7     8     9   !  :   "  ;   *  <   .  =   /  >   5  ?   7  @   8  A   =  B   D  C   J  D   K  E   R  F   V  G   W  H   `  I   d  J   e  K   m  L   s  M   u  N   v  O   z  P   {  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   3YY;�  Y;�  YY5;�  W�  Y5;�  W�  YY;�  V�  YY;�  L�  �K  P�  R�  R�  QR�  �K  P�  R�  R�  QYMYY0�	  P�
  QX=V�  &�  �  V�  .�  �  &�  T�  P�  QV�  �  T�  �  P�  R�  Q�  �  &�  V�  &�
  4�  V�  �  T�  �
  T�  �  '�  T�  P�  QV�  �  �  �  �  L�  M�  �  T�  �  T�  �  '�  V�  &�  T�  P�  QV�  �  �	  YY0�  P�  QX=V�  &�  �  V�  .�  �  �  �  �  �  &�  T�  �  T�  V�  .�  �  ;�  �  T�  PQ�  &�  T�  PQ�  V�  ;�  �  T�  PQ�  &�  T�  PQ�  V�  �  �  T�  �  �  T�  �  T�  �  Y0�  PQX=V�  �  �	  �  �  &�  �  V�  .�  �  �  �  L�
  M�  �  T�  PQYY0�   PQX=V�  �  �  �  &�  �  V�  .�  �  &�  V�  �  �  L�  M�  �  T�!  PQYY0�"  P�#  QV�  �$  PQ�  Y0�%  P�  QX=V�  �$  PQYY0�$  PQX=V�  &�  �  V�  .�  �  �  �  YY0�&  PQX=V�  �  �  �  �  T�  PQ�  Y0�'  PQX=V�  �  �(  �  �  &�  V�  �  T�!  PQY`          [gd_scene load_steps=8 format=2]

[ext_resource path="res://Scenes/Disks/DiskPhysicsMaterial.tres" type="PhysicsMaterial" id=1]
[ext_resource path="res://Scenes/Disks/MainDisk.gd" type="Script" id=2]
[ext_resource path="res://circle.png" type="Texture" id=3]
[ext_resource path="res://Scenes/Disks/Pointer.gd" type="Script" id=4]
[ext_resource path="res://OnePixel.png" type="Texture" id=5]

[sub_resource type="CircleShape2D" id=1]
radius = 20.0

[sub_resource type="CircleShape2D" id=2]
radius = 20.0

[node name="MainDisk" type="RigidBody2D" groups=[
"main_disk",
"disks",
]]
collision_layer = 4
collision_mask = 34
mode = 3
mass = 0.89
physics_material_override = ExtResource( 1 )
continuous_cd = 2
linear_damp = 4.0
angular_damp = 1.0
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
scale = Vector2( 0.2, 0.2 )
texture = ExtResource( 3 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Area2D" type="Area2D" parent="."]
collision_layer = 4
collision_mask = 50

[node name="CollisionShape2D" type="CollisionShape2D" parent="Area2D"]
shape = SubResource( 2 )

[node name="Pointer" type="Node2D" parent="."]
script = ExtResource( 4 )

[node name="Arrow" type="Sprite" parent="Pointer"]
position = Vector2( 0, -50 )
rotation = 0.785398
scale = Vector2( 5, 5 )
texture = ExtResource( 5 )

[node name="Sprite" type="Sprite" parent="Pointer/Arrow"]
position = Vector2( 1.5, 1.5 )
rotation = -0.785398
scale = Vector2( 0.5, 5 )
texture = ExtResource( 5 )

[node name="Sprite2" type="Sprite" parent="Pointer/Arrow"]
position = Vector2( 3.4, 3.4 )
rotation = -0.785398
scale = Vector2( 2, 0.5 )
texture = ExtResource( 5 )

[node name="SpringBase" type="Sprite" parent="Pointer"]
position = Vector2( 0, 25 )
scale = Vector2( 10, 3 )
texture = ExtResource( 5 )

[node name="Spring" type="Sprite" parent="Pointer/SpringBase"]
position = Vector2( 0, 0.5 )
scale = Vector2( 0.3, 1e-005 )
texture = ExtResource( 5 )
centered = false
offset = Vector2( -0.5, 0 )

[node name="StringStartPosition" type="Position2D" parent="Pointer"]

[connection signal="area_entered" from="Area2D" to="." method="_on_Area2D_area_entered"]
[connection signal="body_entered" from="Area2D" to="." method="_on_Area2D_body_entered"]
[connection signal="mouse_entered" from="Area2D" to="." method="_on_Mouse_entered"]
[connection signal="mouse_exited" from="Area2D" to="." method="_on_Mouse_exited"]
 GDSC   (      ;   O     ���ӄ�   ����Ҷ��   �������Ӷ���   ��������ݶ��   ���������¶�   �����Ѷ�   ���������Ӷ�   �����Ѷ�   ��������������������ض��   ������������������ض   �����������Ѷ���   �����������ⶶ��   �����������򶶶�   �����¶�   ����¶��   ������Ӷ   ����¶��   ����������������������Ҷ   ����Ӷ��   ϶��   ��������������������ض��   �������������¶�   ������������������¶   ���¶���   ���������������������Ҷ�   ��������������ض   �������ض���   �������Ŷ���   ����׶��   �������������ض�   �����������¶���   �����������������ض�   ���ж���   ����Ӷ��   ζ��   ��������������ض   �����޶�   ������Ӷ   ��������������������Ҷ��   ��������������������Ӷ��      /root/Board             �C     pA      grab                                                        $      %      ,   	   -   
   4      ;      <      C      H      Q      U      ]      _      `      d      j      q      {      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -     .     /     0     1     2     3     4   #  5   $  6   )  7   4  8   @  9   A  :   G  ;   3YY5;�  �  PQY5;�  �  PQY5;�  W�  �  Y5;�  W�	  YY;�
  V�  �  YY;�  V�  �  Y;�  V�  �  YY0�  P�  QV�  &�  V�  &�  T�  P�  QV�  �
  �  �  �  T�  T�  �  �  .�  �  &�
  V�  &�  4�  V�  ;�  �  PQ�  �  T�  T�  �  �  �  '�  T�  P�  QV�  �  PQ�  �
  �  �  �  T�  T�  �  �  '�  T�  P�  QV�  �  T�  �  T�  �  �
  �  �  Y0�  P�  QV�  &�  V�  .�  �  ;�  �  PQT�  PQ�  ;�   �  �  �  ;�!  �	  P�   T�"  R�   T�  Q�  �#  �!  �  Y0�  PQX�  V�  ;�  �  PQT�  PQ�  ;�   �  T�  �  �  .�-  P�   T�$  PQR�  Q�  Y0�  PQV�  ;�  �  PQ�  �  &�  �  V�  .�  �  �  �  �  �  ;�%  V�  �  �%  T�"  P�#  Q�  �  �%  T�  �  P�#  Q�  �  �  �  T�&  PQ�  �  T�'  P�%  Q`            GDST�   �           5  PNG �PNG

   IHDR   �   �   �X��  �IDATx���k�����nb��Hn&L�!z�E5Њ�BL�Uj[Z�P/�^�B[li�Z��7�h}�B�_A[
^��6�4-(���MNԘ�DcR#�ѓ���dw��33�syf����������x���y����X������#�)���>�)�7��!��l�J{�Fګ,���R�,���!im$�,,��]il��a��^���������0cہ���YY݂R��0��Eı)�T�a�e-����!,���>�� N.� �H�&����$��U9(�ܳ>�1��;��-���S�;I?\ŠTj���T�`)pF���k����=I>X��TbOcp.� ����B� ^���20��UJ�� a0&aݧ��ojP��r��/���RV�0�W���K�e��x�<���RU�0�� ��.�J�v� ���@�BR�j�cp]�55����`e������*c"��N�&��^�V�ļ7���x]]�p��5�'dW�$�&ֽ]ga�C�,�� cccq�1;Q\����b]^��wn�?T����iA2�]��������}kM��&f8bݩS��FR�����O!���� ����QF�b���Dw>u�
�j�?�l����d[���쮆���nM
�z�p,��d[��lp1�&j�"CRX+f���(U4�noǾ�PEv�
�f��<��}5���%X����$�-��,��^vb]�U���I�]��X
����fa��R�Byw�rH��x����T��X�Z(ϐ���j +��D �Ŏ���T^!ɼC�#�`��\�uRJ�?�qgp��$��="���eY���K�E�gad����i����Ym_*e�}`w�Y�$��F�c:��nO�$6b#\���O�ct�^D��N��������=Հ�8!{�O��c筡�����R����ڞ��y���p*�Q���R���� v��
I?^��&�����=��G$u)v�HV.��4蕭�>�%��g��J�4
|�]�����OF��H��|ݕ+y��}��ߐdq2{DVᐼ�Ǝ��{+}$���=	(�[����߫Z�۝����-Eji?v�6l��]�42;�� R�����{�$Q��&6���!E;;���]���X�o��mY$;gcS�J���c��!%��T�e?�MB���Պ<�#�ImbI+�&p?��V��d��J4����T��AV��8R6؄���}����Y��!�����q��aҋ��i�̙�jE�	�D�ul:��� �D�[���v����Q8�|bS��㺚������hr)���<�ĽKX+�����P8���`��8a�|`lB>x��_m"^���&]�Z�q-�����C�ov,�t쏋LH@����F�c��{��mE�ZG�q5
�T�lઠ7z3�p��2	x8*��D��X ��}���s��e(R=s�K�jD��;��4������
Ղ���!�u,p�k���8�����\o��XS���&�]��G������� �C�o2p~؛���{%uz��u��c�}���|�N�.a-H��a��	<�Z��]ޕz�w�
DPr

��ϱ�ɽ����E�K��CP@��P�����C�9�,�^y���|����dQ����gQ���d\#R3]P@D�ue��d.�-�rD�3x�[�L+bd�3 �^��Y��bmÚ��ۆ.w  3�`D��f ��XCEV"�!8x���tS@DD�a�*�D�3��b���>�&6%��!�m0���W"a���qEW!⩡&pD�U�xjf�Z+f�"NqP@DD�AqP@D�4�����{�D�|5˭H�5�O�.B�S{��ޢ��"⠀�8( "
���"⠀�8( "{�t��)"]>j���B�S��������&=*��У_[
.F�7[������f�t��?P@D�) "
���"���]���j��6�c8����"�YP@D�;�����X���bM�H��އ�d;0\H9"��L+�P7K�+
�H��t�� �Fr-G�/��x����	��k9"��H��A�W�ʧ�;�
�s9"�g{�����]�Z�GE"����@� c��yT$�'�	�  󁷳�H�#�w{�1l��w��2-G�����"��c=��0�L΢"O|��������EE"y��p�; �n�T�󊭫�0�/�MD�i8[��h4h���3*N�h�	Gg&�RҚLa��I�"�؎�������XD���Z�=��%���׸~UH+r(��W^��F�c��{��=Ոӂ�Z�}�%��G��3�V�p�=�D���M�ܜA��  � +�.K�+I0qm`���즮)��)�^`�aE;��̑���֤U�x���ڂ@h+2x81ɆD
�8	�r�KX��[Z���ω�Z��G��'ݘHA�q\�Dt� ��0�ddz�:D
��aWЛQ駋��p� ��Í��#�AZ���N� ��� ��-0p��������m�v�j��`��qPo nKa="i���	Zp�"M��YI�'����ҵ�, ��l,�s��S$E`���Ao&	�{�0\��H$c��c00�H��������X�f����b�9�Z�>��~�-҇��ل�P�O8 �������ѕ|�`�;��7 }��Dlp�oH$%��%d�$=bë�+Y�HW��6p�p@
W�"
x�~�m��X�c��A����{4���o9��3x�Z"N�����imOj�1��zХ�z@��Ȑ�8/�mJ����Ӂi�RD��0�7���ޮ��:췎��H3�A@ 2$Ӱ_;O�b�RY�E��o��dt�Q�nlG�e�m���( ��U�!9�O����+��2��Q�g���ǳ�AJ�1�	h:�p@��D����/�+��CJgv)7��U���|-'�`��ޛC)�eD��G8 ǀ@��,�n����z�gs
���%���#�R#�]��7B���B2�����Dܲ��
�*Ǝ��.�݁�~)�����w�]8���-FKp&�-�jv ?��y[QဂGC���k��)_ɶ��+��2k�,2��p�1� #�9�AV��F����2rh���w�z��r-�NͶI�zl���@;����[�N1�0���&�|sR�]�U�wV�p�g�����WC��A����bt�}x�������z M,�7�y,�=��c0ڼkA:%�í���	&����~�}�xނtJКL�k��eV�t��l�b����rTْ $ S�f~5+#�]���.K0��UmK �]E���IA��{^�a3�*[8��iK�I���M���T}��]؍���~���h+o�e6=�e���Y�T!_ �c�h�L�������A��A�
��=����*�W�����I��*��:{ҡ�� �u��R-�<����)�ݤ�R0ڪ�G�J8�{`���m�Xz�7}<S�`�Uw�:���#�A��^ǥPR�6c�X��n�a�+�r0ڪ��=�Q�C\��|}�fl�x���!�굷RJ�t솼����r�[�M�T�x�[0���=RK�	�<f&��~��W��G�V2�������{��\�.    IEND�B`�               [remap]

importer="texture"
type="StreamTexture"
path="res://.import/circle.png-10953cad44a8947fbdd4128a631e9e52.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://circle.png"
dest_files=[ "res://.import/circle.png-10953cad44a8947fbdd4128a631e9e52.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
          [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )

            GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://Scenes/Board/Board.gdc"
   [remap]

path="res://Scenes/Board/DisksManager.gdc"
            [remap]

path="res://Scenes/Disks/Disk.gdc"
    [remap]

path="res://Scenes/Disks/MainDisk.gdc"
[remap]

path="res://Scenes/Disks/Pointer.gdc"
 �PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Caroom     application/run/main_scene(         res://Scenes/Board/Board.tscn      application/config/icon         res://icon.png     input/stringd              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script         
   input/grab�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script            layer_names/2d_physics/layer_2         disk   layer_names/2d_physics/layer_3      	   main_disk      layer_names/2d_physics/layer_4         corner     layer_names/2d_physics/layer_5         main_disk_area     layer_names/2d_physics/layer_6      
   board_edge  !   physics/2d/default_gravity_vector              $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         )   rendering/environment/default_environment          res://default_env.tres       GDPC