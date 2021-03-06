function createPlatform(x, y, width, height, sprite)
    require "point"
    require "collisionBox"
    local platform = {}

    platform.scale = 2
    platform.x, platform.y = x*32*platform.scale, y*32*platform.scale
    platform.width = width*32*platform.scale
    platform.height = height*32*platform.scale

    platform.collisionBox = createCollisionBox(platform.x + platform.width/2, platform.y + platform.height/2 , width, height)


    platform.form = createPlatformArray(width, height)

    function platform.draw()        
        love.graphics.setColor(1,1,1,1)
        for row=1,height do
            for col=1,width do
                love.graphics.draw(sprite.img, sprite.getFromPoint(platform.form[row][col]), 
                (col-1)*32*platform.scale + platform.x, (row-1)*32*platform.scale + platform.y, 0, platform.scale, platform.scale, 0, 0)
            end
        end
        -- Draw collision box:
		--love.graphics.setColor(platform.collisionBox.color)
		--love.graphics.polygon("line", platform.collisionBox.body:getWorldPoints(platform.collisionBox.shape:getPoints()))
    end

    function platform.setX(x)
        platform.x = platform.x + x
        platform.collisionBox.body:setX(platform.collisionBox.body:getX() + x)
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
        for col=1, height do
            table.insert(form, {Point(3,1)})
        end
        table.insert(form, {Point(3,2)})
    elseif height == 1 then
        -- use row
        currentRow = {Point(0,3)}
        for row=1, width do
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