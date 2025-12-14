local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()

local Window = Library:MakeWindow({
  Title = "Vini Hub🥶🥶",
  SubTitle = "Dev by SrVinicius",
  ScriptFolder = "redz-library-V5"
})






local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
  Image = "rbxassetid://121080450554891",
  BackgroundColor3 = Color3.fromRGB(0, 0, 0)
})


--TAB 1

local Tab = Window:MakeTab({
  Title = "Main",
  Icon = "Home"
})




--TAB 2

local Tab2 = Window:MakeTab({
  Title = "Config",
  Icon = "gear"
})




--TAB 3

local Tab3 = Window:MakeTab({
  Title = "Cuidado",
  Icon = "alarm"
})





local InicionSection = Tab:AddSection("Início")








--Botão de Tornado 

Tab:AddButton({
  Name = "Tornado",
  Debounce = 0.5,
  Callback = function()
      Tornado()
  end
})






--Botão de voar

Tab:AddButton({
  Name = "Fly",
  Debounce = 0.5,
  Callback = function()
    Fly()
  end
})




--Slider de WalkSpeed/Speed

Tab:AddSlider({
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








--TORNADO



function Tornado()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- Sound Effects
local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Play initial sound
playSound("2865227271")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRingPartsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 500)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Make the GUI round
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "TORNADO OP 🥵	by SrViniciusofc👻👻"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 204, 204)
Title.Font = Enum.Font.Fondamento
Title.TextSize = 22
Title.Parent = MainFrame

-- Round the title
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleButton.Text = "Ring off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Font = Enum.Font.Fondamento
ToggleButton.TextSize = 18
ToggleButton.Parent = MainFrame

-- Round the toggle button
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = ToggleButton

-- Configuration table
local config = {
    radius = 50,
    height = 100,
    rotationSpeed = 10,
    attractionStrength = 1000,
}

-- Save and load functions
local function saveConfig()
    local configStr = HttpService:JSONEncode(config)
    writefile("SuperRingPartsConfig.txt", configStr)
end

local function loadConfig()
    if isfile("SuperRingPartsConfig.txt") then
        local configStr = readfile("SuperRingPartsConfig.txt")
        config = HttpService:JSONDecode(configStr)
    end
end

loadConfig()

-- Function to create control buttons and textboxes
local function createControl(name, positionY, color, labelText, defaultValue, callback)
    local DecreaseButton = Instance.new("TextButton")
    DecreaseButton.Size = UDim2.new(0.2, 0, 0, 40)
    DecreaseButton.Position = UDim2.new(0.1, 0, positionY, 0)
    DecreaseButton.Text = "-"
    DecreaseButton.BackgroundColor3 = color
    DecreaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    DecreaseButton.Font = Enum.Font.Fondamento
    DecreaseButton.TextSize = 18
    DecreaseButton.Parent = MainFrame

    local IncreaseButton = Instance.new("TextButton")
    IncreaseButton.Size = UDim2.new(0.2, 0, 0, 40)
    IncreaseButton.Position = UDim2.new(0.7, 0, positionY, 0)
    IncreaseButton.Text = "+"
    IncreaseButton.BackgroundColor3 = color
    IncreaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    IncreaseButton.Font = Enum.Font.Fondamento
    IncreaseButton.TextSize = 18
    IncreaseButton.Parent = MainFrame

    local Display = Instance.new("TextLabel")
    Display.Size = UDim2.new(0.4, 0, 0, 40)
    Display.Position = UDim2.new(0.3, 0, positionY, 0)
    Display.Text = labelText .. ": " .. defaultValue
    Display.BackgroundColor3 = Color3.fromRGB(255, 153, 51)
    Display.TextColor3 = Color3.fromRGB(0, 0, 0)
    Display.Font = Enum.Font.Fondamento
    Display.TextSize = 18
    Display.Parent = MainFrame

    -- Add TextBox for input
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.8, 0, 0, 35)
    TextBox.Position = UDim2.new(0.1, 0, positionY + 0.1, 0)
    TextBox.PlaceholderText = "Enter " .. labelText
    TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextBox.Font = Enum.Font.Fondamento
    TextBox.TextSize = 18
    TextBox.Parent = MainFrame

    local TextBoxCorner = Instance.new("UICorner")
    TextBoxCorner.CornerRadius = UDim.new(0, 10)
    TextBoxCorner.Parent = TextBox

    DecreaseButton.MouseButton1Click:Connect(function()
        local value = tonumber(Display.Text:match("%d+"))
        value = math.max(0, value - 10)
        Display.Text = labelText .. ": " .. value
        callback(value)
        playSound("12221967")
        saveConfig()
    end)

    IncreaseButton.MouseButton1Click:Connect(function()
        local value = tonumber(Display.Text:match("%d+"))
        value = math.min(10000, value + 10)
        Display.Text = labelText .. ": " .. value
        callback(value)
        playSound("12221967")
        saveConfig()
    end)

    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local newValue = tonumber(TextBox.Text)
            if newValue then
                newValue = math.clamp(newValue, 0, 10000)
                Display.Text = labelText .. ": " .. newValue
                TextBox.Text = ""
                callback(newValue)
                playSound("12221967")
                saveConfig()
            else
                TextBox.Text = ""
            end
        end
    end)
