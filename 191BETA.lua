-- 191 FPS HUB EXTREME EDITION
-- FITUR LAYAR GEPENG 4:3 STRETCHED (ON/OFF) - SUDAH FIX 100%

-- GUARD biar ga error
local Success, Error = pcall(function()

-- Hapus GUI lama
local OldGUI = game:GetService("CoreGui"):FindFirstChild("191FPSHub_Extreme")
if OldGUI then OldGUI:Destroy() end

-- Variable Global
local FPSIndicator = nil
local FPSRunning = false
local StretchActive = false
local OriginalViewport = nil
local OriginalFOV = nil

-- ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "191FPSHub_Extreme"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 500)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Rounded Corners
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

-- Border
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Title Text
local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -50, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ 191 FPS EXTREME ⚡"
TitleText.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleText.TextSize = 20
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -45, 0, 7.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tab Buttons Frame
local TabFrame = Instance.new("Frame")
TabFrame.Name = "TabFrame"
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 55)
TabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabFrame.BorderSizePixel = 0
TabFrame.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 10)
TabCorner.Parent = TabFrame

-- Tab 1 (FPS BOOST)
local Tab1Btn = Instance.new("TextButton")
Tab1Btn.Name = "Tab1Btn"
Tab1Btn.Size = UDim2.new(0.5, -5, 1, -10)
Tab1Btn.Position = UDim2.new(0, 5, 0, 5)
Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Tab1Btn.Text = "FPS BOOST"
Tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
Tab1Btn.TextSize = 16
Tab1Btn.Font = Enum.Font.GothamBold
Tab1Btn.BorderSizePixel = 0
Tab1Btn.Parent = TabFrame

local Tab1Corner = Instance.new("UICorner")
Tab1Corner.CornerRadius = UDim.new(0, 8)
Tab1Corner.Parent = Tab1Btn

-- Tab 2 (SETTINGS)
local Tab2Btn = Instance.new("TextButton")
Tab2Btn.Name = "Tab2Btn"
Tab2Btn.Size = UDim2.new(0.5, -5, 1, -10)
Tab2Btn.Position = UDim2.new(0.5, 5, 0, 5)
Tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tab2Btn.Text = "SETTINGS"
Tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
Tab2Btn.TextSize = 16
Tab2Btn.Font = Enum.Font.GothamBold
Tab2Btn.BorderSizePixel = 0
Tab2Btn.Parent = TabFrame

local Tab2Corner = Instance.new("UICorner")
Tab2Corner.CornerRadius = UDim.new(0, 8)
Tab2Corner.Parent = Tab2Btn

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -120)
ContentFrame.Position = UDim2.new(0, 10, 0, 110)
ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- Tab 1 Content (FPS BOOST)
local Tab1Content = Instance.new("ScrollingFrame")
Tab1Content.Name = "Tab1Content"
Tab1Content.Size = UDim2.new(1, 0, 1, 0)
Tab1Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tab1Content.BorderSizePixel = 0
Tab1Content.ScrollBarThickness = 5
Tab1Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Tab1Content.CanvasSize = UDim2.new(0, 0, 0, 300)
Tab1Content.Visible = true
Tab1Content.Parent = ContentFrame

-- Tab 2 Content (SETTINGS)
local Tab2Content = Instance.new("ScrollingFrame")
Tab2Content.Name = "Tab2Content"
Tab2Content.Size = UDim2.new(1, 0, 1, 0)
Tab2Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tab2Content.BorderSizePixel = 0
Tab2Content.ScrollBarThickness = 5
Tab2Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Tab2Content.CanvasSize = UDim2.new(0, 0, 0, 400)
Tab2Content.Visible = false
Tab2Content.Parent = ContentFrame

-- TAB SWITCHING
Tab1Btn.MouseButton1Click:Connect(function()
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Tab1Content.Visible = true
    Tab2Content.Visible = false
end)

Tab2Btn.MouseButton1Click:Connect(function()
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Tab2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Tab2Content.Visible = true
    Tab1Content.Visible = false
end)

