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

# Reset readycount for next game
scoreboard players reset #readycount

# Prepare teams to start game

# Create objective to track player kills (only tracks opposing team kills since friendly fire will be off)
scoreboard objectives add PlayerKills playerKillCount

# Create dummy objective to hold sum of player kills per team
scoreboard objectives add TeamPoints dummy

# Set scores to 0
scoreboard players set * PlayerKills 0
scoreboard players set * TeamPoints 0

# Enables the display of team kills on the side bar (team points) and each players individual kill count on the tab menu
scoreboard objectives setdisplay sidebar TeamPoints
scoreboard objectives setdisplay list PlayerKills

# Set Blue team spawnpoint to Blue base
spawnpoint @e[type=minecraft:player,team=Blue] 117 18 286 180

# Set Red team spawnpoint to Red base
spawnpoint @e[type=minecraft:player,team=Red] 119 17 78 0

# Create scoreboard to track dead players and give them wooden weapons on respawn
scoreboard objectives add respawn minecraft.custom:minecraft.time_since_death
