
function loadBullet(rightDirection, x, y)
    bullet = {}
    if rightDirection then
        sign = 1
    else
        sign = -1
    end

    -- Create Body
    bullet.body = love.physics.newBody(world, x + 20*sign, y, "dynamic")
    bullet.body:setFixedRotation(true)
    bullet.body:setMass(10)
    bullet.body:setLinearDamping(0)
    bullet.body:setBullet(true)

    -- Create Shape
    bullet.shape = love.physics.newCircleShape(0, 0, 5)
    bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape)

    bullet.body:applyLinearImpulse(100 * sign, -10)


    function bullet.draw()
        cx, cy = bullet.body:getWorldPoints(bullet.shape:getPoint())
        love.graphics.circle("line", cx, cy, bullet.shape:getRadius())
    end

    return bullet
end