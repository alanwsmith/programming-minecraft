local move = require("/library.move")

-- move.go("up", 5)
move.go("forward", 5)
move.go("down", 40)
move.go("forward", 24)
move.go("back", 24)
move.go("up", 40)
move.go("forward", 5)

turtle.turnRight()
turtle.turnRight()