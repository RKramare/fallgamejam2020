function loadPlayer(x, y)
    player = {}

    player.spriteHeight = 64
    player.spriteWidth = 32
    player.scale = 1

    player.topSpeed = 250
    player.stillToloerance = 0.2
    player.acceleration = 1500
    player.jumingPower = 300
    player.maxLean = 0.2

    -- Create Body
    player.body = love.physics.newBody(world, x, y, "dynamic")
    player.body:setFixedRotation(true)
    player.body:setMass(100)
    player.body:setLinearDamping(0)
    player.shape = love.physics.newRectangleShape(0, -5, player.spriteWidth*player.scale, (player.spriteHeight-5)*player.scale, 0)
    player.fixture = love.physics.newFixture(player.body, player.shape)

    -- Create Wheel
    player.wheelShape = love.physics.newCircleShape(0, 20, 8)
    player.wheelFixture = love.physics.newFixture(player.body, player.wheelShape)

    -- Set up sprite
    require "sprite"
    player.sprite = loadSprite('res/rasmus.png', player.spriteWidth, player.spriteHeight)
    player.spriteStill = sprite.get(1, 0)
    player.spriteRight = sprite.get(0, 0)
    player.spriteLeft = sprite.get(0, 1)

    function player.update(dt)
        local k = love.keyboard
        velX, velY = player.body:getLinearVelocity()
        if love.keyboard.isDown("a") and velX > -player.topSpeed then
            --player.body:setLinearVelocity(-100,velY)
            player.body:applyForce(-player.acceleration,0)
        end
        if love.keyboard.isDown("d") and velX < player.topSpeed then
            --player.body:setLinearVelocity(100,velY)
            player.body:applyForce(player.acceleration,0)
        end    
    
        if love.keyboard.isDown("w") then
            contacts = player.body:getContacts()
            
            for i,contact in ipairs(contacts) do
                nx, ny = contact:getNormal()
                if contact:isTouching() and ny <= -1+player.maxLean then
                    player.body:applyLinearImpulse(0,-player.jumingPower)
                    break
                end
            end
        end

        player.body:setAngle(velX/player.topSpeed*player.maxLean)

    end

    function player.draw()
        love.graphics.setColor(1,1,1,1)
        posX, posY = player.body:getWorldPoints(player.shape:getPoints())
	    velX, velY = player.body:getLinearVelocity()
	    if velX > player.topSpeed*player.stillToloerance then
		    love.graphics.draw(player.sprite.img, player.spriteRight, posX, posY, player.body:getAngle(), player.scale, player.scale, 0, 0)
	    elseif velX < -player.topSpeed*player.stillToloerance then
		    love.graphics.draw(player.sprite.img, player.spriteLeft, posX, posY, player.body:getAngle(), player.scale, player.scale, 0, 0)
	    else
		    love.graphics.draw(player.sprite.img, player.spriteStill, posX, posY, player.body:getAngle(), player.scale, player.scale, 0)
        end
        --love.graphics.polygon("line", player.body:getWorldPoints(player.shape:getPoints()))
        cx, cy = player.body:getWorldPoints(player.wheelShape:getPoint())
        --love.graphics.circle("line", cx, cy, player.wheelShape:getRadius())
    end


    return player
end
