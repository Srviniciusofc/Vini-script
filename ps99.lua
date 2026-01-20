-- ======================================================
-- LOAD LIBRARY (ÚNICO JEITO CORRETO)
-- ======================================================
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

-- ======================================================
-- UI (CONFORME README)
-- ======================================================
local Window = Library:CreateLib("Pet Simulator 99", "DarkTheme")

local FarmTab = Window:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Auto Farm")

-- ======================================================
-- SERVICES
-- ======================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- ======================================================
-- REMOTES (PET SIM 99)
-- ======================================================
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local DamageRemote = Remotes:WaitForChild("Breakables_PlayerDealDamage")
local JoinPetRemote = Remotes:WaitForChild("Breakables_JoinPetBulk")
local ClickRemote = Remotes:WaitForChild("Clicker_Click")

-- ======================================================
-- FLAGS
-- ======================================================
local AutoDiamonds = false
local AutoArea = false
local AutoClick = false

-- ======================================================
-- FUNÇÕES
-- ======================================================
local function GetCurrentArea()
    local map = workspace:FindFirstChild("__MAP")
    if not map then return nil end

    local areas = map:FindFirstChild("Areas")
    if not areas then return nil end

    for _, area in pairs(areas:GetChildren()) do
        local zone = area:FindFirstChild("Zone")
        if zone then
            if (HRP.Position - zone.Position).Magnitude < 60 then
                return area.Name
            end
        end
    end

    return nil
end

-- ======================================================
-- AUTO CLICK (SEPARADO)
-- ======================================================
task.spawn(function()
    while true do
        if AutoClick then
            for i = 1, 50 do
                pcall(function()
                    ClickRemote:FireServer()
                end)
            end
        end
        task.wait()
    end
end)

-- ======================================================
-- AUTO FARM DIAMANTES
-- ======================================================
task.spawn(function()
    while true do
        if AutoDiamonds then
            local areaName = GetCurrentArea()
            if areaName then
                local things = workspace:FindFirstChild("__THINGS")
                if things then
                    local breakables = things:FindFirstChild("Breakables")
                    if breakables then
                        local folder = breakables:FindFirstChild(areaName)
                        if folder then
                            for _, obj in pairs(folder:GetChildren()) do
                                if not AutoDiamonds then break end
                                pcall(function()
                                    DamageRemote:FireServer(obj.Name)
                                    JoinPetRemote:FireServer({obj.Name})
                                end)
                                task.wait(0.15)
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.2)
    end
end)

-- ======================================================
-- AUTO FARM ÁREA (ANTI-FICAR PARADO)
-- ======================================================
task.spawn(function()
    while true do
        if AutoArea then
            local areaName = GetCurrentArea()
            if areaName then
                local area = workspace.__MAP.Areas:FindFirstChild(areaName)
                if area and area:FindFirstChild("Zone") then
                    HRP.CFrame = area.Zone.CFrame + Vector3.new(0, 3, 0)
                end
            end
        end
        task.wait(1)
    end
end)

-- ======================================================
-- TOGGLES (EXATAMENTE DO README)
-- ======================================================
FarmSection:NewToggle("Auto Farm Diamantes", "Quebra e coleta", function(state)
    AutoDiamonds = state
end)

FarmSection:NewToggle("Auto Farm Área", "Não fica parado", function(state)
    AutoArea = state
end)

FarmSection:NewToggle("Auto Click", "Click rápido", function(state)
    AutoClick = state
end)
