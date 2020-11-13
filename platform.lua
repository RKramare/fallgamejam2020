stages = {
    {
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1}
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
    
    return platform
end