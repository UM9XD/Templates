local RunService = game:GetService("RunService")--Gets your RunService
local Players = game:GetService("Players")--Gets your Players
local Player = Players.LocalPlayer--Gets your Player
repeat wait() until Player.Character-- Waits for your Character to load

local Character = Player.Character--Gets your character after the repeated wait
local HumanoidRootPart = Character.HumanoidRootPart--Gets your HumanoidRootPart

local Sound = Instance.new('Sound',HumanoidRootPart)--Instances a Sound in your HumanoidRootPart
Sound.Volume = 1--Sets the Sound Volume to 1/10

Player.Chatted:connect(function(message)--Chatted for LocalPlayer
    if message:sub(1,4) == 'play' then--Detects if the player has said play
        Sound:Stop()--Stops Sound
        Sound.SoundId = 'rbxassetid://'..message:sub(6)--1+4 = 5 + 1 = 6 the reason ur getting 6 is for the space inbetween so it would look like [p,l,a,y, ,id] which looks like 1,1,1,1 ,id
        Sound:Play()--Plays Sound
    elseif message:sub(1,6) == "volume" then-- Detects if player has said volume
        Sound.Volume = tonumber(message:sub(8));--uses 1+6 = 7 + 1 which is your value which makes 7 the space
        end;
end)


RunService.RenderStepped:Connect(function()--Loop Begins
    print(Sound.PlaybackLoudness)-->Gives You a Number Value
end)--Loop Ends
