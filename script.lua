-- Carregar a RedzLib
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- Criar janela
local Window = redzlib:MakeWindow({
    Title = "Vini Hub : Blox Fruits",
    SubTitle = "by Vini 👀",
    SaveFolder = "ViniHubConfig"
})

-- Botão de minimizar
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://71014873973869",
        BackgroundTransparency = 0
    },
    Corner = { CornerRadius = UDim.new(0, 12) }
})

-- Criar tab principal
local main = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://18751483361"
})

-- Criar seção
local Section = main:AddSection({
    Name = "Início"
})

-- Adicionar um texto tipo parágrafo
local Paragraph = main:AddParagraph({
    Name = "Aviso",
    Text = "Isso é um parágrafo.\nSegunda linha OK!"
})

-- Criar diálogo
local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "Este é um diálogo",
    Options = {
        {"Confirm", function() end},
        {"Maybe", function() end},
        {"Cancel", function() end}
    }
})

-- BOTÃO
main:AddButton({
    Name = "Fly",
    Callback = function()
        Fly()
    end
})

-- TOGGLE
local Toggle1 = main:AddToggle({
    Name = "Toggle Exemplo",
    Description = "Um toggle de exemplo",
    Default = false
})

Toggle1:Callback(function(Value)
    print("Toggle:", Value)
end)

-- Segundo toggle
main:AddToggle({
    Name = "Fly",
    Default = false,
    Callback = function(v)
        print("Fly:", v)
    end
})

-- SLIDER
main:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
})







local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local selectedPlayer = nil
local spectating = false

-----------------------------------------------------
-- FUNÇÃO: Atualizar lista de players
-----------------------------------------------------
local function UpdatePlayerList()
    local list = {}

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end

    return list
end

-----------------------------------------------------
-- DROPDOWN DE PLAYERS
-----------------------------------------------------
local PlayerDropdown = main:AddDropdown({
    Name = "Lista de Jogadores",
    Options = UpdatePlayerList(),
    Callback = function(value)
        selectedPlayer = value
    end
})

-----------------------------------------------------
-- BOTÃO: Atualizar lista
-----------------------------------------------------
main:AddButton({
    Name = "Atualizar Lista",
    Callback = function()
        local novaLista = UpdatePlayerList()
        PlayerDropdown:Refresh(novaLista)
    end
})

-----------------------------------------------------
-- FUNÇÃO: Começar a espectar
-----------------------------------------------------
local function StartSpectate()
    if not selectedPlayer then return end

    local target = Players:FindFirstChild(selectedPlayer)
    if not target then return end
    if not target.Character then return end

    local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    spectating = true
    Camera.CameraSubject = humanoid
end

-----------------------------------------------------
-- BOTÃO: Spectar Player
-----------------------------------------------------
main:AddButton({
    Name = "Spectar Player",
    Callback = function()
        StartSpectate()
    end
})

-----------------------------------------------------
-- FUNÇÃO: Parar de espectar
-----------------------------------------------------
local function StopSpectate()
    spectating = false

    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        Camera.CameraSubject = humanoid
    end
end

-----------------------------------------------------
-- BOTÃO: Parar de Spectar
-----------------------------------------------------
main:AddButton({
    Name = "Parar de Spectar",
    Callback = function()
        StopSpectate()
    end
})

-----------------------------------------------------
-- Atualizar lista automaticamente quando players entram/saem
-----------------------------------------------------
Players.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)

Players.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(UpdatePlayerList())
end)








local tornadoAtivo = false

main:AddButton({
    Name = "Tornado",
    Callback = function()
        TornadoVoid()
    end
})



-- Seleciona a Tab
Window:SelectTab(main)

















function Fly()
    print("Fly ativado!")
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















local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")

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

playSound("2865227271") -- Initial sound

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

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Super Ring Parts V6 by Vini Hub"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 204, 204)
Title.Font = Enum.Font.Fondamento
Title.TextSize = 22
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

-- Configuration table
local config = {
    radius = 50,
    height = 100,
    rotationSpeed = 10,
    attractionStrength = 1000,
}

-- Save/load functions
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

