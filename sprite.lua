
function loadSprite(fileName, blockWidth, blockHeight)

    sprite = {}
    sprite.img = love.graphics.newImage(fileName)

    function sprite.get(x, y)
        return love.graphics.newQuad(blockWidth*x, blockHeight*y, blockWidth, blockHeight, sprite.img:getDimensions())
    end

    return sprite
end