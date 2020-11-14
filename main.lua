function love.load()
    require "player"
	require "platform"
	require "collisionBox"
	require "sprite"

	sprite = loadSprite("res/rasmus.png", 32, 64)
	
    setWorldPhysics()
    
	player = loadPlayer(32, 3*32)
	
	require "sprite"
	spriteGround = loadSprite("res/ground1.png", 32, 32)
	platforms = {}
	table.insert(platforms, createPlatform(0, 5*32, 3, 3, spriteGround))
	table.insert(platforms, createPlatform(4*32, 5*32, 1, 1, spriteGround))
	table.insert(platforms, createPlatform(6*32, 5*32, 1, 3, spriteGround))
	table.insert(platforms, createPlatform(8*32, 5*32, 3, 1, spriteGround))
	
end
 
function setWorldPhysics()
	love.physics.setMeter(32)
	world = love.physics.newWorld(0, 9.82*64, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	objects = {}
end

function love.update(dt)
	world:update(dt)
	player.update(dt)
	updatePlatforms(dt)
end


function updatePlatforms(dt)
	for i,pl in ipairs(platforms) do
		pl.update(dt)
	end
end

 
function love.draw()
	drawPlatforms()
	player.draw()
end

function drawPlatforms()
	for i,pl in ipairs(platforms) do
		pl.draw()
	end
end
