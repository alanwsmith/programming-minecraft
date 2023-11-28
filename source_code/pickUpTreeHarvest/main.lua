local lib = require("/lib")
local config = lib.loadConfig()

config.sleepTime = 30

local getStuff = function(c)
    while turtle.detect() == false do
        turtle.suck()
        turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
    while turtle.detect() == false do
        turtle.suck()
        turtle.forward()
    end
    turtle.turnRight()
    lib.dropItemForward("minecraft:stick")
    turtle.turnLeft()
    lib.dropItemForward("minecraft:birch_sapling")
    turtle.turnLeft()
    lib.dropItemForward("minecraft:birch_log")
    turtle.turnLeft()
end


if not config.step then
    config.active = true
    config.keepGoing = true
end


while config.keepGoing do
    getStuff(config)
    sleep(config.sleepTime)
end



config.active = false
lib.saveConfig(config)


-- local steps = 60
-- while true do
--     for step = 1, steps do
--         turtle.suck()
--         turtle.forward()
--     end
--     turtle.turnRight()
--     turtle.turnRight()
--     for step = 1, steps do
--         turtle.suck()
--         turtle.forward()
--     end
--     turtle.turnRight()
--     turtle.turnRight()
--     sleep(90)
-- end