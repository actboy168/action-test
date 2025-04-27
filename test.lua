local function shell(command)
    local f = assert(io.popen(command, "r"))
    local r = f:read "l"
    f:close()
    return r
end

local function get_env(name)
    name = "%"..name.."%"
    local value = shell("echo "..name)
    if value == name then
        return ""
    end
    return value
end
print(get_env "PROCESSOR_ARCHITECTURE")
