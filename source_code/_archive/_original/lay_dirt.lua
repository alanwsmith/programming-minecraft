local dimensions = require("/library.dimensions")
local place = require("/library.place")
local move = require("/library.move")

local lay_dirt = function()
    local steps = dimensions.get()
    local turn_check = 1
    while steps.right >= 0 do
        for forward_step = 1, steps.forward - 1 do
            place.itemDown("minecraft:dirt")
            move.forward()
        end
        place.itemDown("minecraft:dirt")

        if steps.right ~= 0 then
            if turn_check % 2 == 0 then
                turtle.turnLeft()
                move.forward()
                turtle.turnLeft()
            else
                turtle.turnRight()
                move.forward()
                turtle.turnRight()
            end
        end
        turn_check = turn_check + 1
        steps.right = steps.right - 1
    end
end

lay_dirt()