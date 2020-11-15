function loadTegnell()
    local tegnell = {}
    local timer = 0
    tegnell.isTalking = false
    tegnell.message = ""

    function tegnell.say(msg)
        tegnell.isTalking = true
        timer = 500
        tegnell.message = msg
    end

    function tegnell.update(dt)
        if tegnell.isTalking then 
            if timer > 0 then
                timer = timer - 1
            else
                tegnell.isTalking = false
            end
        end 
    end

    function tegnell.draw()
        if tegnell.isTalking then
            borderXMsg, borderYMsg = 20, 20
            xMsg, yMsg = borderXMsg + 100, borderYMsg
            widthMsg = love.graphics.getWidth() - borderXMsg * 2 - 200
            heightMsg = 50
            love.graphics.setColor(1,0,0,1)
            love.graphics.rectangle("fill", xMsg, yMsg, widthMsg, heightMsg)
            tmp = love.graphics.getLineWidth()
            love.graphics.setLineWidth(4)
            love.graphics.setColor(0,0,0,1)
            love.graphics.rectangle("line", xMsg, yMsg, widthMsg, heightMsg)
            font = love.graphics.newFont(14)
            love.graphics.setFont(font)
            love.graphics.printf(tegnell.message, xMsg + 10, yMsg + 10, widthMsg - 10, 'left')

            tegnell.img = love.graphics.newImage('res/tegnell01.png')
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(tegnell.img, 10, 10)
            
            love.graphics.setColor(0,0,0,1)
            love.graphics.rectangle("line", 10, 10, 100, 100)


            love.graphics.setLineWidth(tmp)

        end
    end

    return tegnell
end