--[[
         Update April 7th 2024

    • Better bypassing (more words)
    • Added Enable / Disable Button (finally)
    • Less Glitching (optimized script)
    • Anti-Double execution
    • Will only execute in legacy chat (the only chat version that the script works in)

    --Recommended Games--
  • Rate My Avatar
  • LGBTQ+ Hangout
  • Dollhouse Roleplay
  • Hotel Elephant
  • Royale High

    Credits to AnthonyIsntHere for the Anti Chat Logger
    Credits to clickgameplay for the previous version

    ]]

if game.TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService then
	local notifSound = Instance.new("Sound", workspace)
	notifSound.PlaybackSpeed = 1
	notifSound.Volume = 0.6
	notifSound.SoundId = "rbxassetid://136075117"
	notifSound.PlayOnRemove = true
	notifSound:Destroy()
	game.StarterGui:SetCore("SendNotification", {Title = "Bypasser Not Loaded", Text = "Please go to a game with Legacy Chat", Icon = "http://www.roblox.com/asset/?id=10011128208", Duration = 40, Button1 = "ОK"})
else
	if not getgenv().M_Bypass_Executed then
		getgenv().M_Bypass_Executed = true 
		repeat
			task.wait()
		until game:IsLoaded()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()

		local chatService, players = game:GetService("Chat"), game:GetService("Players")

		local custom_chars = {
			[" "] = "￰",
			["i"] = "і⁥",
			["a"] = "а⁥",
			["e"] = "е⁥",
			["c"] = "с⁥",
            ["h"] = "һ⁥",
			["o"] = "о⁥",
			["p"] = "р⁥",
			["s"] = "ѕ⁥",
			["I"] = "Ӏ⁥",
			["E"] = "Е⁥",
			["G"] = "ꓖ",
			["C"] = "С",
			["O"] = "О",
			["P"] = "Р",
			["S"] = "Ѕ",
			["U"] = "𐓎"
		}

		local default = " ိ"

		local player = players.LocalPlayer
		local playerGui = player:WaitForChild("PlayerGui")
		local chatGui, chatBar = playerGui:WaitForChild("Chat")

		repeat
			task.wait()
		until chatGui:FindFirstChild("ChatBar", true)

		chatBar = chatGui:FindFirstChild("ChatBar", true)

		local randomstr = function()
			local characters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
			local str = ""
			local length = math.random(12, 32)

			for i = 1, length do
				str = str .. characters[math.random(#characters)]
			end
			return str
		end

		task.spawn(function()
			while wait(.1) do
				if chatBar:IsFocused() then
					chatService:FilterStringForBroadcast(randomstr(), player)
				end
			end
		end)

		local bypassing = true

		local c = function()
			for i = 1, 2 do
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e Hey how are you doing?", "All")
				game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e How are you doing?", "All")
			end
		end

		local TextButton = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local ScreenGui = Instance.new("ScreenGui")
		TextButton.Parent = ScreenGui
		TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.464, 0, 0.790, 0)
		TextButton.Size = UDim2.new(0, 109, 0, 50)
		TextButton.Font = Enum.Font.Cartoon
		TextButton.Text = "Disable Bypasser"
		TextButton.TextColor3 = Color3.fromRGB(144, 201, 255)
		TextButton.TextScaled = true
		TextButton.TextSize = 23.000
		TextButton.TextWrapped = true
		UICorner.Parent = TextButton
		ScreenGui.Parent = game.CoreGui

		local old
		old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
			local method = getnamecallmethod()
			local args = {...}

			if method == "FireServer" and self.Name == "SayMessageRequest" and #args == 2 and not checkcaller() then
				if bypassing then
					local newMessage = args[1]
					for i, v in pairs(custom_chars) do
						local rep = string.gsub(newMessage, i, v .. "⁥")
						newMessage = rep
					end
					newMessage = "FAG￰" .. newMessage .. default

					args[1] = newMessage
					coroutine.wrap(c)
					return old(self, unpack(args))
				end
			end
			return old(self, ...)
		end))

		TextButton.MouseButton1Down:Connect(function()
			bypassing = not bypassing
			TextButton.Text = bypassing and "Disable Bypasser" or "Enable Bypasser"
		end)

		local notifSound = Instance.new("Sound", workspace)
		notifSound.PlaybackSpeed = 1.5
		notifSound.Volume = 0.4
		notifSound.SoundId = "rbxassetid://170765130"
		notifSound.PlayOnRemove = true
		notifSound:Destroy() 
		game.StarterGui:SetCore("SendNotification", {Title = "Bypаsser loаded", Text = "Version by sаuce_boss01 in discord", Icon = "rbxassetid://505845268", Duration = 16, Button1 = "оk retаrd"})
	else
		local notifSound = Instance.new("Sound", workspace)
		notifSound.PlaybackSpeed = 1
		notifSound.Volume = 0.6
		notifSound.SoundId = "rbxassetid://136075117"
		notifSound.PlayOnRemove = true
		notifSound:Destroy()
		game.StarterGui:SetCore("SendNotification", {Title = "Alreаdy Loаded", Text = "Bypаsser Alreаdy Loаded.", Icon = "http://www.roblox.com/asset/?id=10011128208", Duration = 5, Button1 = "OK"})
	end
end
