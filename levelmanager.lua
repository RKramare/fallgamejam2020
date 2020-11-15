function createLevelManager()
    requiers "level01"
    local levelManager = {}
    levelManager.levels = {}

    table.insert(levelManager.levels, createLevel())

    return levelManager
end
