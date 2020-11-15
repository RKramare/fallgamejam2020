function createEnemy(x, y)
    local enemy = {}
    
    enemy.spriteHeight = 64
    enemy.spriteWidth = 32
    enemy.scale = 2
    enemy.isHittable = true
    enemy.isInfected = true
    enemy.frame = 1
    enemy.elapsed = 0

    enemy.topSpeed = 350
    enemy.acceleration = 1500

    -- Create Body
    enemy.body = love.physics.newBody(world, x*64 - (enemy.spriteWidth/2)*enemy.scale, y*64 - (enemy.spriteHeight/2)*enemy.scale, "dynamic")
    enemy.body:setFixedRotation(true)
    enemy.body:setMass(100)
    enemy.body:setLinearDamping(0)
    enemy.body:setUserData(enemy)
    marginX, marginY = 5, 10
    enemy.shape = love.physics.newRectangleShape(-marginX/2, -marginY/2 - 10, (enemy.spriteWidth-marginX)*enemy.scale, (enemy.spriteHeight-marginY)*enemy.scale, 0)
    enemy.fixture = love.physics.newFixture(enemy.body, enemy.shape)

    -- Set up sprite
    require "sprite"
    enemy.sprite = loadSprite('res/characters.png', enemy.spriteWidth, enemy.spriteHeight)
    enemy.spriteStill = enemy.sprite.get(math.random(0,3), math.random(0,1))

    enemy.virsuSprite = loadSprite('res/virus.png', 32, 32)
    enemy.virusFrames = {
        enemy.virsuSprite.get(0, 0),
        enemy.virsuSprite.get(1, 0),
        enemy.virsuSprite.get(2, 0),
        enemy.virsuSprite.get(3, 0),
        enemy.virsuSprite.get(4, 0),
        enemy.virsuSprite.get(5, 0),
        enemy.virsuSprite.get(6, 0),
        enemy.virsuSprite.get(7, 0)
    }

    function enemy.setX(x)
        enemy.body:setX(enemy.body:getX() + x)
    end

    function enemy.hit()
        enemy.isInfected = false
    end

    function enemy.update(dt)
        enemy.elapsed = enemy.elapsed + dt
        if enemy.elapsed >= 0.2 then
            enemy.frame = enemy.frame + 1
            enemy.elapsed = 0
        end
        if enemy.frame > 8 then
            enemy.frame = 1
        end
    end

    function enemy.draw()
        love.graphics.setColor(1,1,1,1)
        posX, posY = enemy.body:getWorldPoints(enemy.shape:getPoints())
        love.graphics.draw(enemy.sprite.img, enemy.spriteStill, posX-marginX, posY-marginY - 10, enemy.body:getAngle(), enemy.scale, enemy.scale, 0, 0)
        if enemy.isInfected then
            love.graphics.draw(enemy.virsuSprite.img, enemy.virusFrames[enemy.frame], posX-marginX, posY-marginY - 10, enemy.body:getAngle(), enemy.scale, enemy.scale, 0, 0)
        end
        -- Collision box
        --love.graphics.polygon("line", enemy.body:getWorldPoints(enemy.shape:getPoints()))
    end

    return enemy
end