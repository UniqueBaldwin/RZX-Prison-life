
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local _6nbpvp076 = function()
    -- PRISON LIFE HUB - RZX BY BALDWIN (REMASTERED VISUALS)
local TweenService = game:GetService((function()
        local a={1129,1584,1350,1350,1467,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local RunService = game:GetService((function()
        local a={1103,1558,1467,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local Players = game.Players
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local PlayerGui = Player:WaitForChild((function()
        local a={1077,1441,1298,1610,1350,1519,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local TextChatService = game:GetService((function()
        local a={1129,1350,1597,1545,908,1389,1298,1545,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())

-- CONFIGURACIONES
local AIMBOT_ENABLED = false
local ESP_ENABLED = false
local IGNORE_PRISONERS = false 
local MAX_DISTANCE = 450 

-- CANALES DE EQUIPO (TextChatService)
local CHANNELS = {
    PRISONER = (function()
        local a={1103,895,1181,1129,1350,1298,1454,895,1519,1402,1376,1389,1545,453,1480,1519,1298,1467,1376,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    POLICE = (function()
        local a={1103,895,1181,1129,1350,1298,1454,895,1519,1402,1376,1389,1545,453,1311,1441,1558,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    CRIMINAL = (function()
        local a={1103,895,1181,1129,1350,1298,1454,1103,1350,1298,1441,1441,1610,453,1519,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(),
    NEUTRAL = (function()
        local a={1103,895,1181,1129,1350,1298,1454,1038,1350,1337,1402,1558,1454,453,1532,1545,1480,1467,1350,453,1376,1519,1298,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
}

local PlayerLabels = {}

-- 1. ETIQUETADO INTERNO (Lógica original)
local function updateInternalTags()
    PlayerLabels = {}
    local channelsFolder = TextChatService:FindFirstChild((function()
        local a={1129,1350,1597,1545,908,1389,1298,1467,1467,1350,1441,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    if not channelsFolder then return end

    for _, channel in pairs(channelsFolder:GetChildren()) do
        local role = nil
        if channel.Name == CHANNELS.PRISONER then role = (function()
        local a={1077,1519,1402,1532,1402,1480,1467,1350,1519,1480};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
        elseif channel.Name == CHANNELS.POLICE then role = (function()
        local a={1077,1480,1441,1402,1324,3118,1298};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
        elseif channel.Name == CHANNELS.CRIMINAL then role = (function()
        local a={908,1519,1402,1454,1402,1467,1298,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
        elseif channel.Name == CHANNELS.NEUTRAL then role = (function()
        local a={1051,1350,1558,1545,1519,1298,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() end

        if role then
            for _, source in pairs(channel:GetChildren()) do
                if source:IsA((function()
        local a={1129,1350,1597,1545,1116,1480,1558,1519,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
                    PlayerLabels[source.UserId] = role
                end
            end
        end
    end
end

-- 2. SISTEMA DE UI (DISEÑO MEJORADO)
local ScreenGui = Instance.new((function()
        local a={1116,1324,1519,1350,1350,1467,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
ScreenGui.Name = (function()
        local a={1103,1207,1181,1272,973,1558,1311,1272,895,1298,1441,1337,1584,1402,1467,1272,1103,1350,1454,1298,1532,1545,1350,1519,1350,1337};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Estilos (Colores)
local COLORS = {
    Background = Color3.fromRGB(25, 25, 30),
    Header = Color3.fromRGB(35, 35, 40),
    Accent = Color3.fromRGB(0, 170, 255),
    Text = Color3.fromRGB(240, 240, 240),
    Stroke = Color3.fromRGB(60, 60, 65),
    Success = Color3.fromRGB(46, 204, 113),
    Danger = Color3.fromRGB(231, 76, 60)
}

-- Función auxiliar para bordes bonitos
local function addStroke(obj, thickness, color)
    local stroke = Instance.new((function()
        local a={1142,986,1116,1545,1519,1480,1428,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    stroke.Parent = obj
    stroke.Thickness = thickness
    stroke.Color = color or COLORS.Stroke
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return stroke
end

-- NOTIFICACIONES (DISEÑO FLAT CORREGIDO)
local function showNotification(text, isSuccess)
    local notiFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ScreenGui)
    notiFrame.Size = UDim2.new(0, 300, 0, 50)
    notiFrame.Position = UDim2.new(0.5, -150, 0, 20) -- Arriba centro
    notiFrame.BackgroundColor3 = COLORS.Background
    notiFrame.BorderSizePixel = 0
    notiFrame.ZIndex = 100
    
    Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), notiFrame).CornerRadius = UDim.new(0, 8)
    addStroke(notiFrame, 1.5, COLORS.Stroke)
    
    -- Icono Flat (Checkmark limpio o Info)
    local icon = Instance.new((function()
        local a={986,1454,1298,1376,1350,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), notiFrame)
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Position = UDim2.new(0, 12, 0.5, -12) -- Centrado verticalmente
    -- ID de icono Flat blanco (Check circle simple)
    icon.Image = (function()
        local a={1519,1311,1597,1298,1532,1532,1350,1545,1402,1337,791,648,648,674,674,700,752,700,778,687,687,700,752,700};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() 
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = isSuccess and COLORS.Success or COLORS.Text
    icon.ZIndex = 101
    
    local label = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), notiFrame)
    label.Size = UDim2.new(1, -55, 1, 0)
    label.Position = UDim2.new(0, 50, 0, 0) -- A la derecha del icono
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COLORS.Text
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 101
    label.Parent = notiFrame
    
    -- Animación de entrada/salida
    notiFrame.Position = UDim2.new(0.5, -150, 0, -60)
    TweenService:Create(notiFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -150, 0, 20)}):Play()
    
    task.delay(3, function()
        TweenService:Create(notiFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -150, 0, -60), BackgroundTransparency = 1}):Play()
        task.wait(0.3)
        notiFrame:Destroy()
    end)
end

-- 3. INTERFAZ PRINCIPAL
local ToggleButton = Instance.new((function()
        local a={1129,1350,1597,1545,895,1558,1545,1545,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ScreenGui)
ToggleButton.Size = UDim2.new(0, 120, 0, 40)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -20)
ToggleButton.BackgroundColor3 = COLORS.Background
ToggleButton.Text = (function()
        local a={1103,1207,1181,453,1038,934,1051,1142};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
ToggleButton.TextColor3 = COLORS.Accent
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 16
Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ToggleButton).CornerRadius = UDim.new(0, 8)
addStroke(ToggleButton, 2, COLORS.Accent)

local MainFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ScreenGui)
MainFrame.Size = UDim2.new(0, 260, 0, 480)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -240)
MainFrame.BackgroundColor3 = COLORS.Background
MainFrame.Visible = false
MainFrame.ZIndex = 50
Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), MainFrame).CornerRadius = UDim.new(0, 10)
addStroke(MainFrame, 1.5, COLORS.Stroke)

-- Título del Hub
local TitleLabel = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), MainFrame)
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = (function()
        local a={1077,1519,1402,1532,1480,1467,453,1025,1402,1363,1350,453,973,1558,1311,453,622,453,1103,1207,1181,453,1311,1610,453,895,1298,1441,1337,1584,1402,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
TitleLabel.TextColor3 = COLORS.Text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.ZIndex = 51

local Divider = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), MainFrame)
Divider.Size = UDim2.new(1, -20, 0, 1)
Divider.Position = UDim2.new(0, 10, 0, 40)
Divider.BackgroundColor3 = COLORS.Stroke
Divider.BorderSizePixel = 0
Divider.ZIndex = 51

local Container = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), MainFrame)
Container.Size = UDim2.new(1, 0, 1, -50)
Container.Position = UDim2.new(0, 0, 0, 50)
Container.BackgroundTransparency = 1
Container.ZIndex = 51

local Layout = Instance.new((function()
        local a={1142,986,1025,1402,1532,1545,1025,1298,1610,1480,1558,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), Container)
Layout.Padding = UDim.new(0, 8)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Top

-- 4. MENÚ DE DESTINOS (PORTALS)
local DestinosFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ScreenGui)
DestinosFrame.Size = UDim2.new(0, 220, 0, 380)
DestinosFrame.Position = UDim2.new(0.5, 140, 0.5, -190)
DestinosFrame.BackgroundColor3 = COLORS.Background
DestinosFrame.Visible = false
DestinosFrame.ZIndex = 60
Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), DestinosFrame).CornerRadius = UDim.new(0, 10)
addStroke(DestinosFrame, 1.5, COLORS.Stroke)

-- Titulo Portals
local PortalsTitle = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), DestinosFrame)
PortalsTitle.Size = UDim2.new(1, 0, 0, 35)
PortalsTitle.BackgroundTransparency = 1
PortalsTitle.Text = (function()
        local a={1129,934,1025,934,1077,1064,1103,1129,1116};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
PortalsTitle.TextColor3 = COLORS.Accent
PortalsTitle.Font = Enum.Font.GothamBold
PortalsTitle.TextSize = 14
PortalsTitle.ZIndex = 61

local DestinosLayout = Instance.new((function()
        local a={1142,986,1025,1402,1532,1545,1025,1298,1610,1480,1558,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), DestinosFrame)
DestinosLayout.Padding = UDim.new(0, 6)
DestinosLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Padding fantasma para bajar el layout despues del titulo
local Spacer = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), DestinosFrame)
Spacer.Size = UDim2.new(1, 0, 0, 30)
Spacer.BackgroundTransparency = 1

-- FUNCIÓN SAFE TELEPORT
local function safeTeleport(cframe)
    local char = Player.Character
    if char and char:FindFirstChild((function()
        local a={973,1558,1454,1298,1467,1480,1402,1337,1103,1480,1480,1545,1077,1298,1519,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()) then
        char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        char.HumanoidRootPart.CFrame = cframe
        task.wait(0.05)
        char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
    end
end

local function createPortalBtn(text, posCFrame)
    local btn = Instance.new((function()
        local a={1129,1350,1597,1545,895,1558,1545,1545,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), DestinosFrame)
    btn.Size = UDim2.new(0, 190, 0, 35)
    btn.BackgroundColor3 = COLORS.Header
    btn.Text = text
    btn.TextColor3 = COLORS.Text
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.ZIndex = 62
    Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function() safeTeleport(posCFrame) showNotification((function()
        local a={1129,1350,1441,1350,1545,1519,1298,1467,1532,1493,1480,1519,1545,1298,1337,1480,453,1298,791,453};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)() .. text, true) end)
    return btn
end

createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,674};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(501.8, 125.8, 2587.0))
createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,687};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(823.7, 125.8, 2590.2))
createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,700};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(1046.5, 125.8, 2588.2))
createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,713};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(1046.0, 125.8, 2071.6))
createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,726};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(823.4, 125.8, 2070.7))
createPortalBtn((function()
        local a={1129,1480,1584,1350,1519,453,739};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), CFrame.new(501.9, 125.8, 2069.8))

-- QUEST UI (Confirmación)
local QuestFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), ScreenGui)
QuestFrame.Size = UDim2.new(0, 320, 0, 150)
QuestFrame.Position = UDim2.new(0.5, -160, 0.5, -75)
QuestFrame.BackgroundColor3 = COLORS.Background
QuestFrame.Visible = false
QuestFrame.ZIndex = 80 
Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), QuestFrame).CornerRadius = UDim.new(0, 12)
addStroke(QuestFrame, 2, COLORS.Accent)

local QuestTitle = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), QuestFrame)
QuestTitle.Size = UDim2.new(1, -30, 0, 60)
QuestTitle.Position = UDim2.new(0, 15, 0, 10)
QuestTitle.Text = (function()
        local a={2520,986,1376,1467,1480,1519,1298,1519,453,1298,453,1441,1480,1532,453,1077,1519,1402,1532,1402,1480,1467,1350,1519,1480,1532,453,557,1064,1519,1298,1467,1376,1350,570,856};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
QuestTitle.TextColor3 = COLORS.Text
QuestTitle.Font = Enum.Font.GothamBold
QuestTitle.TextSize = 16
QuestTitle.TextWrapped = true
QuestTitle.BackgroundTransparency = 1
QuestTitle.ZIndex = 81

local function createQuestBtn(text, pos, color)
    local btn = Instance.new((function()
        local a={1129,1350,1597,1545,895,1558,1545,1545,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)
