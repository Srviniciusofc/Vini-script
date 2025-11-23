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


local MainTab = Window:MakeTab({ "Main", "Home" })

