
function loadBullet(rightDirection, x, y)
    local bullet = {}
    bullet.name = -1
    if rightDirection then
        sign = 1
    else
        sign = -1
    end

    -- Create Body
    bullet.body = love.physics.newBody(world, x + 30*sign, y - 20, "dynamic")
    bullet.body:setFixedRotation(true)
    bullet.body:setMass(100)
    bullet.body:setLinearDamping(0)
    bullet.body:setBullet(true)

    -- Create Shape
    bullet.shape = love.physics.newCircleShape(0, 0, 5)
    bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape)
    bullet.fixture:setFilterData( 1, 1, -1 )

    bullet.body:applyLinearImpulse(100 * sign, -10)

    function bullet.update(dt)
        contacts = bullet.body:getContacts()
        for i,contact in ipairs(contacts) do
            if contact:isTouching() and contact:isEnabled() then
                fixA, fixB = contact:getFixtures()
                if fixA:getBody():getUserData() ~= nil and fixA:getBody():getUserData().isHittable == true then
                    fixA:getBody():getUserData().hit()
                end
                if fixB:getBody():getUserData() ~= nil and fixB:getBody():getUserData().isHittable == true then
                    fixB:getBody():getUserData().hit()
                end
                bullet.body:destroy()
                return true
            end
        end
        return false
    end

    function bullet.draw()
        love.graphics.setColor(1,1,1,1)
        cx, cy = bullet.body:getWorldPoints(bullet.shape:getPoint())
        love.graphics.circle("line", cx, cy, bullet.shape:getRadius())
    end

    return bullet
end