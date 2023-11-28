local digSlot = 1
local placeSlot = 2

while true do
  turtle.turnRight()
  turtle.select(digSlot)
  turtle.dig()
  turtle.select(placeSlot)
  turtle.place()
end