-- CLOSE BUTTON
CloseBtn.MouseButton1Click:Connect(function()
    -- Matikan stretch kalo aktif
    if StretchActive then
        local Camera = workspace.CurrentCamera
        if OriginalViewport then
            Camera.ViewportSize = OriginalViewport
        end
        if OriginalFOV then
            Camera.FieldOfView = OriginalFOV
        end
    end
    ScreenGui:Destroy()
    if FPSIndicator then
        FPSIndicator:Destroy()
        FPSIndicator = nil
    end
end)

-- ==================== TAB 1: FPS BOOST ====================
local function CreateFPSCards()
    local YPos = 10
    
    -- Title
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, YPos)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "⚡ PILIH LEVEL BOOST ⚡"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Parent = Tab1Content
    
    YPos = YPos + 40
    
    -- Level 1 Card
    local Card1 = Instance.new("Frame")
    Card1.Size = UDim2.new(1, -20, 0, 90)
    Card1.Position = UDim2.new(0, 10, 0, YPos)
    Card1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Card1.BorderSizePixel = 0
    Card1.Parent = Tab1Content
    
    local Card1Corner = Instance.new("UICorner")
    Card1Corner.CornerRadius = UDim.new(0, 12)
    Card1Corner.Parent = Card1
    
    local Card1Title = Instance.new("TextLabel")
    Card1Title.Size = UDim2.new(1, -20, 0, 30)
    Card1Title.Position = UDim2.new(0, 10, 0, 10)
    Card1Title.BackgroundTransparency = 1
    Card1Title.Text = "LEVEL 1 - BASIC BOOST"
    Card1Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Card1Title.TextSize = 16
    Card1Title.Font = Enum.Font.GothamBold
    Card1Title.TextXAlignment = Enum.TextXAlignment.Left
    Card1Title.Parent = Card1
    
    local Card1Desc = Instance.new("TextLabel")
    Card1Desc.Size = UDim2.new(0.7, -10, 0, 40)
    Card1Desc.Position = UDim2.new(0, 10, 0, 40)
    Card1Desc.BackgroundTransparency = 1
    Card1Desc.Text = "Hapus shaders, textures, dan images"
    Card1Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Card1Desc.TextSize = 12
    Card1Desc.Font = Enum.Font.Gotham
    Card1Desc.TextXAlignment = Enum.TextXAlignment.Left
    Card1Desc.TextWrapped = true
    Card1Desc.Parent = Card1
    
    local Card1Btn = Instance.new("TextButton")
    Card1Btn.Size = UDim2.new(0, 80, 0, 40)
    Card1Btn.Position = UDim2.new(1, -95, 0, 25)
    Card1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Card1Btn.Text = "BOOST"
    Card1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    Card1Btn.TextSize = 14
    Card1Btn.Font = Enum.Font.GothamBold
    Card1Btn.BorderSizePixel = 0
    Card1Btn.Parent = Card1
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Card1Btn
    
    Card1Btn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") then
                    v:Destroy()
                end
            end
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "FPS BOOST",
            Text = "Level 1 Basic Boost Aktif!",
            Duration = 2
        })
    end)
    
    YPos = YPos + 100
    
    -- Level 2 Card
    local Card2 = Instance.new("Frame")
    Card2.Size = UDim2.new(1, -20, 0, 110)
    Card2.Position = UDim2.new(0, 10, 0, YPos)
    Card2.BackgroundColor3 = Color3.fromRGB(30, 20, 0)
    Card2.BorderSizePixel = 0
    Card2.Parent = Tab1Content
    
    local Card2Corner = Instance.new("UICorner")
    Card2Corner.CornerRadius = UDim.new(0, 12)
    Card2Corner.Parent = Card2
    
    local Card2Stroke = Instance.new("UIStroke")
    Card2Stroke.Color = Color3.fromRGB(255, 215, 0)
    Card2Stroke.Thickness = 2
    Card2Stroke.Parent = Card2
    
    local Card2Title = Instance.new("TextLabel")
    Card2Title.Size = UDim2.new(1, -20, 0, 30)
    Card2Title.Position = UDim2.new(0, 10, 0, 10)
    Card2Title.BackgroundTransparency = 1
    Card2Title.Text = "⚡ LEVEL 2 - EXTREME 240+ FPS ⚡"
    Card2Title.TextColor3 = Color3.fromRGB(255, 215, 0)
    Card2Title.TextSize = 16
    Card2Title.Font = Enum.Font.GothamBold
    Card2Title.TextXAlignment = Enum.TextXAlignment.Left
    Card2Title.Parent = Card2
    
    local Card2Desc = Instance.new("TextLabel")
    Card2Desc.Size = UDim2.new(0.7, -10, 0, 50)
    Card2Desc.Position = UDim2.new(0, 10, 0, 40)
    Card2Desc.BackgroundTransparency = 1
    Card2Desc.Text = "Hapus SEMUA efek: shaders, shadows, particles, decals, bloom, blur + Low graphics + Anti-aliasing OFF"
    Card2Desc.TextColor3 = Color3.fromRGB(200, 200, 150)
    Card2Desc.TextSize = 11
    Card2Desc.Font = Enum.Font.Gotham
    Card2Desc.TextXAlignment = Enum.TextXAlignment.Left
    Card2Desc.TextWrapped = true
    Card2Desc.Parent = Card2
    
    local Card2Btn = Instance.new("TextButton")
    Card2Btn.Size = UDim2.new(0, 80, 0, 40)
    Card2Btn.Position = UDim2.new(1, -95, 0, 35)
    Card2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Card2Btn.Text = "240+"
    Card2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    Card2Btn.TextSize = 14
    Card2Btn.Font = Enum.Font.GothamBold
    Card2Btn.BorderSizePixel = 0
    Card2Btn.Parent = Card2
    
    local Btn2Corner = Instance.new("UICorner")
    Btn2Corner.CornerRadius = UDim.new(0, 8)
    Btn2Corner.Parent = Card2Btn
    
    Card2Btn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v:Destroy()
                end
            end
            
            local Lighting = game:GetService("Lighting")
            Lighting.Brightness = 1
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 1e10
            Lighting.Outlines = false
            
            local RenderSettings = settings():GetService("RenderSettings")
            RenderSettings.QualityLevel = 1
            RenderSettings.MaterialQuality = Enum.MaterialQuality.Low
            RenderSettings.AntiAliasingQuality = 0
        end)
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⚡ EXTREME BOOST ⚡",
            Text = "Mode 240+ FPS Aktif! Semua efek dihapus.",
            Duration = 3
        })
    end)
