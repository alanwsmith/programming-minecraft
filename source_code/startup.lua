local lib = require("/lib")

print("Hello! I'm Robot " .. os.getComputerID())
print("Fuel: " .. turtle.getFuelLevel())
os.setComputerLabel("ID:" .. os.getComputerID() .. " F:" .. turtle.getFuelLevel())

lib.startCurrent()



