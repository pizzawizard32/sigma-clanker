local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions.string()
math.randomseed(os.time())

local raid = false

client:on('messageCreate', function(msg)
	local content = msg.content
	local lower = string.lower(content)

	if msg.author.id == client.user.id then
		if lower == '!do' then
			raid = true
			repeat
				msg.channel:send("@everyone\nIf you read this then... I'm sorry... you're not a sigma.\nThis message has been sent by real sigmas from carota's community.\nhttps://files.catbox.moe/44w4wc.png")
			until raid == false
		elseif lower == '!stop' then
			raid = false
		elseif lower == '!nl' then
			raid = true
			repeat
				msg.channel:send("@everyone\nIf you read this then... I'm sorry... you're not a sigma.\nThis message has been sent by real sigmas from carota's community. (link: t3tKaUWTBu)")
			until raid == false
		end
	end
end)

client:run("USER_TOKEN")