end

createControl("Radius", 0.2, Color3.fromRGB(153, 153, 0), "Radius", config.radius, function(value)
    config.radius = value
    saveConfig()
end)

createControl("Height", 0.4, Color3.fromRGB(153, 0, 153), "Height", config.height, function(value)
    config.height = value
    saveConfig()
end)

createControl("RotationSpeed", 0.6, Color3.fromRGB(0, 153, 153), "Rotation Speed", config.rotationSpeed, function(value)
    config.rotationSpeed = value
    saveConfig()
end)

createControl("AttractionStrength", 0.8, Color3.fromRGB(153, 0, 0), "Attraction Strength", config.attractionStrength, function(value)
    config.attractionStrength = value
    saveConfig()
end)

-- Add minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.Font = Enum.Font.Fondamento
MinimizeButton.TextSize = 15
MinimizeButton.Parent = MainFrame

-- Round the minimize button
local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 15)
MinimizeCorner.Parent = MinimizeButton

-- Minimize functionality
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
        for _, child in pairs(MainFrame:GetChildren()) do
            if child:IsA("GuiObject") and child ~= Title and child ~= MinimizeButton then
                child.Visible = false
            end
        end
    else
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 500), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "-"
        for _, child in pairs(MainFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Visible = true
            end
        end
    end
    playSound("12221967")
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Ring Parts Claim
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

-- Edits
local ringPartsEnabled = false

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(config.rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(config.radius, distance),
                    tornadoCenter.Y + (config.height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / config.height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(config.radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * config.attractionStrength
            end
        end
    end
end)

-- Button functionality
ToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    ToggleButton.Text = ringPartsEnabled and "Tornado On" or "Tornado Off"
    ToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
    playSound("12221967")
end)

-- Get player thumbnail
local userId = Players:GetUserIdFromNameAsync("GlenAtkinson56422")
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

StarterGui:SetCore("SendNotification", {
    Title = "Ei",
    Text = "Presta pra nada, aproveita o script 🖕",
    Icon = content,
    Duration = 5
})

StarterGui:SetCore("SendNotification", {
    Title = "Presta atenção gay",
    Text = "Use com Responsabilidade",
    Icon = content,
    Duration = 5
})

StarterGui:SetCore("SendNotification", {
    Title = "Script ativado",
    Text = "O SCRIPT JA TA ATIVO GAY!!",
    Icon = content,
    Duration = 5
})


-- Rainbow Background Effect
local hue = 0
RunService.Heartbeat:Connect(function()
    hue = (hue + 0.01) % 1
    MainFrame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- Rainbow TextLabel
local textHue = 0
RunService.Heartbeat:Connect(function()
    textHue = (textHue + 0.01) % 1
    Title.TextColor3 = Color3.fromHSV(textHue, 1, 1)
end)


-- fly gui

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "Fly gui"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,0,255)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(1,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "Fly Gui"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
end)

-- no fall damage
local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "no fall damage"
TextButton1.BackgroundColor3 = Color3.fromRGB(255,0,0)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.9,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "No fall Damage"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
-- No Fall Damage by Pio (Discord: piomanly or ID: 311397526399877122) --
local runsvc = game:GetService("RunService")
local heartbeat = runsvc.Heartbeat
local rstepped = runsvc.RenderStepped

local lp = game.Players.LocalPlayer

local novel = Vector3.zero

local function nofalldamage(chr)
    local root = chr:WaitForChild("HumanoidRootPart")
    
    if root then
        local con
        con = heartbeat:Connect(function()
            if not root.Parent then
                con:Disconnect()
            end
            
            local oldvel = root.AssemblyLinearVelocity
            root.AssemblyLinearVelocity = novel
            
            rstepped:Wait()
            root.AssemblyLinearVelocity = oldvel
        end)
    end
end

nofalldamage(lp.Character)
    lp.CharacterAdded:Connect(nofalldamage)
end)

-- noclip
local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "noclip"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.8,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "Noclip"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end)

