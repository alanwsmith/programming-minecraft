for width = 1, 10 do
    for length = 1, 11 do
        turtle.forward()
        turtle.digDown()
        turtle.digDown()
    end
    if width % 2 == 1 then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    else
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
    end
end