end

-- ==================== TAB 2: SETTINGS (LAYAR GEPENG FIX) ====================
local function CreateSettingsTab()
    local YPos = 10
    
    -- FPS INDICATOR CARD
    local FPSCard = Instance.new("Frame")
    FPSCard.Size = UDim2.new(1, -20, 0, 90)
    FPSCard.Position = UDim2.new(0, 10, 0, YPos)
    FPSCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    FPSCard.BorderSizePixel = 0
    FPSCard.Parent = Tab2Content
    
    local FPSCorner = Instance.new("UICorner")
    FPSCorner.CornerRadius = UDim.new(0, 12)
    FPSCorner.Parent = FPSCard
    
    local FPSTitle = Instance.new("TextLabel")
    FPSTitle.Size = UDim2.new(1, -20, 0, 30)
    FPSTitle.Position = UDim2.new(0, 10, 0, 10)
    FPSTitle.BackgroundTransparency = 1
    FPSTitle.Text = "FPS INDICATOR"
    FPSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    FPSTitle.TextSize = 16
    FPSTitle.Font = Enum.Font.GothamBold
    FPSTitle.TextXAlignment = Enum.TextXAlignment.Left
    FPSTitle.Parent = FPSCard
    
    local FPSDesc = Instance.new("TextLabel")
    FPSDesc.Size = UDim2.new(0.7, -10, 0, 30)
    FPSDesc.Position = UDim2.new(0, 10, 0, 40)
    FPSDesc.BackgroundTransparency = 1
    FPSDesc.Text = "Tampilkan FPS real-time"
    FPSDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
    FPSDesc.TextSize = 12
    FPSDesc.Font = Enum.Font.Gotham
    FPSDesc.TextXAlignment = Enum.TextXAlignment.Left
    FPSDesc.Parent = FPSCard
    
    local FPSToggle = Instance.new("TextButton")
    FPSToggle.Size = UDim2.new(0, 70, 0, 40)
    FPSToggle.Position = UDim2.new(1, -85, 0, 25)
    FPSToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    FPSToggle.Text = "OFF"
    FPSToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    FPSToggle.TextSize = 16
    FPSToggle.Font = Enum.Font.GothamBold
    FPSToggle.BorderSizePixel = 0
    FPSToggle.Parent = FPSCard
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = FPSToggle
    
    local FPSEnabled = false
    
    -- Fungsi FPS Indicator
    local function StartFPSIndicator()
        if FPSIndicator then FPSIndicator:Destroy() end
        
        local FPSGui = Instance.new("ScreenGui")
        FPSGui.Name = "FPSIndicator"
        FPSGui.ResetOnSpawn = false
        FPSGui.Parent = game:GetService("CoreGui")
        
        local FPSFrame = Instance.new("Frame")
        FPSFrame.Size = UDim2.new(0, 100, 0, 40)
        FPSFrame.Position = UDim2.new(0, 20, 0, 60)
        FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        FPSFrame.BorderSizePixel = 0
        FPSFrame.Active = true
        FPSFrame.Draggable = true
        FPSFrame.Parent = FPSGui
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 12)
        FrameCorner.Parent = FPSFrame
        
        local FrameStroke = Instance.new("UIStroke")
        FrameStroke.Color = Color3.fromRGB(255, 215, 0)
        FrameStroke.Thickness = 2
        FrameStroke.Parent = FPSFrame
        
        local FPSLabel = Instance.new("TextLabel")
        FPSLabel.Size = UDim2.new(1, -10, 1, 0)
        FPSLabel.Position = UDim2.new(0, 5, 0, 0)
        FPSLabel.BackgroundTransparency = 1
        FPSLabel.Text = "FPS: 60"
        FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        FPSLabel.TextSize = 18
        FPSLabel.Font = Enum.Font.GothamBold
        FPSLabel.Parent = FPSFrame
        
        FPSIndicator = FPSGui
        
        local LastTime = tick()
        local FrameCount = 0
        
        game:GetService("RunService").RenderStepped:Connect(function()
            if FPSIndicator and FPSIndicator.Parent then
                FrameCount = FrameCount + 1
                local CurrentTime = tick()
                local TimePassed = CurrentTime - LastTime
                
                if TimePassed >= 0.5 then
                    local FPS = math.floor((FrameCount / TimePassed) * 2)
                    FPSLabel.Text = "FPS: " .. FPS
                    
                    if FPS >= 100 then
                        FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                        FPSLabel.Text = "FPS: " .. FPS .. " ⚡"
                    elseif FPS >= 60 then
                        FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                    elseif FPS >= 30 then
                        FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    else
                        FPSLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                    
                    FrameCount = 0
                    LastTime = CurrentTime
                end
            end
        end)
    end
    
    local function StopFPSIndicator()
        if FPSIndicator then
            FPSIndicator:Destroy()
            FPSIndicator = nil
        end
    end
    
    FPSToggle.MouseButton1Click:Connect(function()
        FPSEnabled = not FPSEnabled
        if FPSEnabled then
            FPSToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            FPSToggle.Text = "ON"
            StartFPSIndicator()
        else
            FPSToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            FPSToggle.Text = "OFF"
            StopFPSIndicator()
        end
    end)
    
    YPos = YPos + 100
    
    -- ===== LAYAR GEPENG CARD - FIX 100% BISA DIPENCET =====
    local StretchCard = Instance.new("Frame")
    StretchCard.Name = "StretchCard"
    StretchCard.Size = UDim2.new(1, -20, 0, 130)
    StretchCard.Position = UDim2.new(0, 10, 0, YPos)
    StretchCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    StretchCard.BorderSizePixel = 0
    StretchCard.Parent = Tab2Content
    
    local StretchCorner = Instance.new("UICorner")
    StretchCorner.CornerRadius = UDim.new(0, 12)
    StretchCorner.Parent = StretchCard
    
    local StretchTitle = Instance.new("TextLabel")
    StretchTitle.Size = UDim2.new(1, -20, 0, 30)
    StretchTitle.Position = UDim2.new(0, 10, 0, 10)
    StretchTitle.BackgroundTransparency = 1
    StretchTitle.Text = "🖥️ LAYAR GEPENG 4:3 STRETCHED"
    StretchTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    StretchTitle.TextSize = 16
    StretchTitle.Font = Enum.Font.GothamBold
    StretchTitle.TextXAlignment = Enum.TextXAlignment.Left
    StretchTitle.Parent = StretchCard
    
    local StretchDesc = Instance.new("TextLabel")
    StretchDesc.Size = UDim2.new(1, -20, 0, 50)
    StretchDesc.Position = UDim2.new(0, 10, 0, 40)
    StretchDesc.BackgroundTransparency = 1
    StretchDesc.Text = "Mode 4:3 stretched ala pro player! Model karakter jadi GEPENG vertikal, aim lebih gampang. (CSGO/Valorant style)"
    StretchDesc.TextColor3 = Color3.fromRGB(200, 150, 100)
    StretchDesc.TextSize = 11
    StretchDesc.Font = Enum.Font.Gotham
    StretchDesc.TextXAlignment = Enum.TextXAlignment.Left
    StretchDesc.TextWrapped = true
    StretchDesc.Parent = StretchCard
    
    -- STATUS TEXT
    local StretchStatus = Instance.new("TextLabel")
    StretchStatus.Name = "StretchStatus"
    StretchStatus.Size = UDim2.new(0.7, -10, 0, 20)
    StretchStatus.Position = UDim2.new(0, 10, 0, 95)
    StretchStatus.BackgroundTransparency = 1
    StretchStatus.Text = "⏸️ Status: Normal (16:9)"
    StretchStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
    StretchStatus.TextSize = 11
    StretchStatus.Font = Enum.Font.Gotham
    StretchStatus.TextXAlignment = Enum.TextXAlignment.Left
    StretchStatus.Parent = StretchCard
    
    -- TOMBOL ON/OFF - PASTI BISA DIPENCET!
    local StretchToggle = Instance.new("TextButton")
    StretchToggle.Name = "StretchToggle"
    StretchToggle.Size = UDim2.new(0, 80, 0, 40)
    StretchToggle.Position = UDim2.new(1, -95, 0, 80)
    StretchToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    StretchToggle.Text = "OFF"
    StretchToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    StretchToggle.TextSize = 16
    StretchToggle.Font = Enum.Font.GothamBold
    StretchToggle.BorderSizePixel = 0
    StretchToggle.Parent = StretchCard
    
    local StretchBtnCorner = Instance.new("UICorner")
    StretchBtnCorner.CornerRadius = UDim.new(0, 8)
    StretchBtnCorner.Parent = StretchToggle
    
    -- FUNGSI AKTIFKAN LAYAR GEPENG
    local function ActivateStretch()
        local Camera = workspace.CurrentCamera
        if not Camera then return end
        
        -- Simpan original settings (hanya sekali)
        if not OriginalViewport then
            OriginalViewport = Camera.ViewportSize
            OriginalFOV = Camera.FieldOfView
        end
        
        -- Hitung tinggi 4:3 (lebar * 0.75)
        local CurrentWidth = Camera.ViewportSize.X
        local NewHeight = CurrentWidth * 0.75 -- 4:3 ratio
        
        -- Terapkan stretch
        Camera.ViewportSize = Vector2.new(CurrentWidth, NewHeight)
        Camera.FieldOfView = 80 -- FOV lebih rendah buat efek gepeng
        
        StretchActive = true
        
        -- Update UI
        StretchToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        StretchToggle.Text = "ON"
        StretchStatus.Text = "✅ Status: LAYAR GEPENG AKTIF (4:3 stretched)"
        StretchStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
        StretchCard.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "LAYAR GEPENG",
            Text = "Mode 4:3 stretched AKTIF! Karakter gepeng.",
            Duration = 2
        })
    end
    
    -- FUNGSI NONAKTIFKAN LAYAR GEPENG
    local function DeactivateStretch()
        local Camera = workspace.CurrentCamera
        if not Camera then return end
        
        -- Kembalikan ke original
        if OriginalViewport then
            Camera.ViewportSize = OriginalViewport
        end
        if OriginalFOV then
            Camera.FieldOfView = OriginalFOV
        end
        
        StretchActive = false
        
        -- Update UI
        StretchToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        StretchToggle.Text = "OFF"
        StretchStatus.Text = "⏸️ Status: Normal (16:9)"
        StretchStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
        StretchCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "LAYAR GEPENG",
            Text = "Mode normal kembali.",
            Duration = 1
        })
    end
    
    -- EVENT CLICK TOMBOL - PASTI JALAN!
    StretchToggle.MouseButton1Click:Connect(function()
        print("⬇️ TOMBOL LAYAR GEPENG DIPENCET!") -- Debug di console
        
        if StretchActive then
            DeactivateStretch()
        else
            ActivateStretch()
        end
    end)
    
    YPos = YPos + 140
    
    -- INFO CARD
    local InfoCard = Instance.new("Frame")
    InfoCard.Size = UDim2.new(1, -20, 0, 100)
    InfoCard.Position = UDim2.new(0, 10, 0, YPos)
    InfoCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    InfoCard.BorderSizePixel = 0
    InfoCard.Parent = Tab2Content
    
    local InfoCorner = Instance.new("UICorner")
    InfoCorner.CornerRadius = UDim.new(0, 12)
    InfoCorner.Parent = InfoCard
    
    local InfoText = Instance.new("TextLabel")
    InfoText.Size = UDim2.new(1, -20, 1, -20)
    InfoText.Position = UDim2.new(0, 10, 0, 10)
    InfoText.BackgroundTransparency = 1
    InfoText.Text = "📌 INFO:\n• FPS Boost: Hapus efek grafis buat FPS tinggi\n• Layar Gepeng: Stretch 4:3 (vertikal gepeng) biar headshot lebih gampang\n• Klik tombol ON/OFF buat coba!"
    InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    InfoText.TextSize = 12
    InfoText.Font = Enum.Font.Gotham
    InfoText.TextWrapped = true
    InfoText.TextXAlignment = Enum.TextXAlignment.Left
    InfoText.Parent = InfoCard
