-- Carregar Orion
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variáveis globais
local killAuraEnabled = false
local killAuraRange = 20
local speedValue = 16
local selectedPlayer = nil
local spectating = false

-- Criar janela
local Window = OrionLib:MakeWindow({
    Name = "Vini Hub",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "ViniHubConfigs"
})

-- =====================
-- Speed Tab
-- =====================
local SpeedTab = Window:MakeTab({
    Name = "Speed",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SpeedSection = SpeedTab:AddSection({Name = "Speed Settings"})

SpeedSection:AddSlider({
    Name = "Velocidade",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(value)
        speedValue = value
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

-- =====================
-- Kill Aura Tab
-- =====================
local KillAuraTab = Window:MakeTab({
    Name = "Kill Aura",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local KillAuraSection = KillAuraTab:AddSection({Name = "Kill Aura Settings"})

KillAuraSection:AddToggle({
    Name = "Ativar Kill Aura",
    Default = false,
    Callback = function(value)
        killAuraEnabled = value
    end
})

KillAuraSection:AddSlider({
    Name = "Alcance",
    Min = 5,
    Max = 50,
    Default = 20,
    Callback = function(value)
        killAuraRange = value
    end
})

-- Função Kill Aura (ataca NPCs, objetos e blocos)
local function KillAura()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local rootPos = LocalPlayer.Character.HumanoidRootPart.Position
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            local dist = (rootPos - obj.HumanoidRootPart.Position).Magnitude
            if dist <= killAuraRange then
                obj.Humanoid.Health = 0 -- dano instantâneo
            end
        elseif obj:IsA("BasePart") and obj.Anchored == false then
            local dist = (rootPos - obj.Position).Magnitude
            if dist <= killAuraRange then
                obj:Destroy() -- destrói instantaneamente
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if killAuraEnabled then
        KillAura()
    end
end)

-- =====================
-- Spectate Tab
-- =====================
local SpectateTab = Window:MakeTab({
    Name = "Spectate",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SpectateSection = SpectateTab:AddSection({Name = "Spectate Settings"})

-- Lista de players
local function UpdatePlayerList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

local PlayerDropdown = SpectateSection:AddDropdown({
    Name = "Lista de Jogadores",
    Options = UpdatePlayerList(),
    Callback = function(value)
        selectedPlayer = value
    end
})

-- Botão atualizar lista
SpectateSection:AddButton({
    Name = "Atualizar Lista",
    Callback = function()
        PlayerDropdown:Refresh(UpdatePlayerList())
    end
})

-- Botão espectar
SpectateSection:AddButton({
    Name = "Spectar Player",
    Callback = function()
        if not selectedPlayer then return end
        local target = Players:FindFirstChild(selectedPlayer)
        if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
            spectating = true
            Camera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
        end
    end
})

-- Botão parar espectar
SpectateSection:AddButton({
    Name = "Parar de Spectar",
    Callback = function()
        spectating = false
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            Camera.CameraSubject = humanoid
        end
    end
})

-- Atualiza lista automaticamente
Players.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)

Players.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)

-- Inicializar Orion
OrionLib:Init()
