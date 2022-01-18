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

# Set Blue team spawnpoint to winners podium
spawnpoint @e[type=minecraft:player,team=Blue] 129 59 190 90

# Set RED team spawnpoint to losers podium
spawnpoint @e[type=minecraft:player,team=Red] 107 59 190 -90

# remove displayed scoreboards
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list

# Reset winning colors fake player scores to stop scoreboard clock and win condition logic from running
scoreboard players reset #blue PlayerKills
scoreboard players reset #blue TeamPoints

# Turn on Blue Beacon above lobby
setblock 226 47 196 air replace

# TP Blue team to winners podium and Red team to losers podium
tp @e[team=Red] 107 59 190 -90 0
tp @e[team=Blue] 129 59 190 90 0

# Clear inventory of all players
clear @a

# Announce celebration time in chat
tellraw @a {"text": "Congratulations!", "color": "light_purple"}
tellraw @a {"text": "Teams will be teleported back to the lobby in 30 seconds", "color": "gold"}

# Play win notification
execute as @a at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 0.6

# Schedule Fireworks
schedule function halo:setup/blue/bluefireworks 60
schedule function halo:setup/blue/bluefireworks 70 append
schedule function halo:setup/blue/bluefireworks 80 append
schedule function halo:setup/blue/bluefireworks 90 append

# Schedule gameover function
# schedule function halo:setup/gameover 30s

# Run win_timer function
schedule function halo:setup/timers/win_timer 1

# clear scheduled tasks
schedule clear halo:setup/lootdrop/dropship
schedule clear halo:setup/lootdrop/bonus
