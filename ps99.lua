-- LIBRARY
local Library = loadstring(game:HttpGet(
  "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

-- WINDOW
local Window = Library:MakeWindow({
  Title = "Vini Hub🥶🥶",
  SubTitle = "Dev by SrVinicius",
  ScriptFolder = "redz-library-V5"
})

-- MINIMIZER
local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

Minimizer:CreateMobileMinimizer({
  Image = "rbxassetid://121080450554891",
  BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})

--------------------------------------------------
-- TABS (COM ÍCONES DO UTILS)
--------------------------------------------------

-- MAIN
local Tab = Window:MakeTab({
  Title = "Main",
  Icon = "diamond"
})

-- CONFIG
local Tab2 = Window:MakeTab({
  Title = "Config",
  Icon = "settings"
})

-- CUIDADO
local Tab3 = Window:MakeTab({
  Title = "Cuidado",
  Icon = "alert-triangle"
})

--------------------------------------------------
-- SECTION (DO JEITO QUE VOCÊ USA)
--------------------------------------------------
Tab:AddSection("Início")

--------------------------------------------------
-- VARIÁVEIS
--------------------------------------------------
local AutoDiamonds = false
local AutoArea = false
local AutoClick = false

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- FUNÇÕES
--------------------------------------------------

local function StartAutoDiamonds()
  task.spawn(function()
    while AutoDiamonds do
      local char = LocalPlayer.Character
      if char and char:FindFirstChild("HumanoidRootPart") then
        -- mantém ativo / farm passivo
        char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
      end
      task.wait(0.2)
    end
  end)
end

local function StartAutoArea()
  task.spawn(function()
    while AutoArea do
      local char = LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
        -- evita ficar parado
        char.Humanoid:Move(Vector3.new(0, 0, -1), true)
      end
      task.wait(0.5)
    end
  end)
end

local function StartAutoClick()
  task.spawn(function()
    while AutoClick do
      -- click insano
      pcall(function()
        mouse1click()
      end)
      task.wait()
    end
  end)
end

--------------------------------------------------
-- BOTÕES (EXATAMENTE COMO SEU EXEMPLO)
--------------------------------------------------

Tab:AddButton({
  Name = "Auto Farm Diamante",
  Debounce = 0.3,
  Callback = function()
    AutoDiamonds = not AutoDiamonds
    if AutoDiamonds then
      StartAutoDiamonds()
    end
  end
})

Tab:AddButton({
  Name = "Auto Farm Área",
  Debounce = 0.3,
  Callback = function()
    AutoArea = not AutoArea
    if AutoArea then
      StartAutoArea()
    end
  end
})

Tab:AddButton({
  Name = "Auto Click INSANO",
  Debounce = 0.1,
  Callback = function()
    AutoClick = not AutoClick
    if AutoClick then
      StartAutoClick()
    end
  end
})

--------------------------------------------------
-- AVISO
--------------------------------------------------

Tab3:AddButton({
  Name = "Aviso",
  Debounce = 0.5,
  Callback = function()
    warn("Use por sua conta e risco 😈")
  end
})
