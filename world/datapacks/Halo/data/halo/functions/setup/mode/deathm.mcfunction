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

#### Called by tick.mcfunction

# Replace button to prevent spam
setblock 211 33 191 minecraft:polished_blackstone_button[facing=east] replace

# tellraw @a {"text": "Team Deathmatch selected!", "color": "light_purple"}
# tellraw @a {"text": "Objective: Red vs. Blue, first team to 50 total kills wins!", "color": "aqua"}

tellraw @a {"text": "No need to press this button!", "color": "yellow"}
tellraw @a {"text": "Team Deathmatch is currently the only game mode available!", "color": "yellow"}
