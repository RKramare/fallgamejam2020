function createLevelManager()
    require "levellist"
    local levelManager = {}
    levelManager.currentLevelNumber = 1
    levelManager.currentLevel = getLevel(1)
    levelManager.maxLevels = 3

    function levelManager.startLevel(number)
        return getLevel(number)
    end

    function levelManager.nextLevel()
        if levelManager.currentLevelNumber == levelManager.maxLevels then
            levelManager.currentLevelNumber = 1
        else
            levelManager.currentLevelNumber = levelManager.currentLevelNumber + 1
        end
        return levelManager.startLevel(levelManager.currentLevelNumber)
    end

    function levelManager.previousLevel()
        if levelManager.currentLevelNumber == 1 then
            levelManager.currentLevelNumber = levelManager.maxLevels
        else
            levelManager.currentLevelNumber = levelManager.currentLevelNumber - 1
        end
        return levelManager.startLevel(levelManager.currentLevelNumber)
    end
    return levelManager
end
