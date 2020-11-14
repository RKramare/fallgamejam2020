function loadGround(imagePath)
    -- Loads ground.
    ground = {}
    ground.img = love.graphics.newImage(imagePath)
    loadQuads()

    -- Ground types corresponding a quad.
    ground.types = {
        ["ug"] = ground.upperMiddle,
        ["lug"] = ground.upperLeft,
        ["rug"] = ground.upperRight,
        ["llg"] = ground.lowerLeft,
        ["lg"] = ground.lowerMiddle,
        ["rlg"] = ground.lowerRight
    }

    function ground.draw(w, h, size, key)
        love.graphics.draw(ground.img, ground.types[key], w, h, 0, size, size)
    end
    
    return ground
end

function loadQuads()
    ground.upperMiddle = love.graphics.newQuad(32, 0, 32, 32, ground.img:getDimensions())
    ground.upperLeft = love.graphics.newQuad(0, 0, 32, 32, ground.img:getDimensions())
    ground.upperRight = love.graphics.newQuad(ground.img:getWidth() - 32, 0 , 32, 32, ground.img:getDimensions())

    ground.lowerMiddle = love.graphics.newQuad(32, 32, 32, 32, ground.img:getDimensions())
    ground.lowerLeft = love.graphics.newQuad(0, 32, 32, 32, ground.img:getDimensions())
    ground.lowerRight = love.graphics.newQuad(ground.img:getWidth() - 32, 32, 32, 32, ground.img:getDimensions())
end
