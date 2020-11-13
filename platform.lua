stages = {
    {
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {"g","g","g","g","g","g","g","g"},
        {"g","g","g","g","g","g","g","g"}
    }
}


function loadPlatform()
    platform = {}

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
    platform.y = platform.height / 2

    platform.currentStage = stages[1]
    platform.cubeHeight = platform.height/#platform.currentStage
    platform.cubeWidth = platform.width/#platform.currentStage

    function platform.drawGround(w, h)
        love.graphics.rectangle("fill", (w-1)*platform.cubeWidth, (h-1)*platform.cubeHeight, platform.cubeWidth, platform.cubeHeight)
    end
    
    platform.keys = {
        ["g"] = platform.drawGround
    }

    return platform
end