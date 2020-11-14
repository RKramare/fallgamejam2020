function createBox(x, y, width, height)
    box = {}
    box.state = "line"
	box.width = 32 * width
	box.height = 32 * height
	box.x = x
    box.y = y

    box.color = {1, 0.5, 0.5, 1}

    box.body = love.physics.newBody(world, box.x - box.width / 2, box.y - box.height / 2)
    box.shape = love.physics.newRectangleShape(box.width, box.height)
    box.fixture = love.physics.newFixture(box.body, box.shape)
    box.fixture:setUserData("box")

    return box
end