function loadPlayer()
    player = {}

    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.speed = 200

    player.img = love.graphics.newImage('res/purple.png')

    player.height = player.img:getHeight()
    player.width = player.img:getWidth()

    player.ground = player.y

    player.y_velocity = 0

    player.jump_height = -350
    player.gravity = -500

    player.body = love.physics.newBody(world, player.x - player.width / 2, player.y - player.height / 2, "dynamic")
    player.shape = love.physics.newRectangleShape(player.width, player.height)
    player.fixture = love.physics.newFixture(player.body, player.shape)

    return player
end
