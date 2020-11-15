function createLevel()  
    --Setup
    require "sprite"
    require "enemy"
	spriteGround = loadSprite("res/ground1.png", 32, 32)
	spriteAsphalt = loadSprite("res/asphalt.png", 32, 32)
	spriteSidewalk = loadSprite("res/sidewalk.png", 32, 32)

    local level = {}
    level.platforms = {}
    level.enemies = {}

    addPlatformsToLevel(level)
    addEnemiesToLevel(level)

    return level
end

function addPlatformsToLevel(level)
    --Ground platform
    table.insert(level.platforms, createPlatform(0, 9, 150, 1, spriteGround))
    --Left pillar
    table.insert(level.platforms, createPlatform(0, 0, 1, 9, spriteGround))

    
    table.insert(level.platforms, createPlatform(2, 8, 1, 1, spriteSidewalk))
    table.insert(level.platforms, createPlatform(3, 7, 1, 1, spriteSidewalk))
    table.insert(level.platforms, createPlatform(4, 6, 1, 1, spriteSidewalk))
    table.insert(level.platforms, createPlatform(5, 5, 1, 1, spriteSidewalk))
    table.insert(level.platforms, createPlatform(6, 4, 1, 1, spriteSidewalk))
    
    
end

function addEnemiesToLevel(level)
    table.insert(level.enemies, createEnemy(15*32, 11*32))
end