-- Inf jump

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "Inf jump"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,255,0)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.7,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "Inf jump"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
local InfiniteJumpEnabled = true game:GetService("UserInputService").JumpRequest:connect(function() 	if InfiniteJumpEnabled then 		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") 	end end)
end)

-- Inf yield

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "Inf yield"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,255,255)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.6,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "Inf yield"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

-- nameless admin

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "nameless admin"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.5,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "NAMELESS"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Nameless-Admin-FE-11243"))()
end)

-- fps

local TextButton1 = Instance.new("TextButton") 
TextButton1.Parent = MainFrame
TextButton1.Name = "FPS"
TextButton1.BackgroundColor3 = Color3.fromRGB(0,0,0)
TextButton1.BackgroundTransparency = 0
TextButton1.BorderSizePixel = 1
TextButton1.BorderColor3 = Color3.fromRGB(17,17,17)
TextButton1.Position = UDim2.new(0.4,0,1)
TextButton1.Size = UDim2.new(0.08,0,0.1)
TextButton1.Font = Enum.Font.Legacy
TextButton1.TextColor3 = Color3.fromRGB(242,243,243)
TextButton1.Text = "FPS"
TextButton1.TextSize = 18
TextButton1.TextScaled = true
TextButton1.TextWrapped = true
TextButton1.Visible = true
TextButton1.Active = true

TextButton1.MouseButton1Click:Connect(function() 
loadstring(game:HttpGet("https://pastebin.com/raw/ySHJdZpb",true))()
end)
end











--FLY GUI V3



function Fly()

local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FLY GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "FLY GUI V3";
	Text = "BY XNEO";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
end






--ESPECTAR

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local selectedPlayer = nil
local spectating = false

-- FUNÇÃO: Atualizar lista de players
local function UpdatePlayerList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

-- DROPDOWN DE PLAYERS
local PlayerDropdown = Tab:AddDropdown({
    Name = "Lista de Jogadores",
    Options = UpdatePlayerList(),
    Callback = function(value)
        selectedPlayer = value
    end
})

-- BOTÃO: Atualizar lista
Tab:AddButton({
    Name = "Atualizar Lista",
    Callback = function()
        local novaLista = UpdatePlayerList()
        PlayerDropdown:Refresh(novaLista)
    end
})

-- FUNÇÃO: Começar a espectar
local function StartSpectate()
    if not selectedPlayer then return end
    local target = Players:FindFirstChild(selectedPlayer)
    if not target or not target.Character then return end
    local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    spectating = true
    Camera.CameraSubject = humanoid
end

-- BOTÃO: Spectar Player
Tab:AddButton({
    Name = "Spectar Player",
    Callback = function()
        StartSpectate()
    end
})

-- FUNÇÃO: Parar de espectar
local function StopSpectate()
    spectating = false
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        Camera.CameraSubject = humanoid
    end
end

-- BOTÃO: Parar de Spectar
Tab:AddButton({
    Name = "Parar de Spectar",
    Callback = function()
        StopSpectate()
    end
})

-- Atualizar lista automaticamente quando players entram/saem
Players.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)

Players.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)






--ANTI-AFK


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

local antiAFKEnabled = false

-- Toggle na sua tab "main"
Tab2:AddToggle({
    Name = "Anti-AFK",
    Default = false,
    Callback = function(value)
        antiAFKEnabled = value
    end
})

-- Conexão para prevenir AFK
LocalPlayer.Idled:Connect(function()
    if antiAFKEnabled then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("Anti-AFK ativado: ação simulada")
    end
end)






--TELEPORTE POR TOQUE


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local StarterGui = game:GetService("StarterGui")

local TeleportEnabled = false -- DESATIVADO AO INICIAR

local function Notify(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 4
    })
end

