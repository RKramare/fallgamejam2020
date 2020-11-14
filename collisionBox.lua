function createCollisionBox(x, y, width, height)
    box = {}
    scaleW, scaleH = 32, 32

    box.body = love.physics.newBody(world, x, y)
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