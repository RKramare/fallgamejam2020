function loadPlatform()
    platform = {}

	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
    platform.y = platform.height / 2
    
    return platform

end