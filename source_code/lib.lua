local lib = {}

function lib.confirmItemInSlot(item, slot)
    turtle.select(slot)
    local details = turtle.getItemDetail()
    if details then
        if details.name == item then
            return true
        else
            return false
        end
    else
        return false
    end
end

function lib.dropItemForward(name) 
    for slot = 1, 16 do
        if lib.confirmItemInSlot(name, slot) then
            turtle.drop()
        end
    end
end

function lib.dumpItem(item)
    print("Dumping: " .. item)
    for slot = 1, 16 do
        turtle.select(slot)
        local details = turtle.getItemDetail()
        if details and details.name == item then
            turtle.drop()
        end
    end
end

function lib.loadConfig() 
    local currentFile = fs.open(".current.json", "r")
    if currentFile then
        local config = textutils.unserializeJSON(currentFile.readAll())
        currentFile.close()
        local currentProgramPath = shell.getRunningProgram()
        print(currentProgramPath)
        if config._directory == fs.getDir(currentProgramPath) then
            return config
        elseif currentProgramPath == "startup.lua" then
            return config
        else
            return {}
        end
    else
        return {}
    end
end


function lib.placeItemDown(item)
    if lib.confirmItemInSlot(item, turtle.getSelectedSlot()) then
        turtle.digDown()
        turtle.placeDown()
        return true
    else
        for slotNum = 1, 16 do
            if lib.confirmItemInSlot(item, slotNum) then
                turtle.digDown()
                turtle.placeDown()
                return true
            end
        end
        return false
    end
end

function lib.placeItemForward(item)
    if lib.confirmItemInSlot(item, turtle.getSelectedSlot()) then
        turtle.dig()
        turtle.place()
        return true
    else
        for slotNum = 1, 16 do
            if lib.confirmItemInSlot(item, slotNum) then
                turtle.dig()
                turtle.place()
                return true
            end
        end
        return false
    end
end


function lib.saveConfig(data) 
    local currentProgramPath = shell.getRunningProgram()
    data._directory = fs.getDir(currentProgramPath)
    data._program = fs.getName(currentProgramPath)
    if not data.active then
        data.active = false
    end
    local currentFile = fs.open(".current.json", "w")
    currentFile.write(textutils.serializeJSON(data, { compact = true }))
    currentFile.close()
end

function lib.startCurrent()
    local config = lib.loadConfig()
    if config.active then
        print("Starting: " .. config._program)
        for count = 20, 1, -1 do
            print(count)
            os.setComputerLabel("ID:" .. os.getComputerID() .. " Starting In:" .. count)
            sleep(1)
        end
        shell.run("cd", config._directory)
        shell.run(config._program)
    end
end

return lib
