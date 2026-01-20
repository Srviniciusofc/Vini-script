-- ===============================
-- LOAD LIBRARY (REDZ V5 REMAKE)
-- ===============================
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

-- ===============================
-- SERVICES
-- ===============================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- ===============================
-- REMOTES (PADRÃO PET SIM 99)
-- ===============================
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local DamageRemote = Remotes:WaitForChild("Breakables_PlayerDealDamage")
local JoinPetRemote = Remotes:WaitForChild("Breakables_JoinPetBulk")
local ClickRemote = Remotes:WaitForChild("Clicker_Click")

-- ===============================
-- FLAGS
-- ===============================
local AutoDiamonds = false
local AutoArea = false
local AutoClick = false

-- ===============================
-- FUNÇÕES ÚTEIS
-- ===============================
local function MoveTo(cf)
    HRP.CFrame = cf + Vector3.new(0, 3, 0)
end

local function GetCurrentArea()
    local map = workspace:FindFirstChild("__MAP")
    if not map then return nil end

    local areas = map:FindFirstChild("Areas")
    if not areas then return nil end

    for _, area in ipairs(areas:GetChildren()) do
        local zone = area:FindFirstChild("Zone")
        if zone then
            if (HRP.Position - zone.Position).Magnitude < 60 then
                return area.Name
            end
        end
    end

    return nil
end

local function GetAreaCFrame(areaName)
    local map = workspace:FindFirstChild("__MAP")
    if not map then return nil end

    local areas = map:FindFirstChild("Areas")
    if not areas then return nil end

    local area = areas:FindFirstChild(areaName)
    if area and area:FindFirstChild("Zone") then
        return area.Zone.CFrame
    end

    return nil
end

-- ===============================
-- AUTO CLICK (INSANO)
-- ===============================
task.spawn(function()
    while true do
        if AutoClick then
            for i = 1, 100 do
                pcall(function()
                    ClickRemote:FireServer()
                end)
            end
        end
        task.wait()
    end
end)

-- ===============================
-- AUTO FARM DIAMANTES
-- ===============================
task.spawn(function()
    while true do
        if AutoDiamonds then
            local areaName = GetCurrentArea()

            if areaName then
                local things = workspace:FindFirstChild("__THINGS")
                if things then
                    local breakables = things:FindFirstChild("Breakables")
                    if breakables then
                        local areaFolder = breakables:FindFirstChild(areaName)
                        if areaFolder then
                            for _, obj in ipairs(areaFolder:GetChildren()) do
                                if not AutoDiamonds then break end

                                pcall(function()
                                    DamageRemote:FireServer(obj.Name)
                                    JoinPetRemote:FireServer({obj.Name})
                                end)

                                task.wait(0.1)
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)

-- ===============================
-- AUTO FARM ÁREA
-- ===============================
task.spawn(function()
    while true do
        if AutoArea then
            local areaName = GetCurrentArea()
            if areaName then
                local cf = GetAreaCFrame(areaName)
                if cf then
                    MoveTo(cf)
                end
            end
        end
        task.wait(1)
    end
end)

-- ===============================
-- UI (REDZ)
-- ===============================
local Window = Library:MakeWindow({
    Title = "Pet Simulator 99",
    SubTitle = "Auto Farm | Redz V5",
    SaveFolder = "PetSim99"
})

local FarmTab = Window:MakeTab({
    Name = "Farm",
    Icon = "rbxassetid://7734053495"
})

FarmTab:AddToggle({
    Name = "Auto Farm Diamantes",
    Default = false,
    Callback = function(state)
        AutoDiamonds = state
    end
})

FarmTab:AddToggle({
    Name = "Auto Farm Área",
    Default = false,
    Callback = function(state)
        AutoArea = state
    end
})

FarmTab:AddToggle({
    Name = "Auto Click (Insano)",
    Default = false,
    Callback = function(state)
        AutoClick = state
    end
})
