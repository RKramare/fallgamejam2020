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
    return 5
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
        level.info =    "Det är viktigt att vara försiktig när man kör runt,\n"..
                        "man vet inte vad som väntar runt hörnet."

        level.msgHeight = 2
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
        level.info =    "Nu när du kommer in till stan måste du vara ännu mer försiktig, så att du inte stöter in i någon som är sjuk.\n"..
                        "Under den rådande pandemin är det många som har fått corona,\n"..
                        "så ditt updrag är att hjälpa de sjuka genom att ge dem en dos av handsprit.\n"..
                        "Tryck på ’p’ för att skjuta handsprit.\n"

        level.msgHeight = 5

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




    elseif n == 4 then
        --Level info
        level.info =    "Ingen kan göra allt men alla kan göra något!\n"..
                        "Under den rådande pandemin är det viktigt att hjälpas åt,\n"..
                        "men kom ihåg att sprita händerna först."

        level.msgHeight = 3

        --Player
        level.player = loadPlayer(5, 6)
        
        --Goal
        level.goal = createGoal(82, 6)

        --Enemies
        table.insert(level.enemies, createEnemy(76, 6))
        table.insert(level.enemies, createEnemy(57, 4))
        table.insert(level.enemies, createEnemy(55, 7))
        table.insert(level.enemies, createEnemy(42, 3))
        table.insert(level.enemies, createEnemy(26, 7))


        --Platforms
        table.insert(level.platforms, createPlatform(0, 7, 13, 4, spriteSidewalk))
        table.insert(level.platforms, createPlatform(13, 8, 24, 3, spriteAsphalt))
        table.insert(level.platforms, createPlatform(37, 4, 8, 7, spriteSidewalk))
        table.insert(level.platforms, createPlatform(45, 8, 12, 3, spriteAsphalt))
        table.insert(level.platforms, createPlatform(48, 5, 11, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(52, 2, 6, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(57, 8, 4, 3, spriteSidewalk))
        table.insert(level.platforms, createPlatform(58, 1, 2, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(61, 3, 7, 8, spriteSidewalk))
        table.insert(level.platforms, createPlatform(68, 2, 7, 2, spriteSidewalk))
        table.insert(level.platforms, createPlatform(68, 7, 17, 4, spriteAsphalt))



    elseif n == 5 then
        --Level info
        level.info =    "Antalet smittade har ökat! Hjälp till att plana ut kurvan"

        level.msgHeight = 1

        --Player
        level.player = loadPlayer(6, 4)
        
        --Goal
        level.goal = createGoal(118, 2)

        --Enemies
        table.insert(level.enemies, createEnemy(33, 8))
        table.insert(level.enemies, createEnemy(36, 8))
        table.insert(level.enemies, createEnemy(39, 8))
        table.insert(level.enemies, createEnemy(42, 8))
        table.insert(level.enemies, createEnemy(55, 1))
        table.insert(level.enemies, createEnemy(68, 6))
        table.insert(level.enemies, createEnemy(80, 7))


        --Platforms
        table.insert(level.platforms, createPlatform(0, 6, 16, 5, spriteSidewalk))
        table.insert(level.platforms, createPlatform(16, 5, 8, 6, spriteSidewalk))
        table.insert(level.platforms, createPlatform(24, 6, 6, 5, spriteSidewalk))
        table.insert(level.platforms, createPlatform(30, 8, 1, 2, spriteAsphalt))
        table.insert(level.platforms, createPlatform(31, 9, 13, 2, spriteAsphalt))
        table.insert(level.platforms, createPlatform(44, 6, 4, 5, spriteSidewalk))
        table.insert(level.platforms, createPlatform(48, 7, 6, 4, spriteSidewalk))
        table.insert(level.platforms, createPlatform(54, 9, 10, 2, spriteAsphalt))
        table.insert(level.platforms, createPlatform(53, 0, 1, 3, spriteSidewalk))
        table.insert(level.platforms, createPlatform(54, 2, 2, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(59, 6, 1, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(60, 4, 1, 2, spriteSidewalk))
        table.insert(level.platforms, createPlatform(61, 3, 2, 1, spriteAsphalt))
        table.insert(level.platforms, createPlatform(63, 0, 1, 4, spriteSidewalk))
        table.insert(level.platforms, createPlatform(64, 8, 3, 3, spriteSidewalk))
        table.insert(level.platforms, createPlatform(67, 7, 3, 4, spriteSidewalk))
        table.insert(level.platforms, createPlatform(70, 5, 3, 6, spriteSidewalk))
        table.insert(level.platforms, createPlatform(73, 3, 5, 8, spriteSidewalk))
        table.insert(level.platforms, createPlatform(78, 3, 5, 2, spriteSidewalk))
        table.insert(level.platforms, createPlatform(78, 8, 5, 3, spriteAsphalt))
        table.insert(level.platforms, createPlatform(90, 9, 4, 2, spriteAsphalt))
        table.insert(level.platforms, createPlatform(90, 2, 5, 1, spriteSidewalk))
        table.insert(level.platforms, createPlatform(94, 7, 3, 4, spriteSidewalk))
        table.insert(level.platforms, createPlatform(97, 5, 2, 6, spriteSidewalk))
        table.insert(level.platforms, createPlatform(99, 3, 13, 8, spriteSidewalk))
        table.insert(level.platforms, createPlatform(116, 3, 5, 1, spriteAsphalt))



    end

    if level.enemies ~= nil then
        level.infectedCount = #level.enemies
    else
        level.infectedCount = 0
    end
    level.curedCount = 0
    return level
end
