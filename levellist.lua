function getLevel(n)
    --Setup
    require "sprite"
    require "player"
    require "enemy"
    require "goal"
	spriteGround = loadSprite("res/ground1.png", 32, 32)
	spriteAsphalt = loadSprite("res/asphalt.png", 32, 32)
    spriteSidewalk = loadSprite("res/sidewalk.png", 32, 32)
    
    level = createLevel(n)

    return level
end 

function createLevel(n)
    --Init
    local level = {}
    level.number = n
    level.platforms = {}
    level.enemies = {}

    
    --Level specific
    if n == 1 then
        --Player
        level.player = loadPlayer(3, 8)
        
        --Goal
        level.goal = createGoal(10, 8)


        --Platforms
        table.insert(level.platforms, createPlatform(0, 9, 150, 1, spriteGround))
        table.insert(level.platforms, createPlatform(0, 0, 1, 9, spriteGround))



    elseif n == 2 then
        --Player
        level.player = loadPlayer(3, 4)
        
        --Goal
        level.goal = createGoal(25, 8)

        --Enemies
        table.insert(level.enemies, createEnemy(8, 8))


        --Platforms
        table.insert(level.platforms, createPlatform(0, 9, 150, 1, spriteGround))
        table.insert(level.platforms, createPlatform(0, 0, 1, 9, spriteGround))
        table.insert(level.platforms, createPlatform(2, 8, 1, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(3, 7, 1, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(4, 6, 1, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(5, 5, 1, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(6, 4, 1, 1, spriteSidewalk))



    elseif n == 3 then
        --Player
        level.player = loadPlayer(8, 2)
        
        --Goal
        level.goal = createGoal(15, 6)

        --Enemies
        table.insert(level.enemies, createEnemy(4, 8))
        table.insert(level.enemies, createEnemy(6, 8))
        table.insert(level.enemies, createEnemy(10, 8))
        table.insert(level.enemies, createEnemy(20, 8))


        --Platforms
        table.insert(level.platforms, createPlatform(0, 9, 150, 1, spriteAsphalt))
        table.insert(level.platforms, createPlatform(0, 0, 1, 9, spriteSidewalk))


    end

    return level
end
