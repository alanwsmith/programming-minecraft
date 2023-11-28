local has_block, data = turtle.inspectDown()

local output_file = fs.open("details.txt", "w")

if has_block then
    -- output_file.write(textutils.serialize(data))
    output_file.write(data.name)
else
    output_file.write("No block below")
end

output_file.close()
