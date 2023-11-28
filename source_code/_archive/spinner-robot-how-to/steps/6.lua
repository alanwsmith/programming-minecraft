local digSlot = 1
local placeSlot = 2

while true do
  for turnNum = 1, 4 do
    turtle.turnRight()
    turtle.select(digSlot)
    turtle.dig()
    turtle.select(placeSlot)
    turtle.place()
  end
end