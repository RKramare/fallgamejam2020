function love.load()
	s = love.window.setMode(64*15, 64*10, {resizable=false, vsync=true, msaa=0})
	love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
	love.graphics.setDefaultFilter("nearest", "nearest")
    require "player"
    require "enemy"
	require "platform"
	require "collisionBox"
	require "sprite"
	require "levelmanager"
	setWorldPhysics()
	manager = createLevelManager()
	level = manager.currentLevel
	player = level.player
end

function setWorldPhysics()
	love.physics.setMeter(32)
	world = love.physics.newWorld(0, 9.82*128, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	objects = {}
end

function love.update(dt)
	world:update(dt)
	player.update(dt)
	updateX(dt)
end

function love.keypressed(key)
	if key == "r" then 
		restartLevel() 
	end
	if key == "n" then 
		nextLevel() 
	end
end

function cleanLevel()
	for i,pl in ipairs(level.platforms) do
		pl.collisionBox.body:destroy()
	end
	for i,enemy in ipairs(level.enemies) do
		enemy.body:destroy()
	end
	player.body:destroy()
end

function restartLevel()
	cleanLevel()
	level = manager.startLevel(manager.currentLevelNumber)
	player = level.player
end

function nextLevel()
	cleanLevel()
	level = manager.nextLevel()
	player = level.player
end

function love.draw()
	drawPlatforms()
	drawEnemies()
	player.draw()
end

function drawPlatforms()
	for i,pl in ipairs(level.platforms) do
		pl.draw()
	end
end

function drawEnemies()
	for i,enemy in ipairs(level.enemies) do
		enemy.draw()
	end
end

function updateX(dt)
	playerDistFromMiddle = (player.body:getX() - love.graphics.getWidth()/2) / (love.graphics.getWidth()/2 )
    playerChange, platformChange, enemyChange = 0, 0, 0
	margin = 0.1
	if math.abs(playerDistFromMiddle) > margin then
		if playerDistFromMiddle > 0 then
			playerDistFromMiddle = playerDistFromMiddle - margin
		else
			playerDistFromMiddle = playerDistFromMiddle + margin
		end
		multi = -playerDistFromMiddle * player.topSpeed * 2

		playerChange = dt * multi / 1
		platformChange = dt * multi
		enemyChange = platformChange

		player.body:setX(player.body:getX() + playerChange)
		updatePlatforms(platformChange)
		updateEnemies(enemyChange)
	end
end

function updatePlatforms(dt)
	for i,pl in ipairs(level.platforms) do
		pl.setX(dt)
	end
end

function updateEnemies(dt)
	for i,en in ipairs(level.enemies) do
		en.setX(dt)
	end
end