extends Node2D

var gameStarted: bool

var castleDamageZone: Area2D
var castleDamage: int
var castleHitbox: Area2D
var castleHealth: int

var enemyBaseDamageZone: Area2D
var enemyBaseDamage: int

var wave: int
var moving_to_next_wave: bool