local function TeleportFromTouch(position)
    if not TeleportEnabled then return end -- só funciona se o toggle estiver ligado

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local ray = Camera:ScreenPointToRay(position.X, position.Y)

        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Blacklist
        params.FilterDescendantsInstances = { LocalPlayer.Character }

        local result = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
        if result then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(result.Position)
            Notify("Teleporte", "Você foi teleportado para o local tocado!")
        else
            Notify("Erro", "Não encontrei nenhum lugar tocado no mapa!")
        end
    end
end

-- Detecta toque na tela
UserInputService.InputBegan:Connect(function(input)
    if TeleportEnabled and input.UserInputType == Enum.UserInputType.Touch then
        TeleportFromTouch(input.Position)
    end
end)

-- 🔥 Toggle na Redz Library
Tab:AddToggle({
    Title = "Teleporte Por Toque",
    Description = "Clique para teleportar para onde tocar na tela",
    Default = false,
    Callback = function(state)
        TeleportEnabled = state
        if state then
            Notify("Teleport Ativado", "Toque na tela para teleportar.")
        else
            Notify("Teleport Desativado", "Toque não teleporta mais.")
        end
    end
})


















--PUXAR TUDO DO MAPA





-- Botão (exemplo)
Tab3:AddButton({
    Name = "PUXAR TUDO DO MAPA",
    Debounce = 0.5,
    Callback = function()
        PUXARALL()
    end
})

-- Função Tornado no estilo toggle (varre workspace a cada frame)
function PUXARALL()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    -- inicializa variáveis globais se precisar
    if getgenv().TornadoEnabled == nil then
        getgenv().TornadoEnabled = false
    end

    -- alterna estado
    getgenv().TornadoEnabled = not getgenv().TornadoEnabled
    print("Tornado:", getgenv().TornadoEnabled and "ON" or "OFF")

    -- se desligar, desconecta a conexão existente
    if not getgenv().TornadoEnabled then
        if getgenv().TornadoConnection then
            pcall(function() getgenv().TornadoConnection:Disconnect() end)
            getgenv().TornadoConnection = nil
        end
        return
    end

    -- evitar múltiplas conexões
    if getgenv().TornadoConnection then return end

    -- conexão principal: tenta teleportar partes a cada Heartbeat
    getgenv().TornadoConnection = RunService.Heartbeat:Connect(function()
        if not getgenv().TornadoEnabled then return end

        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
        if not hrp then return end

        -- varre workspace inteiro (mais confiável que usar um cache)
        for _, obj in ipairs(workspace:GetDescendants()) do
            -- teleporta apenas BasePart e que NÃO sejam parte do seu personagem
            if obj:IsA("BasePart") and not obj:IsDescendantOf(char) then
                -- evita tentar mover objetos das Gui/Camera/Players
                if not obj:FindFirstAncestorWhichIsA("Player") then
                    -- tentativa segura (pcall) para não quebrar o loop
                    pcall(function()
                        -- Teleporta para abaixo do player (-3 Y)
                        obj.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
                        -- se quiser, pode também setar CanCollide = false
                        -- obj.CanCollide = false
                    end)
                end
            end
        end
    end)
end










--Puxar Todos os Itens 






Tab3:AddButton({
    Name = "Puxar Todos os Itens",
    Debounce = 0.5,
    Callback = function()
        Puxar()
    end
})

function Puxar()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Lista de partes puxadas temporariamente
    local pulled = {}

    -- Primeiro: puxa os objetos 1 vez
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then

            local isValid =
                obj.Anchored == false and
                obj.Size.Magnitude < 20 and
                not obj:IsDescendantOf(char) and
                obj.CanCollide == true and
                obj.Parent ~= workspace.Terrain

            if isValid then
                pcall(function()
                    obj.CFrame = hrp.CFrame * CFrame.new(0, -4, 0)
                    table.insert(pulled, obj)
                end)
            end
        end
    end

    -- Depois de 1 segundo, ele SOLTA tudo (não fica grudado)
    task.delay(1, function()
        for _, part in ipairs(pulled) do
            if part and part:IsA("BasePart") then
                pcall(function()
                    -- joga um pouco pro lado pra não grudar
                    part.CFrame = part.CFrame * CFrame.new(math.random(-6,6), 2, math.random(-6,6))
                end)
            end
        end
    end)
end













--Bring foods

