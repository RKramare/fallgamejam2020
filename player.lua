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

    return player
end
