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

function getLevelCount()
    return 3
end

function createLevel(n)
    --Init
    local level = {}
    level.number = n
    level.platforms = {}
    level.enemies = {}

    
    --Level specific
    if n == 1 then
        --Level info
        level.info = "Test bana 1"

        --Player
        level.player = loadPlayer(13, 5)
        
        --Goal
        level.goal = createGoal(79, 2)


        --Platforms
        table.insert(level.platforms, createPlatform(0, 3, 11, 8, spriteGround))
        table.insert(level.platforms, createPlatform(11, 6, 17, 5, spriteGround))
        table.insert(level.platforms, createPlatform(28, 5, 8, 6, spriteGround))
        table.insert(level.platforms, createPlatform(36, 6, 33, 5, spriteGround))
        table.insert(level.platforms, createPlatform(48, 4, 2, 2, spriteGround))
        table.insert(level.platforms, createPlatform(50, 5, 7, 1, spriteGround))
        table.insert(level.platforms, createPlatform(69, 5, 4, 6, spriteGround))
        table.insert(level.platforms, createPlatform(73, 4, 3, 7, spriteGround))
        table.insert(level.platforms, createPlatform(76, 3, 9, 8, spriteGround))
        table.insert(level.platforms, createPlatform(85, 0, 11, 11, spriteGround))



    elseif n == 2 then
        --Level info
        level.info = "Säg det här på bana 2"

        --Player
        level.player = loadPlayer(11, 5)
        
        --Goal
        level.goal = createGoal(85, 4)

        --Platforms
        table.insert(level.platforms, createPlatform(0, 0, 9, 11, spriteGround))
        table.insert(level.platforms, createPlatform(9, 6, 13, 5, spriteGround))
        table.insert(level.platforms, createPlatform(22, 7, 9, 4, spriteGround))
        table.insert(level.platforms, createPlatform(34, 7, 6, 1, spriteGround))
        table.insert(level.platforms, createPlatform(44, 7, 9, 4, spriteGround))
        table.insert(level.platforms, createPlatform(53, 6, 8, 5, spriteGround))
        table.insert(level.platforms, createPlatform(61, 7, 21, 4, spriteGround))
        table.insert(level.platforms, createPlatform(63, 4, 9, 1, spriteGround))
        table.insert(level.platforms, createPlatform(82, 5, 7, 6, spriteGround))




    elseif n == 3 then
        --Level info
        level.info = "Fler text objekt"

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
