function loadPlayer()
    player = {}

    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.color = {1, 1, 1, 1}


    player.img = love.graphics.newImage('res/rasmus.png')
    player.spriteLeft = love.graphics.newQuad(0, 0, 32, 64, player.img:getDimensions())
    player.spriteRight = love.graphics.newQuad(0, 64, 32, 64, player.img:getDimensions())

    player.height = 64
    player.width = 32

    player.isMovingLeft = false


    player.body = love.physics.newBody(world, player.x + player.width / 2, player.y - player.height / 2, "dynamic")
    player.body:setFixedRotation(true)
    player.body:setMass(100)
    player.shape = love.physics.newRectangleShape(player.width, player.height)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.fixture:setUserData("Player")


    return player
end
