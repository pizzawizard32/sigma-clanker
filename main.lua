local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions.string()
math.randomseed(os.time())

local echomsg = "@everyone\nTHIS MESSAGE HAS BEEN SENT BY REAL PATRIOTS FROM THE PEOPLE'S FEDERAL REPUBLIC OF CAROTA."
local imagelink = "https://files.catbox.moe/44w4wc.png"

local raid = false

client:on('messageCreate', function(msg)
	local content = msg.content
	local lower = string.lower(content)

	if lower == '!yap' then
		raid = true
		repeat
			msg.channel:send(echomsg.."\n"..imagelink)
		until raid == false
	elseif lower == '!shutup' then
		raid = false
	elseif lower == '!yap noimage' then
		raid = true
		repeat
			msg.channel:send(echomsg)
		until raid == false
	end
end)

client:run("USER_TOKEN")
