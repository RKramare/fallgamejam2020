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
    table.insert(level.platforms, createPlatform(0, 9, 150, 1, spriteGround))
    
    table.insert(level.platforms, createPlatform(0, 0, 1, 9, spriteGround))
end

function addEnemiesToLevel(level)
    table.insert(level.enemies, createEnemy(15*32, 11*32))
end