--------------------------------------------------
-- LIBRARY
--------------------------------------------------
local Library = loadstring(game:HttpGet(
  "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

--------------------------------------------------
-- WINDOW
--------------------------------------------------
local Window = Library:MakeWindow({
  Title = "Vini Hub🥶🥶",
  SubTitle = "Dev by SrVinicius",
  ScriptFolder = "redz-library-V5"
})

--------------------------------------------------
-- MINIMIZER
--------------------------------------------------
local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

Minimizer:CreateMobileMinimizer({
  Image = "rbxassetid://121080450554891",
  BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})

--------------------------------------------------
-- TABS (ÍCONES DO UTILS)
--------------------------------------------------
local Tab = Window:MakeTab({ Title = "Main", Icon = "diamond" })
local Tab2 = Window:MakeTab({ Title = "Config", Icon = "settings" })
local Tab3 = Window:MakeTab({ Title = "Cuidado", Icon = "alert-triangle" })

Tab:AddSection("Início")

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- ESTADOS
--------------------------------------------------
local AutoDiamonds = false
local AutoArea = false
local AutoClick = false

--------------------------------------------------
-- NOTIFY
--------------------------------------------------
local function Notify(msg)
  Window:Notify({
    Title = "Vini Hub",
    Content = msg,
    Duration = 3
  })
end

--------------------------------------------------
-- REMOTES (COLETA SEGURA)
--------------------------------------------------
local Remotes = {}

for _,v in ipairs(ReplicatedStorage:GetDescendants()) do
  if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
    Remotes[v.Name] = v
  end
end

--------------------------------------------------
-- FIRE (SEM VARARGS)
--------------------------------------------------
local function Fire(remoteName, argsTable)
  local remote = Remotes[remoteName]
  if not remote then return end

  pcall(function()
    if remote:IsA("RemoteEvent") then
      remote:FireServer(argsTable)
    else
      remote:InvokeServer(argsTable)
    end
  end)
end

--------------------------------------------------
-- BREAKABLES (AREA ATUAL)
--------------------------------------------------
local function GetBreakables()
  local list = {}

  for _,v in ipairs(workspace:GetDescendants()) do
    if v.Name == "Breakables" then
      for _,b in ipairs(v:GetChildren()) do
        table.insert(list, b)
      end
    end
  end

  return list
end

local function GetHighestHPBreakable()
  local best = nil
  local highest = 0

  local breakables = GetBreakables()
  for i = 1, #breakables do
    local b = breakables[i]
    local hp = b:FindFirstChild("Health") or b:FindFirstChild("HP")

    if hp and hp.Value > highest then
      highest = hp.Value
      best = b
    end
  end

  return best
end

--------------------------------------------------
-- AUTO CLICK REAL (PETS)
--------------------------------------------------
task.spawn(function()
  while true do
    if AutoClick then
      local target = GetHighestHPBreakable()
      if target then
        Fire("Breakable_Attack", { target })
        Fire("Pets_Attack", { target })
        Fire("AttackBreakable", { target })
      end
    end
    task.wait(0.05)
  end
end)

--------------------------------------------------
-- AUTO FARM DIAMANTE
--------------------------------------------------
task.spawn(function()
  while true do
    if AutoDiamonds then
      local target = GetHighestHPBreakable()
      if target then
        Fire("Breakable_Attack", { target })
        Fire("CollectOrbs", {})
      end
    end
    task.wait(0.1)
  end
end)

--------------------------------------------------
-- AUTO AREA (COMPRA PRÓXIMA)
--------------------------------------------------
task.spawn(function()
  while true do
    if AutoArea then
      Fire("BuyNextArea", {})
      Fire("Areas_BuyNext", {})
    end
    task.wait(1)
  end
end)

--------------------------------------------------
-- BOTÕES (SEU PADRÃO)
--------------------------------------------------
Tab:AddButton({
  Name = "Auto Farm Diamante (REAL)",
  Debounce = 0.3,
  Callback = function()
    AutoDiamonds = not AutoDiamonds
    Notify("Auto Farm Diamante: " .. (AutoDiamonds and "ATIVADO" or "DESATIVADO"))
  end
})

Tab:AddButton({
  Name = "Auto Farm Área (REAL)",
  Debounce = 0.3,
  Callback = function()
    AutoArea = not AutoArea
    Notify("Auto Farm Área: " .. (AutoArea and "ATIVADO" or "DESATIVADO"))
  end
})

Tab:AddButton({
  Name = "Auto Click Pets (REAL)",
  Debounce = 0.3,
  Callback = function()
    AutoClick = not AutoClick
    Notify("Auto Click: " .. (AutoClick and "ATIVADO" or "DESATIVADO"))
  end
})

--------------------------------------------------
-- AVISO
--------------------------------------------------
Tab3:AddButton({
  Name = "Aviso",
  Callback = function()
    Notify("PS99 muda remotes com updates. Ajuste se necessário.")
  end
})