Tab:AddButton({
    Name = "Trazer comida",
    Debounce = 0.5,
    Callback = function(btn) -- btn pode ser nil dependendo da lib
        -- função segura pra setar texto do botão (se existir)
        local function safeSetText(t)
            if typeof(btn) == "table" and typeof(btn.Text) == "string" then
                pcall(function() btn.Text = t end)
            end
        end

        safeSetText("Working...")
        local count = 0

        local items = {
            "ChocolateBar",
            "CannedBread",
            "KelpShake",
            "Acorn",
            "JellyPatty",
            "BlueJellyPatty",
            "KrabbyPatty"
        }

        -- checa LootDrops
        local root = workspace:FindFirstChild("LootDrops")
        if not root then
            warn("[Bring Food] workspace.LootDrops nao encontrado")
            safeSetText("No LootDrops")
            task.wait(1.5)
            safeSetText("Bring Food")
            return
        end

        -- função que traz um BasePart até o player (1 vez)
        local function bringPart(part)
            if not part or not part:IsA("BasePart") then return false end
            local player = game:GetService("Players").LocalPlayer
            if not player then return false end
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end

            -- tentativa segura
            local ok, err = pcall(function()
                -- física estável: mantemos CanCollide = true pra evitar atravessar chão
                part.Anchored = false
                part.CanCollide = true
                -- posição segura: um pouco à frente do player
                local destino = hrp.CFrame * CFrame.new(0, -2, -4)
                part:PivotTo(destino)
            end)

            if not ok then
                warn("[Bring Food] falha ao trazer:", part, err)
            end
            return ok
        end

        -- varrer LootDrops
        for _, v in ipairs(root:GetDescendants()) do
            if v and v:IsA("BasePart") and table.find(items, v.Name) then
                if pcall(function() return bringPart(v) end) then
                    count = count + 1
                    task.wait(0.06) -- pequeno delay pra não estourar física
                end
            end
        end

        if count > 0 then
            safeSetText("Brought "..count.."!")
        else
            safeSetText("No Food")
        end

        task.wait(1.6)
        safeSetText("Bring Food")
    end
})
















--BRING GELEIAS 




Tab:AddButton({
    Name = "Trazer geleias",
    Debounce = 0.5,
    Callback = function(_btn) -- ignoramos _btn, pois sua lib não suporta set de texto
        local Players = game:GetService("Players")
        local plr = Players.LocalPlayer
        if not plr then
            warn("[Bring Jelly] LocalPlayer não encontrado")
            return
        end

        local root = workspace:FindFirstChild("LootDrops")
        if not root then
            warn("[Bring Jelly] workspace.LootDrops não encontrado")
            return
        end

        -- função de bring segura
        local function bring(part)
            if not part or not part:IsA("BasePart") then return false end
            local char = plr.Character or plr.CharacterAdded:Wait()
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end

            local ok, err = pcall(function()
                part.Anchored = false
                part.CanCollide = true
                local dest = hrp.CFrame * CFrame.new(0, -2, -4)
                part:PivotTo(dest)
            end)

            if not ok then
                warn("[Bring Jelly] falha ao trazer:", part, err)
            end
            return ok
        end

        -- varre e traz itens com "Jelly" no nome
        local count = 0
        for _, v in ipairs(root:GetDescendants()) do
            if v and v:IsA("BasePart") and tostring(v.Name):find("Jelly") then
                pcall(function() -- proteger cada tentativa
                    if bring(v) then
                        count = count + 1
                    end
                end)
                task.wait(0.06)
            end
        end

        if count > 0 then
            warn("[Bring Jelly] Trouxe "..count.." geleia(s).")
        else
            warn("[Bring Jelly] Sem geleia encontrada.")
        end
    end
})










--Bring Scrap







