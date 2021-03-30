
p_myproto = Proto ("WS_PARSER","WS_Body_Parser")
local f_command = ProtoField.uint16("myproto.command", "Command", base.HEX)
local f_data = ProtoField.string("myproto.data", "Data", FT_STRING)

p_myproto.fields = {f_command}

function p_myproto.dissector (buf, pkt, root)

	if buf:len() == 0 then return end
	pkt.cols.protocol = p_myproto.name

	local str = buf(0):string()
	local idxFirst = nil
	local idxLast = nil

	local ch
	for i = 1, string.len(str) do
		ch = string.sub(str, i, i)
		
		if ch == "{" and idxFirst == nil then
			idxFirst = i
		end
		
		if ch == "}" and idxLast == nil then
			idxLast = i
		end			
	end
	
	if idxFirst ~= nil and idxLast ~= nil then
		subtree = root:add(p_myproto, string.sub(str, idxFirst, idxLast))
	end		

end

-- Initialization routine
function p_myproto.init()
end

local tcp_port = DissectorTable.get("tcp.port")
tcp_port:add(83, p_myproto)