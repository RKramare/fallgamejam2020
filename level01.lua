function createLevel()  
    local level = {}
    gridX, gridY = 32, 32
    width =  love.graphics.getWidth() * gridX
    height = love.graphics.getHeight() * gridY

    require "sprite"
	spriteGround = loadSprite("res/ground1.png", 32, 32)
    level.platforms = {}
	table.insert(level.platforms, createPlatform(0, 5*32, 3, 3, spriteGround))
	table.insert(level.platforms, createPlatform(4*32, 5*32, 1, 1, spriteGround))
	table.insert(level.platforms, createPlatform(6*32, 5*32, 1, 3, spriteGround))
	table.insert(level.platforms, createPlatform(8*32, 5*32, 3, 1, spriteGround))


    function level.draw()
        for row=1, height do
            love.graphics.line(0, row, 0, height)
        end
        for col=1, width do
            love.graphics.line(col, 0, width, 0)
        end
    end

    return level
end