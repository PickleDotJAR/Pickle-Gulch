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

#### Called by tick.mcfunction

# Set tean armor stand score =  team score to be used as constant score value for win phase
scoreboard players operation Blue TeamPoints = #blue TeamPoints
scoreboard players operation Red TeamPoints = #red TeamPoints

# Announce winner
title @e[type=minecraft:player] title {"text":"BLUE TEAM WINS!!","color":"blue"}

# Say scores in chat before reset
tellraw @a ["",{"text":"BLUE TEAM WINS!!: ", "color": "blue"}]
tellraw @a ["",{"text":"Blue Team Score is: ", "color": "blue"},{"score":{"name":"Blue","objective":"TeamPoints"}, "color": "blue"}]
tellraw @a ["",{"text":"Red Team Score is: ", "color": "red"},{"score":{"name":"Red","objective":"TeamPoints"}, "color": "red"}]

# Reset team scores to prevent spam
# remove objectives, reset scores
scoreboard objectives remove TeamPoints
scoreboard objectives remove PlayerKills
scoreboard objectives remove ReadyUp

# reset all players scoreboards
scoreboard players reset *
scoreboard players reset #readycount

# Setblock end game podium structure block
#silver
setblock 117 65 190 structure_block[mode=load]{name:"pelican_silver",author:"Swarmee",posX:-17,posY:-9,posZ:-10,sizeX:18,sizeY:13,sizeZ:18,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

#gold
setblock 119 65 190 structure_block[mode=load]{name:"pelican_gold",author:"Swarmee",posX:15,posY:-8,posZ:-8,sizeX:18,sizeY:13,sizeZ:18,rotation:"CLOCKWISE_180",mirror:"LEFT_RIGHT",mode:"LOAD",ignoreEntities:0b} replace

setblock 118 65 190 minecraft:redstone_block
setblock 118 65 190 minecraft:air
# setblock 118 28 190 minecraft:structure_block{mirror: "NONE", powered: 0b, z: 197, x: 127, seed: 0L, integrity: 1.0f, sizeY: 44, posZ: -9, sizeZ: 21, showboundingbox: 0b, showair: 0b, posY: 2, posX: -11, name: "minecraft:burny_manders", rotation: "NONE", mode: "LOAD", id: "minecraft:structure_block", y: 64, sizeX: 24, author: "Swarmee", metadata: "", ignoreEntities: 1b}

# power the structure block to insert the end game podium
# setblock 127 63 197 minecraft:observer[facing=down]
# setblock 127 62 197 minecraft:observer[facing=up]

# schedule bluewin.mcfunction for 15 ticks after the game winning kill since a schedule can't be done in tick.mcfunction
schedule function halo:setup/blue/bluewin 15
