local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()



local Window = OrionLib:MakeWindow({Name = "Vini Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "Vini v1"})




local Main = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



local Section = Tab:AddSection({
	Name = "Section"
})



Tab:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})