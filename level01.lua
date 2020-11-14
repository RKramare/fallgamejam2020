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
    table.insert(level.platforms, createPlatform(0, 17, 150, 2, spriteGround))
    
	table.insert(level.platforms, createPlatform(8, 15, 4, 2, spriteAsphalt))
    table.insert(level.platforms, createPlatform(7, 16, 1, 1, spriteAsphalt))
    
	table.insert(level.platforms, createPlatform(15, 13, 4, 2, spriteSidewalk))
	table.insert(level.platforms, createPlatform(14, 14, 1, 1, spriteSidewalk))
end

function addEnemiesToLevel(level)
    table.insert(level.enemies, createEnemy(15*32, 11*32))
end