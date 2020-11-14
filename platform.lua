function createPlatform(x, y, width, height, sprite)
    require "point"
    require "collisionBox"
    local platform = {}

    platform.x, platform.y = x*32, y*32
    platform.width = width*32
    platform.height = height*32

    platform.collisionBox = createCollisionBox(platform.x + platform.width/2, platform.y + platform.height/2 , width, height)

    platform.scale = 1

    platform.form = createPlatformArray(width, height)

    function platform.draw()        
        love.graphics.setColor(1,1,1,1)
        for row=1,height do
            for col=1,width do
                love.graphics.draw(sprite.img, sprite.getFromPoint(platform.form[row][col]), 
                (col-1)*32 + platform.x, (row-1)*32 + platform.y)
            end
        end
        -- Draw collision box:
		--love.graphics.setColor(platform.collisionBox.color)
		--love.graphics.polygon("line", platform.collisionBox.body:getWorldPoints(platform.collisionBox.shape:getPoints()))
    end

    function platform.update(dt, player)
        platform.setX(dt, player)
    end

    function platform.setX(dt, player)
        playerDistFromMiddle = (player.body:getX() - love.graphics.getWidth()/2) / (love.graphics.getWidth()/2 )
        
        margin = 0.3
        if math.abs(playerDistFromMiddle) > margin then
            if playerDistFromMiddle > 0 then
                playerDistFromMiddle = playerDistFromMiddle - margin
            else
                playerDistFromMiddle = playerDistFromMiddle + margin
            end

            multi = -playerDistFromMiddle * player.topSpeed * 2

            player.body:setX(player.body:getX() + dt * multi / 5)
            platform.x = platform.x + dt * multi
            platform.collisionBox.body:setX(platform.collisionBox.body:getX() + dt * multi)
        end
        
    end

    return platform
end

function createPlatformArray(width, height)
    local form = {}
    if width == 1 and height == 1 then 
        -- single block
        form = {{Point(3,3)}}
    elseif width == 1 then
        -- use column
        form = {{Point(3,0)}}
        for col=1, width do
            table.insert(form, {Point(3,1)})
        end
        table.insert(form, {Point(3,2)})
    elseif height == 1 then
        -- use row
        currentRow = {Point(0,3)}
        for row=1, height do
            table.insert(currentRow, Point(1,3))
        end
        table.insert(currentRow, Point(2,3))
        form = {}
        table.insert(form, currentRow)
    else
        --use square
        rowEnd = height
        colEnd = width
        form = {}
        for row=1,rowEnd do
            currentRow = {}
            for col=1,colEnd do
                --First row
                if row == 1 and col == 1 then
                    a = Point(0,0)
                    table.insert(currentRow, a)
                elseif row == 1 and col == colEnd then
                    table.insert(currentRow,Point(2,0))
                elseif row == 1 then
                    table.insert(currentRow,Point(1,0))
                --Last row
                elseif row == rowEnd and col == 1 then
                    table.insert(currentRow,Point(0,2))
                elseif row == rowEnd and col == colEnd then
                    table.insert(currentRow,Point(2,2))
                elseif row == rowEnd then
                    table.insert(currentRow,Point(1,2))
                --First col
                elseif col == 1 then
                    table.insert(currentRow,Point(0,1))
                --Last col
                elseif col == colEnd then
                    table.insert(currentRow,Point(2,1))
                else
                    table.insert(currentRow,Point(1,1))
                end
            end
            table.insert(form, currentRow)
        end
    end
    return form
end