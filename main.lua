function love.load()
    require "player"
    require "platform"
    
    player = loadPlayer()
    platform = loadPlatform()
end
 
function love.update(dt)
	controllPlayer(dt)
end

function controllPlayer(dt)
	if love.keyboard.isDown('d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end
 
	if love.keyboard.isDown('space') then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end
 
	if player.y_velocity ~= 0 then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - player.gravity * dt
	end
 
	if player.y > player.ground then
		player.y_velocity = 0
    	player.y = player.ground
	end
end
 
function love.draw()
	drawStage()
	drawPlayer()
end

function drawStage()
	love.graphics.setColor(1, 1, 1)
	for h=1, #platform.currentStage do
		for w=1, #platform.currentStage[h] do
			if platform.currentStage[h][w] ~= 0 then
				platform.keys[platform.currentStage[h][w]](w, h)
			end
		end
	end
end

function drawPlayer()
	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end

