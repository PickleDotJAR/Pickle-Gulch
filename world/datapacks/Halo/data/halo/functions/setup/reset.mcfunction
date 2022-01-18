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

#  See Copyright.txt for copyright, licensing, & usage information  #

#### Called by tick.mcfunction & gameover.mcfunction

# Replace button to prevent spam
setblock 211 33 188 minecraft:polished_blackstone_button[facing=east] replace

# Set gamemode to adventure for all players
gamemode adventure @e[type=minecraft:player]

# Place team selector buttons & remove redstone blocks
# Blue
setblock 213 32 193 minecraft:polished_blackstone_button[facing=east] replace
setblock 212 30 193 minecraft:air replace

# Red
setblock 213 32 186 minecraft:polished_blackstone_button[facing=east] replace
setblock 212 30 186 minecraft:air replace

# Confirm button was pressed
tellraw @a {"text": "┅┅┅┅ Map reset successfully! ┅┅┅┅", "color": "gold"}

# Clear barrels at bases
setblock 117 17 68 air replace
setblock 122 17 68 air replace
setblock 115 17 69 air replace
setblock 124 17 69 air replace
setblock 119 18 296 air replace
setblock 114 18 296 air replace
setblock 121 18 295 air replace
setblock 112 18 295 air replace

# Replace barrels at bases
setblock 117 17 68 barrel[facing=south] replace
setblock 122 17 68 barrel[facing=south] replace
setblock 115 17 69 barrel[facing=east] replace
setblock 124 17 69 barrel[facing=west] replace
setblock 119 18 296 barrel[facing=north] replace
setblock 114 18 296 barrel[facing=north] replace
setblock 121 18 295 barrel[facing=west] replace
setblock 112 18 295 barrel[facing=east] replace

# kill all item and mob entities
kill @e[type=minecraft:cod]
kill @e[type=minecraft:wither_skeleton]
kill @e[type=minecraft:zombie]
kill @e[type=minecraft:wandering_trader]
kill @e[type=minecraft:item]
kill @e[type=minecraft:armor_stand]
kill @e[type=minecraft:drowned]

# Clear all effects from players
effect clear @a

# Clear player inventories
clear @a

# Reset XP levels
xp set @a 0 levels
xp set @a 0 points

# Set spawnpoint to lobby
spawnpoint @a 233 39 189 90

# set gamemode to adventure for all players
gamemode adventure @e[type=minecraft:player]

# remove teams
team remove Red
team remove Blue

# remove objectives, reset scores
scoreboard objectives remove TeamPoints
scoreboard objectives remove PlayerKills
scoreboard objectives remove ReadyUp
scoreboard objectives remove respawn
scoreboard objectives remove game_timer
scoreboard objectives remove deathcount

# reset all players scoreboards
scoreboard players reset *
scoreboard players reset #readycount
scoreboard players reset #gametimer
scoreboard players reset deathCount

# remove displayed scoreboards
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list

# Turn off beacons above lobby
setblock 226 47 196 redstone_block replace
setblock 226 47 183 redstone_block replace

# clear scheduled tasks
schedule clear halo:setup/lootdrop/dropship
schedule clear halo:setup/lootdrop/bonus
schedule clear halo:setup/ctf/ctf_tick

# tp players to lobby
kill @e[type=minecraft:player]

fill 141 69 200 95 55 179 air replace