Tab:AddButton({
    Name = "Trazer Scrap",
    Debounce = 0.5,
    Callback = (function()
        local busy = false -- debounce local pra garantir que não execute duas vezes junto

        return function(btn) -- btn existe, mas não mexemos em btn.Text
            if busy then
                warn("[Bring Scrap] Ação já em execução.")
                return
            end
            busy = true

            local Players = game:GetService("Players")
            local plr = Players.LocalPlayer
            if not plr then
                warn("[Bring Scrap] LocalPlayer não encontrado.")
                busy = false
                return
            end

            local root = workspace:FindFirstChild("LootDrops")
            if not root then
                warn("[Bring Scrap] workspace.LootDrops não encontrado.")
                busy = false
                return
            end

            local scrapList = {
                "ToxicBarrel","BrokenMotorcycle","CyclopsHelmet","RubberTire","Muffler","OpenCan",
                "ScrapMetal","ScrapPile","MetalPlate","EngineBlock","WornGear","RustyPipe","OldWires"
            }
            local function isScrapName(name)
                for _, s in ipairs(scrapList) do
                    if s == name then return true end
                end
                return false
            end

            -- retorna o primeiro BasePart válido dentro de um objeto (self/internals)
            local function findPartInObject(obj)
                if not obj then return nil end
                if obj:IsA("BasePart") then return obj end
                if obj:IsA("Model") then
                    if obj.PrimaryPart and obj.PrimaryPart:IsA("BasePart") then
                        return obj.PrimaryPart
                    end
                    for _, d in ipairs(obj:GetDescendants()) do
                        if d:IsA("BasePart") then return d end
                    end
                else
                    for _, d in ipairs(obj:GetDescendants()) do
                        if d:IsA("BasePart") then return d end
                    end
                end
                return nil
            end

            local function bringPart(part, hrp)
                if not part or not part:IsA("BasePart") then return false, "not a basepart" end
                local ok, err = pcall(function()
                    -- tentativa segura: anchor temporariamente e move
                    part.Anchored = true
                    part:PivotTo(hrp.CFrame * CFrame.new(0, -2, -4))
                    -- opcional: manter ancorado por 0.05s pra estabilidade e soltar depois
                    task.delay(0.06, function()
                        pcall(function() part.Anchored = false end)
                    end)
                end)
                return ok, err
            end

            local function bringModel(model, hrp)
                if not model or not model:IsA("Model") then return false, "not a model" end
                -- se tem PrimaryPart, usa SetPrimaryPartCFrame
                if model.PrimaryPart then
                    local ok, err = pcall(function()
                        model:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(0, -2, -4))
                    end)
                    return ok, err
                else
                    -- fallback: pega qualquer BasePart dentro do model e move
                    local p = findPartInObject(model)
                    if p then
                        return bringPart(p, hrp)
                    end
                    return false, "nenhum basepart no model"
                end
            end

            local count = 0
            local plrChar = plr.Character
            if not plrChar then
                -- tenta esperar um pouco se a char não existir
                plrChar = plr.CharacterAdded and plr.CharacterAdded:Wait()
            end

            local hrp = plrChar and plrChar:FindFirstChild("HumanoidRootPart")
            if not hrp then
                warn("[Bring Scrap] HumanoidRootPart não encontrado no personagem.")
                busy = false
                return
            end

            -- iterar pelos filhos diretos e descendants caso seja necessário
            local candidates = {}
            for _, v in ipairs(root:GetDescendants()) do
                -- consideramos Models ou BaseParts: verificamos nomes no próprio objeto e nos descendentes
                local nameMatch = false
                if v.Name and isScrapName(v.Name) then
                    nameMatch = true
                else
                    -- se for model, checar nome dos descendentes também
                    for _, d in ipairs(v:GetDescendants()) do
                        if d.Name and isScrapName(d.Name) then
                            nameMatch = true
                            break
                        end
                    end
                end
                if nameMatch then
                    table.insert(candidates, v)
                end
            end

            if #candidates == 0 then
                warn("[Bring Scrap] Nenhum item da scrapList encontrado em LootDrops.")
                busy = false
                return
            end

            for _, item in ipairs(candidates) do
                -- pra cada candidato, tentamos mover de forma apropriada
                local success, why = false, nil
                if item:IsA("Model") then
                    success, why = bringModel(item, hrp)
                else
                    -- pode ser um part profundo: pegar o BasePart real
                    local part = item:IsA("BasePart") and item or findPartInObject(item)
                    if part then
                        success, why = bringPart(part, hrp)
                    else
                        success, why = false, "nenhum BasePart encontrado"
                    end
                end

                if success then
                    count = count + 1
                else
                    warn(("[Bring Scrap] Falha ao trazer '%s' : %s"):format(tostring(item:GetFullName()), tostring(why)))
                end

                task.wait(0.06) -- delay pra estabilidade física
            end

            if count > 0 then
                warn("[Bring Scrap] Trouxe "..count.." item(s) da lista.")
            else
                warn("[Bring Scrap] Nenhum item movido com sucesso.")
            end

            busy = false
        end
    end)()
})








--Bring bandagem





