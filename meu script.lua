local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Vini hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

main:AddSection({
	Name = "Verificar jogadores"
})

main:AddButton({
	Name = "Mostrar número de players",
	Callback = function()
   local Players = game.Players
   print(#Players:GetChildren())
	end
})