-- Function to create control buttons/textboxes
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

-- Tornado function
local tornadoPartsEnabled = false
local parts = {}

local function RetainPart(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(Workspace) then
        if part.Parent == LocalPlayer.Character or part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end
        part.CanCollide = false
        return true
    end
    return false
end

local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

for _, part in pairs(Workspace:GetDescendants()) do
    addPart(part)
end

Workspace.DescendantAdded:Connect(addPart)
Workspace.DescendantRemoving:Connect(function(part)
    local index = table.find(parts, part)
    if index then table.remove(parts, index) end
end)

local function toggleTornado()
    tornadoPartsEnabled = not tornadoPartsEnabled
end

-- Heartbeat for tornado
RunService.Heartbeat:Connect(function()
    if not tornadoPartsEnabled then return end
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local center = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, center.Y, pos.Z) - center).Magnitude
                local angle = math.atan2(pos.Z - center.Z, pos.X - center.X)
                local newAngle = angle + math.rad(config.rotationSpeed)
                local targetPos = Vector3.new(
                    center.X + math.cos(newAngle) * math.min(config.radius, distance),
                    center.Y + (config.height * (math.abs(math.sin((pos.Y - center.Y)/config.height)))),
                    center.Z + math.sin(newAngle) * math.min(config.radius, distance)
                )
                local direction = (targetPos - part.Position).unit
                part.Velocity = direction * config.attractionStrength
            end
        end
    end
end)

-- Button to toggle tornado
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ToggleButton.Text = "Tornado Off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Font = Enum.Font.Fondamento
ToggleButton.TextSize = 18
ToggleButton.Parent = MainFrame

ToggleButton.MouseButton1Click:Connect(function()
    toggleTornado()
    ToggleButton.Text = tornadoPartsEnabled and "Tornado On" or "Tornado Off"
    ToggleButton.BackgroundColor3 = tornadoPartsEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
    playSound("12221967")
end)






















local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Variáveis
local autoClickEnabled = false
local clickDelay = 0.2 -- segundos entre cliques

-- GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExtraButtonsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar botões genéricos
local function addButton(name, position, size, color, text, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = size or UDim2.new(0, 120, 0, 50)
    btn.Position = position or UDim2.new(0.5, -60, 0.5, -25)
    btn.BackgroundColor3 = color or Color3.fromRGB(0, 0, 255)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Fantasy
    btn.TextSize = 18
    btn.Text = text or name
    btn.Parent = ScreenGui
    btn.Active = true

    local dragging, dragInput, dragStart, startPos

    -- Permitir arrastar o botão
    local function update(input)
        local delta = input.Position - dragStart
        btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    btn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    btn.MouseButton1Click:Connect(callback)
end

-- Função para ativar/desativar AutoClick
local function toggleAutoClick()
    autoClickEnabled = not autoClickEnabled
    print("AutoClick:", autoClickEnabled and "ON" or "OFF")
end

-- Criar botão de AutoClick separadamente
addButton("AutoClickButton",
    UDim2.new(0.7, 0, 0.7, 0), -- posição inicial
    UDim2.new(0, 120, 0, 50), -- tamanho
    Color3.fromRGB(0, 255, 0), -- cor
    "AutoClick", -- texto
    toggleAutoClick -- função ao clicar
)

-- Loop do AutoClick (clicando ClickDetectors sob o botão)
RunService.Heartbeat:Connect(function()
    if autoClickEnabled then
        local btn = ScreenGui:FindFirstChild("AutoClickButton")
        if btn then
            local centerPos = btn.AbsolutePosition + btn.AbsoluteSize/2
            local ray = workspace.CurrentCamera:ScreenPointToRay(centerPos.X, centerPos.Y)
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
            local raycastResult = workspace:Raycast(ray.Origin, ray.Direction * 1000, raycastParams)
            if raycastResult then
                local target = raycastResult.Instance
                if target then
                    local clickDetector = target:FindFirstChildOfClass("ClickDetector")
                    if clickDetector then
                        clickDetector:ClickDetector(target, LocalPlayer)
                    end
                end
            end
        end
    end
end)
