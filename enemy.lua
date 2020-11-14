function createEnemy()
    local enemy = {}
    
    enemy.spriteHeight = 64
    enemy.spriteWidth = 32
    enemy.scale = 1

    enemy.topSpeed = 350
    enemy.acceleration = 1500

    -- Create Body
    enemy.body = love.physics.newBody(world, x, y, "dynamic")
    enemy.body:setFixedRotation(true)
    enemy.body:setMass(100)
    enemy.body:setLinearDamping(0)
    enemy.shape = love.physics.newRectangleShape(0, 5, enemy.spriteWidth*enemy.scale, (enemy.spriteHeight-5-enemy.topMargin)*enemy.scale, 0)
    enemy.fixture = love.physics.newFixture(enemy.body, enemy.shape)

    return enemy
end