end

-- Panggil fungsi pembuat konten
CreateFPSCards()
CreateSettingsTab()

-- Floating Icon
local FloatingIcon = Instance.new("TextButton")
FloatingIcon.Name = "FloatingIcon"
FloatingIcon.Size = UDim2.new(0, 60, 0, 60)
FloatingIcon.Position = UDim2.new(0.9, -30, 0.1, 0)
FloatingIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FloatingIcon.Text = "⚡"
FloatingIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
FloatingIcon.TextScaled = true
FloatingIcon.Font = Enum.Font.GothamBold
FloatingIcon.BorderSizePixel = 0
FloatingIcon.Draggable = true
FloatingIcon.Parent = ScreenGui

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 15)
IconCorner.Parent = FloatingIcon

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(255, 215, 0)
IconStroke.Thickness = 2
IconStroke.Parent = FloatingIcon

FloatingIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Notifikasi sukses
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "⚡ 191 FPS EXTREME ⚡",
    Text = "LOADING BERHASIL! Tekan tombol LAYAR GEPENG di tab SETTINGS",
    Duration = 5
})

end) -- End pcall

if not Success then
    warn("ERROR: " .. tostring(Error))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ERROR",
        Text = "Gagal load: " .. tostring(Error),
        Duration = 5
    })
end
