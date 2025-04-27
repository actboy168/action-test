local function read_registry_key(path, key)
    local f = io.popen(string.format("reg query \"%s\" /v \"%s\"", path, key), "r")
    if f then
        for l in f:lines() do
            local r = l:match "^    [^%s]+    [^%s]+    (.*)$"
            if r then
                f:close()
                return r
            end
        end
     end
end
local PROCESSOR_ARCHITECTURE = read_registry_key([[HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]], "PROCESSOR_ARCHITECTURE")
print(PROCESSOR_ARCHITECTURE)
