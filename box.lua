function createBox()
    box = {}
    box.state = "line"
	box.width = 32
	box.height = 32
	box.x = love.graphics.getWidth() / 2
    box.y = love.graphics.getHeight() / 2 - 32 * 3

    return box
end