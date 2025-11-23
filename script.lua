local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
  Title = "Vini Hub 🙈 : Blox Fruits",
  SubTitle = "by VINICIUS 👻",
  SaveFolder = "testando | redz lib v5.lua"
})


Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})



local MainTab = Window:MakeTab({"Main", "cherry"})


  redzlib:SetTheme("Purple")
  
  
  
  
  Window:SelectTab(MainTab)
  
  
  local InicioSection = MainTab:AddSection({"Inicio"})
  
  
  InicioSection:AddButton({"Print", function(Value)
print("Hello World!")
end})