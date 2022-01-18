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

# Notify players of inbound dropship/lootdrop
tellraw @a {"text":"Drop ship reinforcements incoming at your base! LOOK UP!","color":"green","bold":true,"underlined":true}
execute at @a run playsound block.note_block.bit master @a

# schedule bonus.mcfunction to drop loot at bases
# schedule function halo:setup/lootdrop/bonus 1s

#create scoreboard timer for chat messages to countdown ship arrival
scoreboard objectives add ship_timer dummy

#set score to 10 seconds
scoreboard players set #shiptimer ship_timer 143
