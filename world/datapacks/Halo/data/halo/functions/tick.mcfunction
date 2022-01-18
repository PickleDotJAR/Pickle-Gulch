#####################################################################
#                            Pickle Gulch                           #
#                                                                   #
#      A Minecraft PVP recreation of the "Blood Gulch" map from     #
#                        Halo: Combat Evolved                       #
#                            (Xbox, 2001)                           #
#    -------------------------------------------------------------  #
#                                                                   #
#                               Credits                             #
#                                                                   #
#                    Original Idea, Build & Design                  #
#                            BobertPickle                           #
#                      youtube.com/bobertpickle                     #
#                                                                   #
#                         Build & Design Lead                       #
#                            SuperSideKian                          #
#                      youtube.com/supersidekian                    #
#                                                                   #
#                      Build & Design Assistant                     #
#                             PinkedDuck                            #
#            youtube.com/channel/UCkCchq_wC1IoGkx65tlkF2A           #
#                                                                   #
#                  Author, Build & Design Assistant                 #
#                               Swarmee                             #
#            youtube.com/channel/UCrh_c61BDfosxMYrRboqsww           #
#                                                                   #
#####################################################################

#     See Copyright.txt for copyright and licensing information     #

###RESET
# Check if reset button in lobby has been pressed and reset map if so
execute if block 211 33 188 minecraft:polished_blackstone_button[powered=true] run function halo:setup/reset



###TIMERS

##ready_timer
# Check if ReadyUp scoreboard has value of 2 indicating both red and blue teams are ready
execute if score #readycount ReadyUp matches 2 run function halo:setup/timers/ready_timer

# If player #readytimer's score for the scoreboard ready_timer  >= 1, remove 1 tick
execute if score #readytimer ready_timer matches 1.. run scoreboard players remove #readytimer ready_timer 1

# Countdown commands for ready_timer values
execute if score #readytimer ready_timer matches 102 run title @a title {"text":"5","color":"gold","bold":true,"underlined":true}
execute as @a at @s if score #readytimer ready_timer matches 101 run playsound block.note_block.bit master @a

execute if score #readytimer ready_timer matches 82 run title @a title {"text":"4","color":"gold","bold":true,"underlined":true}
execute as @a at @s if score #readytimer ready_timer matches 81 run playsound block.note_block.bit master @a

execute if score #readytimer ready_timer matches 62 run title @a title {"text":"3","color":"gold","bold":true,"underlined":true}
execute as @a at @s if score #readytimer ready_timer matches 61 run playsound block.note_block.bit master @a

execute if score #readytimer ready_timer matches 42 run title @a title {"text":"2","color":"gold","bold":true,"underlined":true}
execute as @a at @s if score #readytimer ready_timer matches 41 run playsound block.note_block.bit master @a

execute if score #readytimer ready_timer matches 22 run title @a title {"text":"1","color":"gold","bold":true,"underlined":true}
execute as @a at @s if score #readytimer ready_timer matches 21 run playsound block.note_block.bit master @a

execute if score #readytimer ready_timer matches 4 run title @a title {"text":"GO!!!","color":"green","bold":true,"underlined":true}
execute if score #readytimer ready_timer matches 3 run tp @e[type=minecraft:player,team=Blue] 117 18 286 180 0
execute if score #readytimer ready_timer matches 3 run tp @e[type=minecraft:player,team=Red] 119 17 78 0 0
execute as @a at @s if score #readytimer ready_timer matches 2 run playsound block.note_block.bit master @a ~ ~ ~ 1.0 1.7

# Call deathmreadyup.mcfunction
execute if score #readytimer ready_timer matches 1 run function halo:setup/ready/deathmreadyup


##Loot drop timers
# Check if ReadyUp scoreboard has value of 5 indicating the game has started, run the loot drop game_timer function
execute if score #readytimer ready_timer matches 5 run function halo:setup/timers/game_timer

# If entity #gametimer's score for the scoreboard game_timer >= 1, add 1 tick
execute if score #gametimer game_timer matches 1.. run scoreboard players add #gametimer game_timer 1

# Call Loot Drop function every 5 minutes of gameplay
execute if score #gametimer game_timer matches 6000 run function halo:setup/lootdrop/dropship

# If player #shiptimer's score for the scoreboard ship_timer  >= 1, remove 1 tick
execute if score #shiptimer ship_timer matches 1.. run scoreboard players remove #shiptimer ship_timer 1

execute if score #shiptimer ship_timer matches 62 run tellraw @a {"text":"Drop ship arriving in 3...","color":"yellow","bold":true,"underlined":true}

execute if score #shiptimer ship_timer matches 42 run tellraw @a {"text":"2...","color":"yellow","bold":true,"underlined":true}

