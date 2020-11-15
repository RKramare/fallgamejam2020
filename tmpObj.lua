function createGoal(x, y)
    local goal = {}

    goal.spriteHeight = 32
    goal.spriteWidth = 32
    goal.scale = 2
    goal.x = x * 64 + 64
    goal.y = y * 64 + 64

    -- Create Body
    goal.body = love.physics.newBody(world, goal.x - (goal.spriteWidth/2)*goal.scale, goal.y - (goal.spriteHeight/2)*goal.scale, "static")
    goal.shape = love.physics.newRectangleShape(0, 0, 64, 64, 0)
    goal.fixture = love.physics.newFixture(goal.body, goal.shape)

    -- Set up sprite
    require "sprite"
    goal.sprite = loadSprite('res/purple.png', goal.spriteWidth, goal.spriteHeight)
    goal.spriteGoal = goal.sprite.get(0, 0)


    


    function goal.setX(x)
        goal.body:setX(goal.body:getX() + x)
    end

    function goal.draw()
        love.graphics.setColor(1,1,1,1)
        posX, posY = goal.body:getWorldPoints(goal.shape:getPoints())
        love.graphics.draw(goal.sprite.img, goal.spriteGoal, posX, posY, 0, goal.scale, goal.scale, 0, 0)
            
        -- Draw collision box:
		love.graphics.setColor(1, 0.5, 0)
		love.graphics.polygon("line", goal.body:getWorldPoints(goal.shape:getPoints()))
    end

    return goal
end