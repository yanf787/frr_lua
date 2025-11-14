local function printTable(t, indent, file_handle)
    indent = indent or ""
    for k, v in pairs(t) do
        if type(v) == "table" then
            print(indent .. tostring(k) .. ": {")
            -- file_handle:write(indent .. tostring(k) .. ": {".. "\n")
            printTable(v, indent .. "    ", file) -- Increase indent for nested tables
            print(indent .. "}")
            -- file_handle:write(indent .. "}".. "\n")
        else
            print(indent .. tostring(k) .. ": " .. tostring(v))
            -- file_handle:write(indent .. tostring(k) .. ": " .. tostring(v) .. "\n")
        end
    end
end


function route_match(prefix, attrs, peer,RM_FAILURE, RM_NOMATCH, RM_MATCH, RM_MATCH_AND_CHANGE)
    log.notice("Running first Lua script")
    print ("Peer " .. peer.remote_address.string .. "\n")
    -- file_handle = io.open("/var/log/lua_log.log", "a")
    -- file_handle:write(prefix.network .. "\n")
    printTable(attrs, " ", file_handle)
    printTable(prefix, " ", file_handle)
    -- printTable(peer, " ", file_handle)
    log.notice(prefix.family)
    log.notice(prefix.network)
    -- file_handle:close()
    return { action = RM_MATCH}
end
