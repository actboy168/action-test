local function test()
  local f <close> = assert(io.popen("sysctl sysctl.proc_translated", "r"))
  return f:read "l"
end

print(test())
