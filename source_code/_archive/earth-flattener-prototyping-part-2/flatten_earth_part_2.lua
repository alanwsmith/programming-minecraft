sleep(3)

-- https://tweaked.cc/module/turtle.html


local length = 40
local width_divided_by_2 = 2

turtle.select(2)

local move_foward = function()
    while turtle.detect() == true do
        turtle.dig()
    end
    turtle.forward()

    local has_block, data = turtle.inspectDown()
    local block_below_type = data.name

    if block_below_type ~= "minecraft:grass_block" then
        turtle.digDown()
        turtle.placeDown()
    end

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

for widthStep = 1, width_divided_by_2 do 
    for lengthStep = 1, length do
        move_foward()
    end

    turtle.turnRight()
    move_foward()
    turtle.turnRight()

    for lengthStep = 1, length do
        if lengthStep % 5 == 0 then
            if widthStep % 3 == 0 then
                turtle.select(1)
                turtle.turnRight()
                turtle.place()
                turtle.turnLeft()
                turtle.select(2)
            end
        end
        move_foward()
    end

    turtle.turnLeft()
    move_foward()
    turtle.turnLeft()
end
