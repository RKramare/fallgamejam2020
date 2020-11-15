
function loadSprite(fileName, blockWidth, blockHeight)
    local sprite = {}
    sprite.img = love.graphics.newImage(fileName)

    function sprite.get(x, y)
        return love.graphics.newQuad(blockWidth*x, blockHeight*y, blockWidth, blockHeight, sprite.img:getDimensions())
    end

    require "point"
    function sprite.getFromPoint(point)
        return love.graphics.newQuad(blockWidth*point.x, blockHeight*point.y, blockWidth, blockHeight, sprite.img:getDimensions())
    end

    return sprite
end