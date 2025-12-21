-- Vinibrook INITIAL - Redz V5 + Delta
-- Jogo: Brookhaven 🏡RP
-- Executor: Delta (Mobile)
-- Versão inicial funcional (UI base)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Carregar Redz Library V5
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

if not Library then
    warn("Falha ao carregar Redz Library")
    return
end

-- Criar Janela
local Window = Library:CreateWindow({
    Name = "Vinibrook Hub [Inicial]",
    SubTitle = "Brookhaven | Delta",
    SaveConfig = false
})

-- Aba Principal
local MainTab = Window:CreateTab("Principal")

MainTab:CreateButton({
    Name = "Teste de Execução",
    Callback = function()
        print("Vinibrook: Script executando corretamente")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Vinibrook",
            Text = "UI funcionando no Delta ✅",
            Duration = 3
        })
    end
})

-- Aba Brookhaven
local BrookTab = Window:CreateTab("Brookhaven")

BrookTab:CreateButton({
    Name = "Velocidade x2",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 32
        end
    end
})

BrookTab:CreateButton({
    Name = "Resetar Velocidade",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 16
        end
    end
})

-- Aba Debug
local DebugTab = Window:CreateTab("Debug")

DebugTab:CreateButton({
    Name = "Print Jogador",
    Callback = function()
        print("Jogador:", game.Players.LocalPlayer.Name)
    end
})

print("Vinibrook inicial carregado com sucesso")
