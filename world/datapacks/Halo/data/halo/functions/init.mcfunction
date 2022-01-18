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

# Set worldspawn in lobby facing west
setworldspawn 233 39 189 90
spawnpoint @a 233 39 189 90

# Set gamemode to adventure for all players
gamemode adventure @e[type=minecraft:player]

# Set gamerules
gamerule spawnRadius 1
gamerule doWeatherCycle false
gamerule doImmediateRespawn true
gamerule doMobSpawning false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false
gamerule keepInventory false
gamerule doFireTick false

title @a times 5 10 5

# Set time
time set noon

# Kill all item and mob entities
kill @e[type=minecraft:cod]
kill @e[type=minecraft:wither_skeleton]
kill @e[type=minecraft:zombie]
kill @e[type=minecraft:wandering_trader]
kill @e[type=minecraft:item]

# Clear all effects from players
effect clear @a

# Clear player inventory
clear @a

# Reset XP levels
xp set @a 0 levels
xp set @a 0 points

# TP all players to lobby
tp @e[type=minecraft:player] 233 39 189 90 0

# Summon Area of Effect cloud in the lobby with regen & saturation
summon area_effect_cloud 219 33 189 {Particle:"block air",ReapplicationDelay:20,Radius:15f,Duration:199980,Effects:[{Id:10b,Amplifier:5b,Duration:100,ShowParticles:0b},{Id:23b,Amplifier:5b,Duration:100,ShowParticles:0b}]}
summon area_effect_cloud 233 39 188 {Particle:"block air",ReapplicationDelay:20,Radius:15f,Duration:199980,Effects:[{Id:10b,Amplifier:5b,Duration:100,ShowParticles:0b},{Id:23b,Amplifier:5b,Duration:100,ShowParticles:0b}]}
summon minecraft:armor_stand 223 26 189 {NoGravity:1b,Invulnerable:1b,Invisible:0b,CustomName:'{"text":"lobby"}'}

# Remove teams
team remove Red
team remove Blue

# Remove objectives, reset scores
scoreboard objectives remove TeamPoints
scoreboard objectives remove PlayerKills
scoreboard objectives remove ReadyUp

# Reset all players scoreboards
scoreboard players reset *
scoreboard players reset #readycount

# Remove displayed scoreboards
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list

# Place team selector buttons
# Blue
setblock 213 32 193 minecraft:polished_blackstone_button[facing=east] replace

# Red
setblock 213 32 186 minecraft:polished_blackstone_button[facing=east] replace

# Welcome
tellraw @a {"text": "┅┅┅┅     Pickle Gulch     ┅┅┅┅", "color": "green"}
tellraw @a {"text": "┅┅┅┅ Halo PVP Simulator ┅┅┅┅", "color": "green"}

# Instructions
tellraw @a {"text": "Instructions to play:", "color": "light_purple"}
tellraw @a {"text": "1:┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅", "color": "light_purple"}
tellraw @a {"text": "Locate the 'Reset' button in the lobby and press it to ensure the map is ready between games", "color": "aqua"}
# future instruction to insert for additional game modes
# tellraw @a {"text": "Next, locate the game mode selector buttons for 'Deathmatch', 'King of the Hill', or 'Capture the Flag' and one person press the button to setup that gamemode"}
tellraw @a {"text": "2:┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅", "color": "light_purple"}
tellraw @a {"text": "All players split into 2 even teams, standing in the red or blue zones", "color": "aqua"}
tellraw @a {"text": "3:┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅", "color": "light_purple"}
tellraw @a {"text": "When teams are split evenly, one person from each team press the ready button on the team podium", "color": "aqua"}
tellraw @a {"text": "4:┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅", "color": "light_purple"}
tellraw @a {"text": "When both buttons have been pressed, the game will begin!", "color": "aqua"}
tellraw @a {"text": "GLHF!", "color": "light_purple"}
tellraw @a {"text": "Need more info?", "color": "green"}
tellraw @a {"text":"Visit our Github page","color":"blue","underlined":true,"clickEvent":{"action":"open_url","value":"https://github.com/PickleDotJAR/Pickle-Gulch"}}
tellraw @a {"text":"Visit our Planet Minecraft page","color":"blue","underlined":true,"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/project/pickle-gulch/"}}
# Add scoreboard to count when any player dies to summon lightning strike
scoreboard objectives add deathcount deathCount
