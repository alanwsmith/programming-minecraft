local details = require("/library.details")
local place = require("/library.place")

local check_tree = function()
    if details.name() == "minecraft:birch_log" then
        turtle.dig()
    end
    -- remove saplings so they don't grow 
    -- and stop other saplings from falling
    if details.name() == "minecraft:birch_sapling" then
        turtle.dig()
    end
end

local chop_up = function()
    for level = 1, 8 do
        for dir = 1, 2 do
            check_tree()
            turtle.suck()
            turtle.turnRight()
            turtle.turnRight()
        end
        while turtle.detectUp() do
            turtle.digUp()
        end
        turtle.up()
    end
end

local plant_down = function()
    for level = 1, 8 do
        while turtle.detectDown() do
            turtle.digDown()
        end
        turtle.down()
    end
    for dir = 1, 2 do
        turtle.suck()
        if details.name() ~= "minecraft:birch_sapling" then
            place.itemForward("minecraft:birch_sapling")
        end
        turtle.turnRight()
        turtle.turnRight()
    end
end

local do_harvest = function()
    local levels = 11
    for level = 1, levels do
        chop_up()
    end
    sleep(120)
    for level = 1, levels do
        plant_down()
    end
end

local fuel_level = turtle.getFuelLevel()
if fuel_level > 500 then
    do_harvest()
else
    print("Not enough fuel")
end