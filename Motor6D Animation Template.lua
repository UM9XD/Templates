local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

repeat wait() until Player.Character
local Character = Player.Character
local Humanoid = Character:FindFirstChild("Humanoid")
local RigType = Humanoid.RigType

local Body = {
    Head = Character.Head,
    HumanoidRootPart = Character.HumanoidRootPart,
    };

local Motor6Ds = {};


if  (RigType == Enum.HumanoidRigType.R6) then
    Body.LeftArm = Character:FindFirstChild("Left Arm")
    Body.RightArm = Character:FindFirstChild("Right Arm")
    Body.LeftLeg = Character:FindFirstChild("Left Leg")
    Body.RightLeg = Character:FindFirstChild("Right Leg")
    Body.Torso = Character.Torso
else
    Body.UpperTorso = Character.UpperTorso
    Body.LowerTorso = Character.LowerTorso
    Body.LeftFoot = Character.LeftFoot
    Body.RightFoot = Character.RightFoot
    Body.RightHand = Character.RightHand
    Body.LeftHand = Character.LeftHand
    Body.LeftLowerArm = Character.LeftLowerArm
    Body.RightLowerArm = Character.RightLowerArm
    Body.LeftUpperArm = Character.LeftUpperArm
    Body.RightUpperArm = Character.RightUpperArm
    Body.LeftLowerLeg = Character.LeftLowerLeg
    Body.RightLowerLeg = Character.RightLowerLeg
    Body.LeftUpperLeg = Character.LeftUpperLeg
    Body.RightUpperLeg = Character.RightUpperLeg
end

for Index,Value in next, Body do
local Welds = Instance.new("Motor6D",Value)
Welds.Part0 = Body.Torso
Welds.Part1 = Value
Welds.Name = Value.Name.."Motor6D"
Motor6Ds[Index] = Welds
end

Motor6Ds.Head.C0 = CFrame.new(0, 2, 0)
Motor6Ds.Head.C1 = CFrame.new(0, 0.5, 0)

Motor6Ds.LeftArm.C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
Motor6Ds.LeftArm.C1 = CFrame.new(0, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)

Motor6Ds.RightArm.C0 = CFrame.new(1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
Motor6Ds.RightArm.C1 = CFrame.new(0, 0.5, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)

Motor6Ds.RightLeg.C0 = CFrame.new(0.5, -1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
Motor6Ds.RightLeg.C1 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)

Motor6Ds.LeftLeg.C0 = CFrame.new(-0.5, -1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)
Motor6Ds.LeftLeg.C1 = CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(0, math.rad(-90), 0)


UserInputService.InputBegan:connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then

    end
end)
