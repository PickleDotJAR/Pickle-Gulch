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

# Replace button to prevent spam and place redstone block under lamp
playsound block.stone_button.click_on master @a ~ ~ ~ 1.0 1.7
setblock 213 32 186 minecraft:polished_blackstone_button[facing=east] replace
setblock 212 30 186 minecraft:redstone_block replace

# Create Red team, assign color, disable friendlyFire
team add Red
team modify Red color red
team modify Red friendlyFire false

# Kill existing wandering traders if present
kill @e[type=minecraft:wandering_trader,name="Red Consumables"]
kill @e[type=minecraft:wandering_trader,name="Red Miner"]
kill @e[type=minecraft:wandering_trader,name="Britches & Bonnets"]
kill @e[type=minecraft:wandering_trader,name="Artillery"]
kill @e[type=minecraft:wandering_trader,name="Red Rogue"]
kill @e[type=minecraft:wandering_trader,name="Red Wizard"]

# kill Red armor stand for scorekeeping
kill @e[type=minecraft:armor_stand,tag=red]

# Summon wandering traders for Red team

#Red Consumables - Consumables
summon minecraft:wandering_trader 114 17 86 {Rotation:[-135.0f,0.0f],CustomName:"\"Red Consumables\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Red Consumables"] Offers.Recipes set value [{maxUses:999,buy:{id:"raw_iron",Count:1},sell:{id:"cooked_salmon",Count:3}},{maxUses:999,buy:{id:"raw_iron",Count:3},sell:{id:"golden_carrot",Count:2}},{maxUses:999,buy:{id:"raw_iron",Count:32},sell:{id:"golden_apple",Count:1}},{maxUses:999,buy:{id:"raw_iron",Count:64},sell:{id:"enchanted_golden_apple",Count:1}}]

# Red Miner - Pickaxe
summon minecraft:wandering_trader 219 9 45 {Rotation:[90.0f,0.0f],CustomName:"\"Red Miner\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Red Miner"] Offers.Recipes set value [{maxUses:999,buy:{id:'minecraft:cod',Count:3},sell:{id:"minecraft:stone_pickaxe",Count:1,tag:{CanDestroy:["minecraft:deepslate_iron_ore"],Unbreakable:1b}}}]

# Britches & Bonnets - Sells leather, gold, and iron boots and chestplates
summon minecraft:wandering_trader 116 8 178 {Rotation:[0.0f,0.0f],CustomName:"\"Britches & Bonnets\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Britches & Bonnets"] Offers.Recipes set value [{maxUses:999,buy:{id:"minecraft:cod",Count:1},sell:{id:"minecraft:leather_helmet",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:1s}]}}},{maxUses:999,buy:{id:"rotten_flesh",Count:4},sell:{id:"golden_helmet",Count:1}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:3},sell:{id:"iron_helmet",Count:1}},{maxUses:999,buy:{id:"minecraft:cod",Count:1},sell:{id:"minecraft:leather_leggings",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:1s}]}}},{maxUses:999,buy:{id:"rotten_flesh",Count:6},sell:{id:"golden_leggings",Count:1}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:6},sell:{id:"iron_leggings",Count:1}}]

# Artillery - Sells ranged weapons
summon minecraft:wandering_trader 39 8 197 {Rotation:[-90.0f,0.0f] ,CustomName:"\"Artillery\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Artillery"] Offers.Recipes set value [{maxUses:999,buy:{id:'minecraft:raw_iron',Count:1},sell:{id:"minecraft:bow",Count:1b}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:1},sell:{id:"minecraft:crossbow",Count:1b}},{maxUses:999,buy:{id:"raw_iron",Count:2},sell:{id:"arrow",Count:16}}]

#Red Rogue - Tipped arrows, potions, ender pearls, fire charges
summon minecraft:wandering_trader 113 17 85 {Rotation:[-135.0f,0.0f],CustomName:"\"Red Rogue\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Red Rogue"] Offers.Recipes set value [{maxUses:999,buy:{id:"minecraft:raw_iron",Count:3b},sell:{id:"minecraft:tipped_arrow",Count:3b,tag:{Potion:"minecraft:slowness"}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:3b},sell:{id:"minecraft:potion",Count:1,tag:{Potion:"minecraft:swiftness"}}}]

#Red Wizard - Enchanted books
summon minecraft:wandering_trader 112 17 84 {Rotation:[-135.0f,0.0f],CustomName:"\"Red Wizard\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Red Wizard"] Offers.Recipes set value [{maxUses:999,buy:{id:'minecraft:raw_iron',Count:32b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:power",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:sharpness",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:piercing",lvl:4s},{id:"minecraft:quick_charge",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:looting",lvl:3s}]}}},{maxUses:999,buy:{id:"minecraft:raw_iron",Count:1},sell:{id:"experience_bottle",Count:5}}]

# Summon Red armor stand for scorekeeping
summon armor_stand 230 27 185 {Invulnerable:1b,Tags:["red"],CustomName:'{"text":"Red","color":"red"}'}

# Add Red armor stand to red team
team join Red Red

# Set objective to count teams ready
scoreboard objectives add ReadyUp dummy "ReadyUp"

# Add 1 to ready count
scoreboard players add #readycount ReadyUp 1

# Group players on red side of lobby onto red team
team join Red @e[type=minecraft:player,x=212,y=31,z=184,dx=4,dy=2,dz=4]

# Remove button so it can't be pressed again
setblock 213 32 186 air replace
