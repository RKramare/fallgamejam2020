function loadPlatform()
    -- Loads the platform.
    platform = {}
    require "stages"
    require "ground"
    ground = loadGround("res/ground1.png")

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
    platform.y = platform.height / 2

    platform.level = 1
    platform.currentStage = stages[platform.level]
    platform.cubeSize = platform.height/#platform.currentStage

    function platform.draw(w, h, key)
        -- Draws a platform with the provided key.
        ground.draw((w-1)*platform.cubeSize, (h-1)*platform.cubeSize, platform.cubeSize/32, key)
    end

    function platform.increaseLevel()
        -- 
        platform.level = platform.level + 1
        platform.currentStage = stages[platform.level]
    end

    return platform
end