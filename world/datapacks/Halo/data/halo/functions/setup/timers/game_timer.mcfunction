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

# Called by tick.mcfunction

# Reset game_timer for next game
scoreboard players reset #gametimer

# Create timer scoreboard to start game timer used by lootdrop/bonus.mcfunction
scoreboard objectives add game_timer dummy

# Set score for fake player to 1 to initiate timer
scoreboard players set #gametimer game_timer 1
