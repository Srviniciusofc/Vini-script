
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
  Title = "Vini Hub : Blox Fruits",
  SubTitle = "by Vini 👀",
  SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local main = Window:MakeTab({"main", "cherry"})

discord:AddDiscordInvite({
    Name = "AETHERLAND",
    Description = "Join server",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.gg/E7PPSwPh36",
})

Window:SelectTab(main)

local Section = Mmin:AddSection({"Section"})

local Paragraph = Main:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})

  local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
      {"Confirm", function()
        
      end},
      {"Maybe", function()
        
      end},
      {"Cancel", function()
        
      end}
    }
  })
  
  main:AddButton({"Print", function(Value)
print("Hello World!")
end})

local Toggle1 = main:AddToggle({
  Name = "Toggle",
  Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
  Default = false 
})
Toggle1:Callback(function(Value)
 
end)

main:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(v)

    end
})

main:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
  
  end
})

local Dropdown = main:AddDropdown({
  Name = "Players List",
  Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
  Options = {"one", "two", "three"},
  Default = "two",
  Flag = "dropdown teste",
  Callback = function(Value)
    
  end
})

main:AddTextBox({
  Name = "Name item",
  Description = "1 Item on 1 Server", 
  PlaceholderText = "item only",
  Callback = function(Value)
    
  end
})