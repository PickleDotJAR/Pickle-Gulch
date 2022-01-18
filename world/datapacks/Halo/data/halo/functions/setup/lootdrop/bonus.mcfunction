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

#### Called by bonus.mcfunction

### Create dropships

execute at @a run playsound entity.illusioner.prepare_blindness master @a

##Blue Lootdrop
# summon structure block to generate the pelican build above the base
setblock 117 54 286 structure_block{name:"pelican",author:"Swarmee",posX:-10,posY:-6,posZ:-5,sizeX:19,sizeY:6,sizeZ:19,rotation:"NONE",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

# summon redstone block to activate the structure block then delete it as well as the structure block
setblock 117 55 286 minecraft:redstone_block
setblock 117 55 286 minecraft:air replace
setblock 117 54 286 air replace

##Red Lootdrop
# summon structure block to generate the pelican build above the base
setblock 120 54 78 structure_block{name:"pelican",author:"Swarmee",posX:10,posY:-6,posZ:5,sizeX:19,sizeY:6,sizeZ:19,rotation:"CLOCKWISE_180",mirror:"NONE",mode:"LOAD",ignoreEntities:0b} replace

# summon redstone block to activate the structure block then delete it as well as the structure block
setblock 120 55 78 minecraft:redstone_block
setblock 120 55 78 minecraft:air replace
setblock 120 54 78 air replace

# Announce actual drop event
tellraw @a {"text":"Reinforcements have arrived!","color":"gold","bold":true,"underlined":true}

# Give both teams a loot Drop
summon item 116.9 48 285.75 {Glowing:1b,Item:{id:"minecraft:raw_iron",Count:32b}}
summon item 120.5 48 79.2 {Glowing:1b,Item:{id:"minecraft:raw_iron",Count:32b}}
# schedule next loot drop for 5 minutes
schedule function halo:setup/lootdrop/dropship 290s
schedule function halo:setup/lootdrop/dropship_remove 10s
