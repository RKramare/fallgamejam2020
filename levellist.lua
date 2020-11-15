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
        level.info =    "Hejsan Rasmus! \n" ..
                        "Det är jag som är Anders Tegnell, statsepidemiolog vid Folkhälsomyndigheten. \n"..
                        "Jag kommer att hjälpa dig att ta dig igenom denna coronasmittade värld oskadd.\n"..
                        "Du kan använda 'a', 'd' och 'w' för att röra på dig.\n"..
                        "Tryck på 'm' för att se dessa meddelanen igen."

        level.msgHeight = 5
                        

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

        level.msgHeight = 1
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
        level.msgHeight = 1

        --Player
        level.player = loadPlayer(4, 6)
        
        --Goal
        level.goal = createGoal(102, 3)

        --Enemies
        table.insert(level.enemies, createEnemy(28, 5))
        table.insert(level.enemies, createEnemy(40, 7))
        table.insert(level.enemies, createEnemy(76, 6))


        --Platforms
        table.insert(level.platforms, createPlatform(0, 7, 9, 4, spriteGround))
        table.insert(level.platforms, createPlatform(9, 7, 18, 4, spriteAsphalt))
        table.insert(level.platforms, createPlatform(27, 6, 12, 5, spriteSidewalk))
        table.insert(level.platforms, createPlatform(39, 8, 13, 3, spriteAsphalt))
        table.insert(level.platforms, createPlatform(52, 6, 4, 5, spriteSidewalk))
        table.insert(level.platforms, createPlatform(56, 5, 8, 6, spriteSidewalk))
        table.insert(level.platforms, createPlatform(64, 7, 14, 4, spriteAsphalt))
        table.insert(level.platforms, createPlatform(68, 3, 10, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(78, 3, 7, 8, spriteSidewalk))
        table.insert(level.platforms, createPlatform(85, 4, 22, 7, spriteAsphalt))
        table.insert(level.platforms, createPlatform(107, 3, 9, 8, spriteSidewalk))



    end

    return level
end
