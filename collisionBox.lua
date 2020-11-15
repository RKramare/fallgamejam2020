function createCollisionBox(x, y, width, height)
    local box = {}
    scale = 2
    scaleW, scaleH = 32*scale, 32*scale

    box.body = love.physics.newBody(world, x, y)
    box.body:setGravityScale(0)
    box.shape = love.physics.newRectangleShape(width*scaleW, height*scaleH)
    box.fixture = love.physics.newFixture(box.body, box.shape)
    box.fixture:setUserData("box")

	box.width = width * scaleW
	box.height = height * scaleH
	box.x, box.y = x, y

    box.color = {1, 0.5, 0.5, 1}
    box.state = "line"

    return box
end