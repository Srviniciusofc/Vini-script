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







InicionSection:AddSlider({
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











