sleep(3)

local move_foward = function()
    while turtle.detect() == true do
        turtle.dig()
    end
    turtle.forward()

    local how_high_did_we_go = 0

    while turtle.detectUp() == true do
        turtle.digUp()
        turtle.up()
        how_high_did_we_go = how_high_did_we_go + 1
    end

    for stepDown = 1, how_high_did_we_go do
        turtle.down()
    end

    if turtle.detectDown() == false then
        turtle.placeDown()
    end
end

local length = 65
local width_divided_by_2 = 11

for widthStep = 1, width_divided_by_2 do 
    for lengthStep = 1, length do
        move_foward()
    end

    turtle.turnRight()
    move_foward()
    turtle.turnRight()

    for lengthStep = 1, length do
        move_foward()
    end

    turtle.turnLeft()
    move_foward()
    turtle.turnLeft()
end
