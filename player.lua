function loadPlayer()
    player = {}

    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.color = {1, 1, 1, 1}

    require "sprite"
    sprite = loadSprite('res/rasmus.png', 32, 64)
    player.img = sprite.img
    player.spriteStill = sprite.get(1, 0)
    player.spriteRight = sprite.get(0, 0)
    player.spriteLeft = sprite.get(0, 1)

    player.height = 64
    player.width = 32

    player.isMovingLeft = false


    player.body = love.physics.newBody(world, player.x + player.width / 2, player.y - player.height / 2, "dynamic")
    player.body:setFixedRotation(true)
    player.body:setMass(100)
    player.body:setLinearDamping(0)
    player.shape = love.physics.newRectangleShape(player.width, player.height)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.fixture:setUserData("Player")


    return player
end
