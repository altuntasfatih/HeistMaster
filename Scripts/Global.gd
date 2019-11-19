extends Node

var Player
var navigation
var destinations

# Screen Links - Must be changed MANUALLY
var tutorial_messages="res://Scenes/Levels/TutorialMessages.json"

# Assets Links - Must be changed MANUALLY
var nigtvision_on_sfx ="res://SFX/nightvision.wav"
var nigtvision_off_sfx ="res://SFX/nightvision_off.wav"

var red_light="res://GFX/Interface/PNG/dotRed.png"
var green_light="res://GFX/Interface/PNG/dotGreen.png"

var briefcase_sprite="res://GFX/Loot/suitcase.png"
var box_sprite="res://GFX/PNG/Tiles/tile_129.png"
var box_ocluder="res://Scenes/Chracters/box_occluder.tres"

var player_sprite="res://GFX/PNG/Hitman 1/hitman1_stand.png"
var player_ocluder="res://Scenes/Chracters/character_occluder.tres"