execute if score #shiptimer ship_timer matches 22 run tellraw @a {"text":"1...","color":"yellow","bold":true,"underlined":true}

# schedule bonus.mcfunction to draw ships and drop loot at bases
execute if score #shiptimer ship_timer matches 1 run function halo:setup/lootdrop/bonus

##win_timer
# If player #wintimer's's score for the scoreboard win_timer  >= 1, remove 1 tick
execute if score #wintimer win_timer matches 1.. run scoreboard players remove #wintimer win_timer 1

# Countdown commands for win_timer values
execute if score #wintimer win_timer matches 202 run tellraw @a {"text":"TP to lobby in 10 seconds...","color":"yellow","bold":true,"underlined":true}
execute as @a at @s if score #wintimer win_timer matches 201 run playsound block.note_block.bit master @a

execute if score #wintimer win_timer matches 62 run tellraw @a {"text":"3...","color":"yellow","bold":true,"underlined":true}
execute as @a at @s if score #wintimer win_timer matches 61 run playsound block.note_block.bit master @a

execute if score #wintimer win_timer matches 42 run tellraw @a {"text":"2...","color":"yellow","bold":true,"underlined":true}
execute as @a at @s if score #wintimer win_timer matches 41 run playsound block.note_block.bit master @a

execute if score #wintimer win_timer matches 22 run tellraw @a {"text":"1...","color":"yellow","bold":true,"underlined":true}
execute as @a at @s if score #wintimer win_timer matches 21 run playsound block.note_block.bit master @a

# Call gameover.mcfunction
execute if score #wintimer win_timer matches 1 run function halo:setup/gameover



###READY UP
# Check if Red team is created
execute if block 213 32 186 minecraft:polished_blackstone_button[powered=true] run function halo:setup/red/red

# Check if Blue team is created
execute if block 213 32 193 minecraft:polished_blackstone_button[powered=true] run function halo:setup/blue/blue




###GAMETYPE
# Deathmatch: Check if Team DM is selected as the game mode and either team has reached the win condition of 50 total player kills
execute if block 211 33 191 minecraft:polished_blackstone_button[powered=true] run function halo:setup/mode/deathm

# KOTH: Check if KOTH is selected as the game mode and either team has reached the win condition of 5 minutes total capture time
execute if block 211 33 189 minecraft:polished_blackstone_button[powered=true] run function halo:setup/mode/koth

# CTF: Check if CTF is selected as the game mode and either team has reached the win condition of 10 captures
execute if block 211 33 190 minecraft:polished_blackstone_button[powered=true] run function halo:setup/mode/ctf



###SCORE COUNTING
# Reset TeamPoints to 0 then re-calculate constantly
scoreboard players reset Blue TeamPoints
scoreboard players reset Red TeamPoints
scoreboard players reset #blue TeamPoints
scoreboard players reset #red TeamPoints
scoreboard players reset @e[type=minecraft:player,team=Blue] TeamPoints
scoreboard players reset @e[type=minecraft:player,team=Red] TeamPoints

# Sum PlayerKills points for all Blue team players then update TeamPoints dummy for scoreboard
# scoreboard players operation Blue TeamPoints += @e[team=Blue] PlayerKills

# Sum PlayerKills points for all Blue team players then update TeamPoints for the fake player #blue for win condition logic in ###WINCONDITION below
scoreboard players operation #blue TeamPoints += @e[team=Blue] PlayerKills

# Sum PlayerKills points for all Red team players then update TeamPoints dummy for scoreboard
# scoreboard players operation Red TeamPoints += @e[team=Red] PlayerKills

# Sum PlayerKills points for all Red team players then update TeamPoints for the fake player #red for win condition logic in ###WINCONDITION below
scoreboard players operation #red TeamPoints += @e[team=Red] PlayerKills

# Summon ligntning when player dies
execute if entity @a[scores={deathcount=1..}] run summon minecraft:lightning_bolt 128 97 197
execute as @a[scores={deathcount=1..}] at @s run scoreboard players reset @s deathcount


###RESPAWN
# Red team respawn
execute as @a at @s if entity @s[scores={respawn=2},x=119,y=17,z=78, distance=..2] run function halo:setup/respawn/gear

# Blue team respawn
execute as @a at @s if entity @s[scores={respawn=2},x=117,y=18,z=286, distance=..2] run function halo:setup/respawn/gear


###WIN CONDITION

# execute if score #blue TeamPoints matches 50.. run function halo:setup/blue/bluewin
execute if score #blue TeamPoints matches 10.. run function halo:setup/blue/bluewindelay
execute if score #red TeamPoints matches 10.. run function halo:setup/red/redwindelay

# update armor stand scores
scoreboard players operation Blue TeamPoints = #blue TeamPoints
scoreboard players operation Red TeamPoints = #red TeamPoints
