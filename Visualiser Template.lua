local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
repeat wait(); until Player.Character;

local Character = Player.Character;
local HumanoidRootPart = Character.HumanoidRootPart;

local Sound = Instance.new('Sound',HumanoidRootPart);
Sound.Volume = 1;

Player.Chatted:connect(function(message)
        if message:sub(1,4) == "play" then
            Sound.SoundId = 'rbxassetid://'..message:sub(6);
            Sound:Play();
        elseif message:sub(1,6) == "volume" then
            Sound.Volume = tonumber(message:sub(8));
        end;
end);


RunService.RenderStepped:Connect(function()
        print(Sound.PlaybackLoudness);-->Gives You a Number Value
end);