Tab:AddButton({
    Name = "Trazer Bandagens",
    Debounce = 0.5,
    Callback = (function()

        local busy = false

        return function(btn)
            if busy then
                warn("[Bring Bandages] Ação já em execução.")
                return
            end
            busy = true

            local Players = game:GetService("Players")
            local plr = Players.LocalPlayer
            if not plr then
                warn("[Bring Bandages] LocalPlayer não encontrado.")
                busy = false
                return
            end

            local root = workspace:FindFirstChild("LootDrops")
            if not root then
                warn("[Bring Bandages] workspace.LootDrops não encontrado.")
                busy = false
                return
            end

            -- Lista válida
            local bandageList = {
                ["Bandage"] = true,
                ["BandagePack"] = true
            }

            local function findBasePart(obj)
                if not obj then return nil end
                if obj:IsA("BasePart") then return obj end
                if obj:IsA("Model") then
                    if obj.PrimaryPart and obj.PrimaryPart:IsA("BasePart") then
                        return obj.PrimaryPart
                    end
                    for _, d in ipairs(obj:GetDescendants()) do
                        if d:IsA("BasePart") then return d end
                    end
                else
                    for _, d in ipairs(obj:GetDescendants()) do
                        if d:IsA("BasePart") then return d end
                    end
                end
                return nil
            end

            local function bringPart(part, hrp)
                local ok, err = pcall(function()
                    part.Anchored = true
                    part:PivotTo(hrp.CFrame * CFrame.new(0, -2, -4))
                    task.delay(0.06, function()
                        pcall(function() part.Anchored = false end)
                    end)
                end)
                return ok, err
            end

            local function bringModel(model, hrp)
                if model.PrimaryPart then
                    local ok, err = pcall(function()
                        model:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(0, -2, -4))
                    end)
                    return ok, err
                else
                    local p = findBasePart(model)
                    if p then
                        return bringPart(p, hrp)
                    end
                end
                return false, "nenhum BasePart"
            end

            local char = plr.Character or plr.CharacterAdded:Wait()
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then
                warn("[Bring Bandages] HRP não encontrado.")
                busy = false
                return
            end

            local candidates = {}
            for _, v in ipairs(root:GetDescendants()) do
                if bandageList[v.Name] then
                    table.insert(candidates, v)
                end
            end

            if #candidates == 0 then
                warn("[Bring Bandages] Nenhuma Bandage encontrada.")
                busy = false
                return
            end

            local count = 0

            for _, item in ipairs(candidates) do
                local ok
                if item:IsA("Model") then
                    ok = select(1, bringModel(item, hrp))
                else
                    local part = item:IsA("BasePart") and item or findBasePart(item)
                    if part then
                        ok = select(1, bringPart(part, hrp))
                    end
                end

                if ok then
                    -- <-- correção: atribuição em Lua
                    count = count + 1
                end

                task.wait(0.06)
            end

            warn("[Bring Bandages] Trouxe "..count.." bandagem(ns).")
            busy = false
        end

    end)()
})



















--TESTE




-- AUTO FARM INIMIGOS COM BOTÃO (REDZ UI)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- CONFIG
local EnemiesFolder = workspace:WaitForChild("Enemies") -- MUDE SE PRECISAR
local AutoFarm = false
local Damage = 10
local Distance = 5

-- FUNÇÃO: inimigo mais próximo
local function getNearestEnemy()
    local nearest, dist = nil, math.huge

    for _, enemy in pairs(EnemiesFolder:GetChildren()) do
        if enemy:FindFirstChild("Humanoid")
        and enemy.Humanoid.Health > 0
        and enemy:FindFirstChild("HumanoidRootPart") then

            local d = (enemy.HumanoidRootPart.Position - HRP.Position).Magnitude
            if d < dist then
                dist = d
                nearest = enemy
            end
        end
    end

    return nearest
end

-- LOOP AUTO FARM
RunService.Heartbeat:Connect(function()
    if not AutoFarm then return end

    local enemy = getNearestEnemy()
    if enemy then
        HRP.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, Distance)
        enemy.Humanoid:TakeDamage(Damage)
    end
end)

-- BOTÃO NA REDZ UI
Tab:AddButton({
    Name = "Auto Farm Inimigos",
    Debounce = 0.3,
    Callback = function()
        AutoFarm = not AutoFarm
        warn("Auto Farm:", AutoFarm and "LIGADO" or "DESLIGADO")
    end
})
