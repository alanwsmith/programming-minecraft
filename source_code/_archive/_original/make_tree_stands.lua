local place = require("/library.place")

local make_level = function()
    for turn = 1, 2 do
        place.itemForward("minecraft:dirt")
        turtle.turnRight()
        turtle.turnRight()
    end
end

local levels = 10
local level_height = 8

for level = 1, levels do
    make_level()
    for up_level = 1, level_height do
        while turtle.detectUp() do
            turtle.digUp()
        end
        turtle.up()
    end
end

for level = 1, levels do
    for down_level = 1, level_height do
        turtle.down()
    end
end

