function route_match(prefix, attrs, peer,RM_FAILURE, RM_NOMATCH, RM_MATCH, RM_MATCH_AND_CHANGE)
    log.notice("Running first Lua script")
    local count_first = true 
    local comm_list = {}
    local influencing_first_part = 905
    print ("Peer " .. peer.remote_address.string .. "\n")
    if attrs.community ~= nil and type(attrs.community) == "string" and #attrs.community > 0 then
       print("Community " .. attrs.community .. "\n")
       for comm in string.gmatch(attrs.community, "%S+") do
           print ("Comm" .. comm ..  "\n")
           local _, _, first32, second16 = string.find(comm, "(%d+):(%d+)")
           local int_first32 = tonumber(first32)
           local int_second16 = tonumber(second16)
           if int_first32 ~= nil and second16 ~= nil then
              if int_first32 == influencing_first_part then
                 print ("split " .. int_first32 .. " " .. int_second16 .. "\n")
                 attrs.localpref = int_second16           
                 for attr, value in pairs(attrs) do
                     print (attr .. " " .. value .. "\n")
                 end 
                 return {action = RM_MATCH_AND_CHANGE, attributes = attrs}
              end
           end
       end
    end
    return { action = RM_MATCH}
end
