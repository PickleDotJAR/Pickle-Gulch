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

# Change respawn to worldspawn
# Set Blue team spawnpoint to worldspawn
spawnpoint @e[type=minecraft:player,team=Blue] 233 39 189 90

# Set RED team spawnpoint to worldspawn
spawnpoint @e[type=minecraft:player,team=Red] 233 39 189 90

# Call reset.mcfunction
schedule function halo:setup/reset 1

# TP players back to lobby
tp @e[type=minecraft:player] 233 39 189 90 0
