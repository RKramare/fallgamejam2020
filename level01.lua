function createLevel()  
    local level = {}
    gridX, gridY = 32, 32
    width =  love.graphics.getWidth()
    height = love.graphics.getHeight()

    require "sprite"
	spriteGround = loadSprite("res/ground1.png", 32, 32)
	spriteAsphalt = loadSprite("res/asphalt.png", 32, 32)
	spriteSidewalk = loadSprite("res/sidewalk.png", 32, 32)
    level.platforms = {}
	table.insert(level.platforms, createPlatform(0, 17, 50, 2, spriteGround))
	table.insert(level.platforms, createPlatform(8, 15, 4, 2, spriteAsphalt))
	table.insert(level.platforms, createPlatform(7, 16, 1, 1, spriteAsphalt))
	table.insert(level.platforms, createPlatform(15, 13, 4, 2, spriteSidewalk))
	table.insert(level.platforms, createPlatform(14, 14, 1, 1, spriteSidewalk))


    function level.draw()
        for col=1, width/gridX, gridX do
            love.graphics.line(col, 0, col, height)
        end
        for row=1, height/gridY, gridY do
            love.graphics.line(0, row, width, row)
        end
    end

    return level
end