function love.load()
    require "player"
	require "platform"
	require "box"
	require "sprite"

	sprite = loadSprite("res/rasmus.png", 32, 64)
	
    setWorldPhysics()
    
    player = loadPlayer()
	platform = loadPlatform()
	
	createBoxes()
end
 
function setWorldPhysics()
	love.physics.setMeter(32)
	world = love.physics.newWorld(0, 9.82*64, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	objects = {}
end

function createBoxes()
	objects.boxes = {}
	for i=1, 3 do
		objects.boxes[i] = createBox(i * 32 * 10, player.y + 32, 10, 1)
	end
	
	objects.boxes[4] = createBox(32, player.y, 1, 10)
	objects.boxes[5] = createBox(love.graphics.getWidth(), player.y, 1, 10)
	
end

function love.update(dt)
	world:update(dt)
	controllPlayer(dt)
end

function controllPlayer(dt)
	local k = love.keyboard
	velX, velY = player.body:getLinearVelocity()
	if love.keyboard.isDown("a") and velX > -250 then
		--player.body:setLinearVelocity(-100,velY)
		player.body:applyForce(-1500,0)
	end
	if love.keyboard.isDown("d") and velX < 250 then
		--player.body:setLinearVelocity(100,velY)
		player.body:applyForce(1500,0)
	end

	if love.keyboard.isDown('c') then
		platform.increaseLevel()
	end


	if love.keyboard.isDown("w") then
		contacts = player.body:getContacts()
		
		for i,contact in ipairs(contacts) do
			nx, ny = contact:getNormal()
			if contact:isTouching() and ny == 1 then
				player.body:applyLinearImpulse(0,-200)
				break
			end
		end
	end

end

 
function love.draw()
	drawStage()
	drawPlayer()
	drawGround()
end

function drawStage()
	love.graphics.setColor(1, 1, 1)
	for h=1, #platform.currentStage do
		for w=1, #platform.currentStage[h] do
			if platform.currentStage[h][w] ~= 0 then
				platform.draw(w, h, platform.currentStage[h][w])
			end
		end
	end
end

function drawPlayer()
	love.graphics.setColor(player.color)
	x, y = player.body:getWorldPoints(player.shape:getPoints())
	velX, velY = player.body:getLinearVelocity()
	if velX > 0 then
		love.graphics.draw(player.img, player.spriteRight, x, y, velX/1500, 1, 1, 0, velX/100)
	elseif velX < 0 then
		love.graphics.draw(player.img, player.spriteLeft, x, y, velX/1500, 1, 1, 0, velX/100)
	else
		love.graphics.draw(player.img, player.spriteStill, x, y, 0, 1, 1, 0)
	end
end

function drawGround()
	love.graphics.setColor(player.color)
	--love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))

	for i, box in ipairs(objects.boxes) do
		love.graphics.setColor(box.color)
		love.graphics.polygon("line", box.body:getWorldPoints(box.shape:getPoints()))
	end
end
