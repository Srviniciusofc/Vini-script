--[[
Vinibrook Hub v2
Brookhaven 🏡RP
Executor: Delta (Mobile)
UI: Redz Library V5
]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/main/redz-V5-remake/main.luau"
))()

local Window = Library:MakeWindow({
    Title = "Vinibrook Hub v2",
    SubTitle = "Brookhaven | Delta",
    SaveFolder = "VinibrookHub"
})

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Player
local PlayerTab = Window:MakeTab({"Player", "user"})
PlayerTab:AddButton({"Speed x2", function()
    local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if h then h.WalkSpeed = 32 end
end})
PlayerTab:AddButton({"Reset Speed", function()
    local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if h then h.WalkSpeed = 16 end
end})

-- Infinite Jump
local infJump = false
PlayerTab:AddToggle({"Infinite Jump", false, function(v) infJump = v end})
UIS.JumpRequest:Connect(function()
    if infJump then
        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

print("Vinibrook Hub v2 carregado")
