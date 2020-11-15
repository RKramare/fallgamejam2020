function loadPlayer(x, y)
    require "bullet"
    local player = {}

    player.spriteHeight = 64
    player.spriteWidth = 32
    player.scale = 2
    player.topMargin = 10
    player.sideMargin = 2

    player.lastDirectionRight = true
    player.facingRight = true
    player.topSpeed = 800
    player.stillToloerance = 0.2
    player.acceleration = 8000
    player.jumingPower = 2500
    player.maxLean = 0.2

    -- Create Body
    player.body = love.physics.newBody(world, x*64 - (player.spriteWidth/2)*player.scale, y*64 - (player.spriteHeight/2)*player.scale, "dynamic")
    player.body:setFixedRotation(true)
    player.body:setMass(100)
    player.body:setLinearDamping(0)
    player.shape = love.physics.newRectangleShape(0, 5, (player.spriteWidth-player.sideMargin*2)*player.scale, (player.spriteHeight-5-player.topMargin)*player.scale, 0)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.fixture:setFilterData( 1, 1, -1 )

    -- Create Wheel
    player.wheelShape = love.physics.newCircleShape(0, 20*player.scale, 12*player.scale)
    player.wheelFixture = love.physics.newFixture(player.body, player.wheelShape)
    player.wheelFixture:setFilterData( 1, 1, -1 )
    player.wheelFixture:setFriction(1)

    -- Create Head
    player.headShape = love.physics.newCircleShape(0, -20*player.scale, 8*player.scale)
    player.headFixture = love.physics.newFixture(player.body, player.headShape)
    player.headFixture:setFilterData( 1, 1, -1 )

    -- Set up sprite
    require "sprite"
    player.sprite = loadSprite('res/rasmus.png', player.spriteWidth, player.spriteHeight)
    player.spriteStill = sprite.get(1, 0)
    player.spriteRight = sprite.get(0, 0)
    player.spriteLeft = sprite.get(0, 1)

    -- Attack sprites
    player.attackSpritesRight = {
        sprite.get(2, 0),
        sprite.get(3, 0),
        sprite.get(4, 0),
        sprite.get(5, 0)
    }
    player.attackSpritesLeft = {
        sprite.get(2, 1),
        sprite.get(3, 1),
        sprite.get(4, 1),
        sprite.get(5, 1)
    }
    player.isAttacking = false
    player.attackStart = -0.3
    player.attackElapsed = player.attackStart
    player.attackTime = 0.5
    player.hasShot = false

    -- Bullets
    player.bullets = {next=nil, prev=nil, value=nil}
    player.nr = 0
    function player.attack(dt)
        player.attackElapsed = player.attackElapsed + dt
        if player.attackElapsed <= player.attackTime then
            index = math.max(0, math.floor(player.attackElapsed / (player.attackTime / #player.attackSpritesRight))) + 1
            player.spriteRight = player.attackSpritesRight[index]
            player.spriteLeft = player.attackSpritesLeft[index]
            if index == 4 and not player.hasShot then
                player.hasShot = true
                --player.bullet = loadBullet(player.facingRight, player.body:getX(), player.body:getY())
                bullet = loadBullet(player.facingRight, player.body:getX(), player.body:getY())
                player.bullets = {next=player.bullets, prev=nil, value = bullet}
                player.bullets.value.name = player.nr
                player.nr = player.nr + 1

            end
        else
            player.hasShot = false
            player.attackElapsed = player.attackStart
        end
    end

    function player.updateBullets(dt)
        local nxt = player.bullets
        while nxt ~= nil and nxt.value ~= nil do
            if nxt.value.update(dt) then
                if nxt.prev ~= nil then
                    nxt.prev.next = nxt.next
                else
                    player.bullets = nxt.next
                end
                if nxt.next ~= nil then
                    nxt.next.prev = nxt.prev
                end
            end
            nxt = nxt.next
        end
    end

    function player.drawBullets()
        local nxt = player.bullets
        while nxt ~= nil and nxt.value ~= nil do
            nxt.value.draw()
            nxt = nxt.next
        end
    end

    function player.update(dt)
        local k = love.keyboard
        local velX
        local velY 
        velX, vleY= player.body:getLinearVelocity()
        if love.keyboard.isDown("a") and velX > -player.topSpeed then
            --player.body:setLinearVelocity(-100,velY)
            player.lastDirectionRight = false
            player.body:applyForce(-player.acceleration,0)
        end
        if love.keyboard.isDown("d") and velX < player.topSpeed then
            --player.body:setLinearVelocity(100,velY)
            player.lastDirectionRight = true
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

        if love.keyboard.isDown("p") and (not player.isAttacking) then
            player.isAttacking = true
            player.facingRight = player.lastDirectionRight
        elseif not love.keyboard.isDown("p") and player.isAttacking and player.attackElapsed == player.attackStart then
            player.isAttacking = false
            player.spriteRight = player.sprite.get(0, 0)
            player.spriteLeft = player.sprite.get(0, 1)
        end

        if player.isAttacking then
            player.attack(dt)
        end

        player.updateBullets(dt)

        player.body:setAngle(velX/player.topSpeed*player.maxLean)

    end

    function player.draw()
        love.graphics.setColor(1,1,1,1)
        posX, posY = player.body:getWorldPoints(player.shape:getPoints())
        posX = posX - player.sideMargin*player.scale
        posY = posY - player.topMargin*player.scale
        velX, velY = player.body:getLinearVelocity()
	    if (not player.isAttacking and velX > player.topSpeed*player.stillToloerance) or (player.isAttacking and player.facingRight) then
		    love.graphics.draw(player.sprite.img, player.spriteRight, posX, posY, player.body:getAngle(), player.scale, player.scale, 0, 0)
	    elseif velX < -player.topSpeed*player.stillToloerance or (player.isAttacking and not player.facingRight) then
		    love.graphics.draw(player.sprite.img, player.spriteLeft, posX, posY, player.body:getAngle(), player.scale, player.scale, 0, 0)
	    else
		    love.graphics.draw(player.sprite.img, player.spriteStill, posX, posY, player.body:getAngle(), player.scale, player.scale, 0)
        end
        --Show collision area
        if false then
            love.graphics.polygon("line", player.body:getWorldPoints(player.shape:getPoints()))
            cx, cy = player.body:getWorldPoints(player.wheelShape:getPoint())
            hx, hy = player.body:getWorldPoints(player.headShape:getPoint())
            love.graphics.circle("line", cx, cy, player.wheelShape:getRadius())
            love.graphics.circle("line", hx, hy, player.headShape:getRadius())
        end

        player.drawBullets()
    end


    return player
end
