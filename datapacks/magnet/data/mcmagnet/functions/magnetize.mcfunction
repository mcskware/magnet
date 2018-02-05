#
# mcmagnet:magnetize

# get position of nearest item
execute store result score #ipx magnet run data get entity @e[type=item,limit=1] Pos[0] 1000
execute store result score #ipy magnet run data get entity @e[type=item,limit=1] Pos[1] 1000
execute store result score #ipz magnet run data get entity @e[type=item,limit=1] Pos[2] 1000

# get velocity of nearest item
execute store result score #ivx magnet run data get entity @e[type=item,limit=1] Motion[0] 1000
execute store result score #ivy magnet run data get entity @e[type=item,limit=1] Motion[1] 1000
execute store result score #ivz magnet run data get entity @e[type=item,limit=1] Motion[2] 1000

# get position of player
execute store result score #ppx magnet run data get entity @p Pos[0] 1000
execute store result score #ppy magnet run data get entity @p Pos[1] 1000
execute store result score #ppz magnet run data get entity @p Pos[2] 1000

# calculate the delta in the position between the player and the item
scoreboard players operation #pdx magnet = #ppx magnet
scoreboard players operation #pdy magnet = #ppy magnet
scoreboard players operation #pdz magnet = #ppz magnet

scoreboard players operation #pdx magnet -= #ipx magnet
scoreboard players operation #pdy magnet -= #ipy magnet
scoreboard players operation #pdz magnet -= #ipz magnet

# weight the delta so things don't magnetize too quickly
scoreboard players operation #pdx magnet /= #vweight magnet
scoreboard players operation #pdy magnet /= #vweight magnet
scoreboard players operation #pdz magnet /= #vweight magnet

# add the deltas to the item's velocity
scoreboard players operation #ivx magnet += #pdx magnet
scoreboard players operation #ivy magnet += #pdy magnet
scoreboard players operation #ivz magnet += #pdz magnet

execute store result entity @e[type=item,limit=1] Motion[0] double 0.001 run scoreboard players get #ivx magnet
execute store result entity @e[type=item,limit=1] Motion[1] double 0.001 run scoreboard players get #ivy magnet
execute store result entity @e[type=item,limit=1] Motion[2] double 0.001 run scoreboard players get #ivz magnet
