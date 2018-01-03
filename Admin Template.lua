local Players = game:GetService("Players")
local Player = Players.LocalPlayer

 local AdminTemplate = {
	Commands = {},
	Key = ":"
};

local FindPlayers
FindPlayers = function(msg)
    local plrs = {}
    if msg:match("^!") then
        return FindPlayers(Player, msg:sub(2), true)
    elseif msg == "me" then
        table.insert(plrs, Player)
    elseif msg == "all" then
        for _,v in pairs(game:service'Players':players()) do
            table.insert(plrs, v)
        end

elseif msg == "random" then
        for i,v in pairs(game:service'Players':players()) do
local M = math.random(1,#game:service'Players':players())
                table.insert(plrs, i[M])
end

    elseif msg == "others" then
        for _,v in pairs(game:service'Players':players()) do
            if v ~= Player then
                table.insert(plrs, v)
            end
        end
    else
        for _,v in pairs(game:service'Players':players()) do
            if v.Name:lower():sub(1,#msg) == msg:lower() then
                table.insert(plrs, v)
else
	 table.insert(plrs, Player)
            end
        end
    end
    return plrs
end

local function NewCmd(name, usage, func)
      table.insert(AdminTemplate.Commands, {
	['Name'] = name,
	['Usage'] = usage,
	['Func'] = func
	})
end

local Chatted = function(mg)
	for i,v in next, AdminTemplate.Commands do
		for _, bn in next, v.Usage do
	local u = string.lower(bn)
	local msg = string.lower(mg)
	local a,b = pcall(function()
		local z = msg:sub(#u+#AdminTemplate.Key+1)
		v.Func(Player,z)
	end)
	if not a then print(b) end
	end
	end
end;

Player.Chatted:Connect(function(A)
	Chatted(A)
end)

NewCmd("Test",{'test'},function()
	print("Test")
end)
