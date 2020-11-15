function createEnemy(x, y)
    local enemy = {}
    
    enemy.spriteHeight = 64
    enemy.spriteWidth = 32
    enemy.scale = 2
    enemy.isHittable = true

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
    enemy.sprite = loadSprite('res/donnis.png', enemy.spriteWidth, enemy.spriteHeight)
    enemy.spriteStill = enemy.sprite.get(0, 0)

    function enemy.setX(x)
        enemy.body:setX(enemy.body:getX() + x)
    end

    function enemy.hit()
        print("Aj")
    end

    function enemy.draw()
        love.graphics.setColor(1,1,1,1)
        posX, posY = enemy.body:getWorldPoints(enemy.shape:getPoints())
        love.graphics.draw(enemy.sprite.img, enemy.spriteStill, posX-marginX, posY-marginY - 10, enemy.body:getAngle(), enemy.scale, enemy.scale, 0, 0)
        
        -- Collision box
        --love.graphics.polygon("line", enemy.body:getWorldPoints(enemy.shape:getPoints()))
    end

    return enemy
end