local place = require("/library.place")

local tree_torches = function(levels)
    for level = 1, levels do
        place.itemForward("minecraft:torch")
        for up = 1, 8 do
            while turtle.detectUp() do
                turtle.digUp()
            end
            turtle.up()
        end        
    end

    for level = 1, levels do
        for down = 1, 8 do
            while turtle.detectDown() do
                turtle.digDown()
            end
            turtle.down()
        end     
    end
end


local fuel_level = turtle.getFuelLevel()
if fuel_level > 300 then
    tree_torches(10)
else
    print("Not enough fuel")
end