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

# Replace button to prevent spam and add redstone block to power lamp
playsound block.stone_button.click_on master @a ~ ~ ~ 1.0 1.7
setblock 213 32 193 minecraft:polished_blackstone_button[facing=east] replace
setblock 212 30 193 minecraft:redstone_block replace

# Create Blue team, assign color, disable friendlyFire
team add Blue
team modify Blue color blue
team modify Blue friendlyFire false

# Kill existing wandering traders if present
kill @e[type=minecraft:wandering_trader,name="Blue Consumables"]
kill @e[type=minecraft:wandering_trader,name="Blue Miner"]
kill @e[type=minecraft:wandering_trader,name="Shirts & Shoes"]
kill @e[type=minecraft:wandering_trader,name="Sharpies & Shields"]
kill @e[type=minecraft:wandering_trader,name="Blue Rogue"]
kill @e[type=minecraft:wandering_trader,name="Blue Wizard"]

# kill Blue armor stand for scorekeeping
kill @e[type=minecraft:armor_stand,tag=blue]

# Summon wandering traders for Blue team

# Blue Consumables - Consumables
summon minecraft:wandering_trader 122 18 278 {Rotation:[45.0f,0.0f],CustomName:"\"Blue Consumables\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Blue Consumables"] Offers.Recipes set value [{maxUses:999,buy:{id:"raw_iron",Count:1},sell:{id:"cooked_salmon",Count:3}},{maxUses:999,buy:{id:"raw_iron",Count:3},sell:{id:"golden_carrot",Count:2}},{maxUses:999,buy:{id:"raw_iron",Count:32},sell:{id:"golden_apple",Count:1}},{maxUses:999,buy:{id:"raw_iron",Count:64},sell:{id:"enchanted_golden_apple",Count:1}}]

# Blue Miner - Pickaxe
summon minecraft:wandering_trader 209 9 325 {Rotation:[90.0f,0.0f],CustomName:"\"Blue Miner\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Blue Miner"] Offers.Recipes set value [{maxUses:999,buy:{id:'minecraft:cod',Count:3},sell:{id:"minecraft:stone_pickaxe",Count:1,tag:{CanDestroy:["minecraft:deepslate_iron_ore"],Unbreakable:1b}}}]

# Shirts & Shoes - Sells leather, gold, and iron boots and chestplates
summon minecraft:wandering_trader 102 7 197 {Rotation:[-90.0f,0.0f],CustomName:"\"Shirts & Shoes\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Shirts & Shoes"] Offers.Recipes set value [{maxUses:999,buy:{id:"minecraft:cod",Count:1b},sell:{id:"minecraft:leather_boots",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:1s}]}}},{maxUses:999,buy:{id:"rotten_flesh",Count:4},sell:{id:"golden_boots",Count:1}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:3},sell:{id:"iron_boots",Count:1}},{maxUses:999,buy:{id:"minecraft:cod",Count:1},sell:{id:"minecraft:leather_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:1s}]}}},{maxUses:999,buy:{id:"rotten_flesh",Count:10},sell:{id:"golden_chestplate",Count:1}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:8},sell:{id:"iron_chestplate",Count:1}}]

# Sharpies & Shields - Sells melee weapons & shields
summon minecraft:wandering_trader 189 9 174 {Rotation:[90.0f,0.0f],CustomName:"\"Sharpies & Shields\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Sharpies & Shields"] Offers.Recipes set value [{maxUses:999,buy:{id:"rotten_flesh",Count:4},sell:{id:"iron_sword",Count:1,tag:{RepairCost:10,Damage:125}}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:4},sell:{id:"diamond_sword",Count:1,tag:{RepairCost:25,Damage:1487}}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:6},sell:{id:"iron_axe",Count:1,tag:{RepairCost:25,Damage:243}}},{maxUses:999,buy:{id:"wither_skeleton_skull",Count:64},sell:{id:"shield",Count:1,tag:{RepairCost:25,Damage:326}}}]

#Blue Rogue - Tipped arrows, potions, ender pearls, fire charges
summon minecraft:wandering_trader 123 18 279 {Rotation:[45.0f,0.0f],CustomName:"\"Blue Rogue\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Blue Rogue"] Offers.Recipes set value [{maxUses:999,buy:{id:"minecraft:raw_iron",Count:3b},sell:{id:"minecraft:tipped_arrow",Count:3b,tag:{Potion:"minecraft:slowness"}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:3b},sell:{id:"minecraft:potion",Count:1,tag:{Potion:"minecraft:swiftness"}}}]

#Blue Wizard - Enchanted books
summon minecraft:wandering_trader 124 18 280 {Rotation:[45.0f,0.0f],CustomName:"\"Blue Wizard\"",Invulnerable:1,Silent:1,NoAI:1,Offers:{}}

data modify entity @e[type=wandering_trader,limit=1,name="Blue Wizard"] Offers.Recipes set value [{maxUses:999,buy:{id:'minecraft:raw_iron',Count:32b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:power",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:sharpness",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:piercing",lvl:4s},{id:"minecraft:quick_charge",lvl:3s}]}}},{maxUses:999,buy:{id:'minecraft:raw_iron',Count:64b},sell:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[{id:"minecraft:looting",lvl:3s}]}}},{maxUses:999,buy:{id:"minecraft:raw_iron",Count:1},sell:{id:"experience_bottle",Count:5}}]

# Summon Blue armor stand for scorekeeping
summon armor_stand 230 27 194 {Invulnerable:1b,Tags:["blue"],CustomName:'{"text":"Blue","color":"blue"}'}

# Add Blue armor stand to blue team
team join Blue Blue

# Set objective to count teams ready
scoreboard objectives add ReadyUp dummy "ReadyUp"

# Add 1 to ready count
scoreboard players add #readycount ReadyUp 1

# Group players on blue side of lobby onto blue team
team join Blue @e[type=minecraft:player,x=212,y=31,z=191,dx=4,dy=2,dz=4]

# Remove button so it can't be pressed again
setblock 213 32 193 air replace
