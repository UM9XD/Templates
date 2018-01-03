local runService = game:GetService("RunService");
local players = game:GetService("Players");
local player = assert(players.LocalPlayer, 'Script must be ran locally');

local character = player.Character or player.CharacterAdded:wait()
local humanoidRootPart = character.HumanoidRootPart;

local sound = Instance.new("Sound", humanoidRootPart);
sound.Volume = 1;

player.Chatted:connect(function(message)
    if message:sub(1,4) == "play" then
        sound.SoundId = "rbxassetid://"..message:sub(6);
        sound:Play();
    elseif message:sub(1,6) == "volume" then
        sound.Volume = tonumber(message:sub(8));
    end
end);


runService.RenderStepped:connect(function()
    print(sound.PlaybackLoudness);-->Gives You a Number Value
end);
