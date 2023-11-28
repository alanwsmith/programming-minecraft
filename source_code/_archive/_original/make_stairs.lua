local move = require("/library.move")
local place = require("/library.place")

local target_level = -57

local x, original_level, y = gps.locate()

local current_level = original_level

while current_level > target_level do
    move.forward()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.digDown()
    turtle.down()
    if current_level % 6 == 0 then
        turtle.turnRight()
        move.forward()
        turtle.turnRight()
        turtle.turnRight()
        move.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.place()
        turtle.turnLeft()
    end
    current_level = current_level - 1
end

turtle.turnRight()
turtle.turnRight()

while turtle.detectUp() do
    turtle.digUp()
end
turtle.up()

while turtle.detectUp() do
    turtle.digUp()
end
turtle.up()

while turtle.detectUp() do
    turtle.digUp()
end
turtle.up()

local current_level = original_level

while current_level > target_level do
    move.forward()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.up()
    current_level = current_level - 1
end



turtle.turnRight()
turtle.turnRight()

turtle.down()
turtle.down()
turtle.down()