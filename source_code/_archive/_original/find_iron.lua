local move = require("/library.move")
local place = require("/library.place")
local dump = require("/library.dump")

local length = 20
local width_divided_by_two = 10
local torch_length = 5
local torch_width = 6

-- move.go_to_level(16)

for width_step = 1, width_divided_by_two do
    for length_step = 1, length do
        move.tunnel(1)
        if length_step % torch_length == 0 then
            if width_step % torch_width == 0 then
                place.itemDown("minecraft:torch")
            end
        end
    end
    turtle.turnRight()
    move.tunnel(1)
    turtle.turnRight()
    move.tunnel(length)
    turtle.turnLeft()
    move.tunnel(1)
    turtle.turnLeft()
    dump.by_name("minecraft:deepslate")
    dump.by_name("minecraft:cobbled_deepslate")
    dump.by_name("minecraft:cobblestone")
    dump.by_name("minecraft:andesite")
end


turtle.turnLeft()
move.tunnel(width_divided_by_two * 2)
turtle.turnRight()

-- move.go_to_level(63)



