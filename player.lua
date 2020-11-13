function loadPlayer()
    player = {}

    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2

    player.speed = 200

    player.img = love.graphics.newImage('res/purple.png')

    player.ground = player.y

    player.y_velocity = 0

    player.jump_height = -300
    player.gravity = -500

    return player
end
