local details = require("/library.details")
local place = require("/library.place")

local check_tree = function()
    -- if details.name() == "minecraft:birch_log" then
        turtle.dig()
    -- end
end


local chop_up = function()
    for level = 1, 7 do
        for dir = 1, 4 do
            check_tree()
            turtle.turnRight()
        end
        while turtle.detectUp() do
            turtle.digUp()
        end
        turtle.up()
    end
end

local plant_down = function()
    for level = 1, 7 do
        while turtle.detectDown() do
            turtle.digDown()
        end
        turtle.down()
    end
    -- for dir = 1, 4 do
    --     if details.name() ~= "minecraft:birch_sapling" then
    --         place.itemForward("minecraft:birch_sapling")
    --     end
    --     turtle.turnRight()
    -- end
end

local do_harvest = function()
    local levels = 10
    for level = 1, levels do
        chop_up()
    end
    for level = 1, levels do
        plant_down()
    end
end

do_harvest()