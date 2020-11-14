function createPlatform(x, y, width, height)
    require "point"
    local platform = {}

    platform.x = x
    platform.y = y
    platform.width = width
    platform.width = height

    platform.scale = 1

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



    function platform.draw()
        require "sprite"
        sprite = loadSprite("res/ground1.png", 32, 32)
        
        love.graphics.setColor(1,1,1,1)
        for row=1,height do
            for col=1,width do
                love.graphics.draw(sprite.img, sprite.getFromPoint(form[row][col]), col*32 + platform.x, row*32 + platform.y)
            end
        end
    end

    return platform 
end

