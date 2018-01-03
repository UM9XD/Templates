local Players = game:GetService("Players")
local Player = Players.LocalPlayer

 local AdminTemplate = {
	Commands = {},
	Key = ":"
};


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
