local lib = require("/lib")
local config = lib.loadConfig()

if not config.step then
    config.active = true
end

config.currentDistance = 0

local doRemove = function()
    while turtle.detect() == false do
        print(config.currentDistance)
        turtle.forward()
        turtle.digDown()
        config.currentDistance = config.currentDistance + 1
        lib.saveConfig(config)
    end

    turtle.turnRight()
    turtle.turnRight()

    while config.currentDistance > 0 do
        print(config.currentDistance)
        turtle.forward()
        config.currentDistance = config.currentDistance - 1
        lib.saveConfig(config)
    end

    turtle.turnRight()
    turtle.turnRight()
end

doRemove()

config.active = false
lib.saveConfig(config)
