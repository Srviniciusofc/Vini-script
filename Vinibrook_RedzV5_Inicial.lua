-- Vinibrook Hub | Redz V5
-- Brookhaven 🏡RP | Delta Executor (Mobile)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Carregar Redz Library V5 (oficial tlredz)
local redzlib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/main/redz-V5-remake/main.luau"
))()

if not redzlib then
    warn("Falha ao carregar Redz Library")
    return
end

-- Criar Janela
local Window = redzlib:MakeWindow({
    Title = "Vinibrook Hub",
    SubTitle = "Brookhaven | Delta",
    SaveFolder = "VinibrookHub"
})

-- =========================
-- ABA PRINCIPAL
-- =========================
local MainTab = Window:MakeTab({"Principal", "home"})

MainTab:AddButton({
    "Teste de Execução",
    function()
        print("Vinibrook executando corretamente")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Vinibrook",
            Text = "Redz V5 funcionando no Delta ✅",
            Duration = 3
        })
    end
})

-- =========================
-- ABA BROOKHAVEN
-- =========================
local BrookTab = Window:MakeTab({"Brookhaven", "map"})

BrookTab:AddButton({
    "Velocidade x2",
    function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 32
        end
    end
})

BrookTab:AddButton({
    "Resetar Velocidade",
    function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 16
        end
    end
})

-- =========================
-- ABA DEBUG
-- =========================
local DebugTab = Window:MakeTab({"Debug", "bug"})

DebugTab:AddButton({
    "Print Jogador",
    function()
        print("Jogador:", game.Players.LocalPlayer.Name)
    end
})

print("Vinibrook Hub carregado com sucesso")
