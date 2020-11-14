stages = {
    {
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0},
        {"lug","ug","ug","ug","ug","ug","ug","rug"},
        {"llg","lg","lg","lg","lg","lg","lg","rlg"}
    }
}


function loadPlatform()
    platform = {}

    require "ground"
    ground = loadGround()

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
    platform.y = platform.height / 2

    platform.currentStage = stages[1]
    platform.cubeSize = platform.height/#platform.currentStage

    function platform.draw(w, h, key)
        ground.draw((w-1)*platform.cubeSize, (h-1)*platform.cubeSize, platform.cubeSize/32, key)
    end

    return platform
end