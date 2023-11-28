local has_block, details = turtle.inspectDown()
local out = fs.open("_logs/details.txt", "w")
out.write(textutils.serialize(details))
out.close()



