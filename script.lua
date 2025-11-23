local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
  Title = "Vini Hub : 👻👻",
  SubTitle = "dev by SrVinicius",
  ScriptFolder = "redz-library-V5"
})


local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
  Image = "rbxassetid://0",
  BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})



local MainTab = Window:MakeTab({
  Title = "Main",
  Icon = "Home"
})



local InicionSection = MainTab:AddSection("Início")



InicionSection:AddButton({
  Name = "Tornado",
  Debounce = 0.5,
  Callback = function()
    Tornado()
  end
})


-- local inicioSection = mainTab:AddSection({ Name = "Início" })

inicioSection:AddSlider({
    Name = "WalkSpeed",
    Min = 16, -- Velocidade mínima (padrão Roblox)
    Max = 700, -- Velocidade máxima
   Increment = 1, -- Passo do Slider
      Default = 16,-- Valor Inicial
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
})


Window:SelectTab(MainTab)


--espectar





--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--// Variables
local targetPlayer = nil
local spectating = false

--// GUI
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "PlayerControlGUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local function createButton(name, y, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.AutoButtonColor = false

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    btn.MouseButton1Click:Connect(callback)
end

--// Player list
local playerListFrame = Instance.new("ScrollingFrame", frame)
playerListFrame.Size = UDim2.new(1, -20, 0, 150)
playerListFrame.Position = UDim2.new(0, 10, 0, 120)
playerListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
playerListFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
playerListFrame.BorderSizePixel = 0
playerListFrame.ScrollBarThickness = 6

local function updatePlayerList()
    playerListFrame:ClearAllChildren()
    local yPos = 0
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local btn = Instance.new("TextButton", playerListFrame)
            btn.Size = UDim2.new(1, -10, 0, 25)
            btn.Position = UDim2.new(0, 5, 0, yPos)
            btn.Text = plr.Name
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            btn.AutoButtonColor = false
            btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80) end)
            btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end)

            -- Ao clicar em um jogador, define como alvo
            btn.MouseButton1Click:Connect(function()
                targetPlayer = plr
            end)

            yPos = yPos + 30
        end
    end
    playerListFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

-- Botão atualizar lista
createButton("Atualizar Lista", 10, updatePlayerList)

--// Spectate player
createButton("Espectar", 50, function()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        spectating = true
    end
end)

--// Stop spectate
createButton("Parar Espectar", 85, function()
    spectating = false
end)

--// Teleport to player
createButton("Teleporte", 220, function()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
        end
    end
end)

--// Spectate loop
RunService.RenderStepped:Connect(function()
    if spectating and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local camera = workspace.CurrentCamera
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,5,10)
    else
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end)

-- Atualiza a lista ao iniciar
updatePlayerList()

