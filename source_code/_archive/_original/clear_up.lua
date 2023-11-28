local clear_up = function(levels)
    for up = 1, levels do
        while turtle.detectUp() do
            turtle.digUp()
        end
        turtle.up()
    end
    for down = 1, levels do
        while turtle.detectDown() do
            turtle.digDown()
        end
        turtle.down()
    end
end

clear_up(100)