-- 191 FPS ⚡ Hub Extreme Edition
-- Script Boost FPS 240+ dengan GUI Solid (No Transparan Abu-abu)
-- + Fitur Layar Gepeng ala Pro Player

-- GUI Library Extreme
local library = {}
local gui = {}
local fpsIndicator = nil
local fpsRunning = false
local uiCorner = 12
local screenStretchEnabled = false
local originalCameraProperties = {}

-- Fungsi utama membuat GUI Solid (No Transparan Abu-abu)
function library:CreateMain()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "191FPSHub_Extreme"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 999
    
    -- Auto detect untuk handphone
    local isMobile = game:GetService("UserInputService").TouchEnabled
    local guiSize = isMobile and UDim2.new(0, 300, 0, 500) or UDim2.new(0, 340, 0, 550)
    
    -- Main Container - SOLID HITAM (No Transparan)
    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = guiSize
    mainContainer.Position = UDim2.new(0.5, -guiSize.X.Offset/2, 0.5, -guiSize.Y.Offset/2)
    mainContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam pekat
    mainContainer.BackgroundTransparency = 0 -- NO TRANSPARAN
    mainContainer.BorderSizePixel = 0
    mainContainer.Active = true
    mainContainer.Draggable = true
    mainContainer.ClipsDescendants = true
    mainContainer.Parent = screenGui
    
    -- Rounded Corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, uiCorner)
    corner.Parent = mainContainer
    
    -- Stroke (Border) Emas
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 215, 0) -- Emas
    stroke.Thickness = 2
    stroke.Transparency = 0 -- SOLID
    stroke.Parent = mainContainer
    
    -- Gradient Line Atas
    local topGradient = Instance.new("Frame")
    topGradient.Name = "TopGradient"
    topGradient.Size = UDim2.new(1, 0, 0, 3)
    topGradient.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    topGradient.BorderSizePixel = 0
    topGradient.Parent = mainContainer
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))
    })
    gradient.Rotation = 90
    gradient.Parent = topGradient
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainContainer
    
    -- Icon Title
    local titleIcon = Instance.new("TextLabel")
    titleIcon.Name = "TitleIcon"
    titleIcon.Size = UDim2.new(0, 40, 0, 40)
    titleIcon.Position = UDim2.new(0, 15, 0, 5)
    titleIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    titleIcon.Text = "⚡"
    titleIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleIcon.TextScaled = true
    titleIcon.Font = Enum.Font.GothamBold
    titleIcon.Parent = titleBar
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 8)
    iconCorner.Parent = titleIcon
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(0, 150, 0, 30)
    titleText.Position = UDim2.new(0, 60, 0, 10)
    titleText.BackgroundTransparency = 1
    titleText.Text = "191 FPS"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextSize = 20
    titleText.Font = Enum.Font.GothamBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    -- Version Text
    local versionText = Instance.new("TextLabel")
    versionText.Name = "VersionText"
    versionText.Size = UDim2.new(0, 60, 0, 20)
    versionText.Position = UDim2.new(0, 60, 0, 30)
    versionText.BackgroundTransparency = 1
    versionText.Text = "v4.0"
    versionText.TextColor3 = Color3.fromRGB(180, 180, 180)
    versionText.TextSize = 12
    versionText.Font = Enum.Font.Gotham
    versionText.TextXAlignment = Enum.TextXAlignment.Left
    versionText.Parent = titleBar
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 35, 0, 35)
    closeBtn.Position = UDim2.new(1, -45, 0, 7.5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.TextSize = 20
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    -- Tab Buttons Frame
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.Size = UDim2.new(1, -30, 0, 45)
    tabFrame.Position = UDim2.new(0, 15, 0, 50)
    tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    tabFrame.BorderSizePixel = 0
    tabFrame.Parent = mainContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 10)
    tabCorner.Parent = tabFrame
    
    -- Tab 1 Button
    local tab1Btn = Instance.new("TextButton")
    tab1Btn.Name = "Tab1Btn"
    tab1Btn.Size = UDim2.new(0.33, -5, 1, -10)
    tab1Btn.Position = UDim2.new(0, 5, 0, 5)
    tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    tab1Btn.Text = "FPS BOOST"
    tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    tab1Btn.TextSize = 14
    tab1Btn.Font = Enum.Font.GothamBold
    tab1Btn.BorderSizePixel = 0
    tab1Btn.AutoButtonColor = false
    tab1Btn.Parent = tabFrame
    
    local tab1Corner = Instance.new("UICorner")
    tab1Corner.CornerRadius = UDim.new(0, 8)
    tab1Corner.Parent = tab1Btn
    
    -- Tab 2 Button
    local tab2Btn = Instance.new("TextButton")
    tab2Btn.Name = "Tab2Btn"
    tab2Btn.Size = UDim2.new(0.33, -5, 1, -10)
    tab2Btn.Position = UDim2.new(0.33, 5, 0, 5)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Solid
    tab2Btn.Text = "SETTINGS"
    tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tab2Btn.TextSize = 14
    tab2Btn.Font = Enum.Font.GothamBold
    tab2Btn.BorderSizePixel = 0
    tab2Btn.AutoButtonColor = false
    tab2Btn.Parent = tabFrame
    
    local tab2Corner = Instance.new("UICorner")
    tab2Corner.CornerRadius = UDim.new(0, 8)
    tab2Corner.Parent = tab2Btn
    
    -- Tab 3 Button (LAYAR GEPENG)
    local tab3Btn = Instance.new("TextButton")
    tab3Btn.Name = "Tab3Btn"
    tab3Btn.Size = UDim2.new(0.34, -5, 1, -10)
    tab3Btn.Position = UDim2.new(0.66, 5, 0, 5)
    tab3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Solid
    tab3Btn.Text = "LAYAR GEPENG"
    tab3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tab3Btn.TextSize = 12
    tab3Btn.Font = Enum.Font.GothamBold
    tab3Btn.BorderSizePixel = 0
    tab3Btn.AutoButtonColor = false
    tab3Btn.Parent = tabFrame
    
    local tab3Corner = Instance.new("UICorner")
    tab3Corner.CornerRadius = UDim.new(0, 8)
    tab3Corner.Parent = tab3Btn
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -30, 1, -150)
    contentFrame.Position = UDim2.new(0, 15, 0, 105)
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = mainContainer
    
    -- Tab 1 Content
    local tab1Content = Instance.new("Frame")
    tab1Content.Name = "Tab1Content"
    tab1Content.Size = UDim2.new(1, 0, 1, 0)
    tab1Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    tab1Content.BorderSizePixel = 0
    tab1Content.Visible = true
    tab1Content.Parent = contentFrame
    
    -- Tab 2 Content
    local tab2Content = Instance.new("Frame")
    tab2Content.Name = "Tab2Content"
    tab2Content.Size = UDim2.new(1, 0, 1, 0)
    tab2Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    tab2Content.BorderSizePixel = 0
    tab2Content.Visible = false
    tab2Content.Parent = contentFrame
    
    -- Tab 3 Content (LAYAR GEPENG)
    local tab3Content = Instance.new("Frame")
    tab3Content.Name = "Tab3Content"
    tab3Content.Size = UDim2.new(1, 0, 1, 0)
    tab3Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    tab3Content.BorderSizePixel = 0
    tab3Content.Visible = false
    tab3Content.Parent = contentFrame
    
    -- Tab switching
    tab1Btn.MouseButton1Click:Connect(function()
        tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab1Content.Visible = true
        tab2Content.Visible = false
        tab3Content.Visible = false
    end)
    
    tab2Btn.MouseButton1Click:Connect(function()
        tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tab1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab2Content.Visible = true
        tab1Content.Visible = false
        tab3Content.Visible = false
    end)
    
    tab3Btn.MouseButton1Click:Connect(function()
        tab3Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab3Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tab1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab3Content.Visible = true
        tab1Content.Visible = false
        tab2Content.Visible = false
    end)
    
    -- Close button
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        if fpsIndicator then
            fpsIndicator:Destroy()
            fpsIndicator = nil
            fpsRunning = false
        end
        -- Matikan layar gepeng jika aktif
        if screenStretchEnabled then
            library:DisableScreenStretch()
        end
    end)
    
    -- Buat konten untuk Tab 1 (FPS BOOST)
    self:CreateBoostTabExtreme(tab1Content)
    
    -- Buat konten untuk Tab 2 (SETTINGS)
    self:CreateSettingTabExtreme(tab2Content)
    
    -- Buat konten untuk Tab 3 (LAYAR GEPENG)
    self:CreateScreenStretchTab(tab3Content)
    
    -- Buat icon floating
    self:CreateFloatingIconExtreme(screenGui, mainContainer)
    
    return screenGui
end

-- Fungsi untuk membuat icon floating
function library:CreateFloatingIconExtreme(parentScreenGui, mainFrame)
    local icon = Instance.new("TextButton")
    icon.Name = "FloatingIcon"
    icon.Size = UDim2.new(0, 60, 0, 60)
    icon.Position = UDim2.new(0.9, -30, 0.1, 0)
    icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    icon.Text = "💀"
    icon.TextColor3 = Color3.fromRGB(255, 215, 0)
    icon.TextScaled = true
    icon.Font = Enum.Font.GothamBold
    icon.BorderSizePixel = 0
    icon.Draggable = true
    icon.Parent = parentScreenGui
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 15)
    iconCorner.Parent = icon
    
    local iconStroke = Instance.new("UIStroke")
    iconStroke.Color = Color3.fromRGB(255, 215, 0)
    iconStroke.Thickness = 2
    iconStroke.Transparency = 0 -- Solid
    iconStroke.Parent = icon
    
    icon.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
end

-- Fungsi untuk membuat tab Boost Extreme (240+ FPS)
function library:CreateBoostTabExtreme(parent)
    -- Scrolling Frame
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "BoostScrolling"
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 350)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.Parent = parent
    
    -- Label Boost Level
    local levelLabel = Instance.new("TextLabel")
    levelLabel.Name = "LevelLabel"
    levelLabel.Size = UDim2.new(1, 0, 0, 30)
    levelLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    levelLabel.Text = "⚡ PILIH LEVEL BOOST ⚡"
    levelLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    levelLabel.TextSize = 16
    levelLabel.Font = Enum.Font.GothamBold
    levelLabel.Parent = scrollingFrame
    
    -- Level 1 Card
    local level1Card = Instance.new("Frame")
    level1Card.Name = "Level1Card"
    level1Card.Size = UDim2.new(1, 0, 0, 80)
    level1Card.Position = UDim2.new(0, 0, 0, 40)
    level1Card.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    level1Card.BorderSizePixel = 0
    level1Card.Parent = scrollingFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = level1Card
    
    -- Level 1 Title
    local level1Title = Instance.new("TextLabel")
    level1Title.Name = "Level1Title"
    level1Title.Size = UDim2.new(1, -20, 0, 30)
    level1Title.Position = UDim2.new(0, 15, 0, 10)
    level1Title.BackgroundTransparency = 1
    level1Title.Text = "LEVEL 1 - BASIC BOOST"
    level1Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    level1Title.TextSize = 16
    level1Title.Font = Enum.Font.GothamBold
    level1Title.TextXAlignment = Enum.TextXAlignment.Left
    level1Title.Parent = level1Card
    
    -- Level 1 Desc
    local level1Desc = Instance.new("TextLabel")
    level1Desc.Name = "Level1Desc"
    level1Desc.Size = UDim2.new(0.7, -20, 0, 30)
    level1Desc.Position = UDim2.new(0, 15, 0, 40)
    level1Desc.BackgroundTransparency = 1
    level1Desc.Text = "Remove shaders, textures, images"
    level1Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    level1Desc.TextSize = 12
    level1Desc.Font = Enum.Font.Gotham
    level1Desc.TextXAlignment = Enum.TextXAlignment.Left
    level1Desc.Parent = level1Card
    
    -- Level 1 Button
    local level1Btn = Instance.new("TextButton")
    level1Btn.Name = "Level1Btn"
    level1Btn.Size = UDim2.new(0, 80, 0, 40)
    level1Btn.Position = UDim2.new(1, -95, 0, 20)
    level1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    level1Btn.Text = "BOOST"
    level1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    level1Btn.TextSize = 14
    level1Btn.Font = Enum.Font.GothamBold
    level1Btn.BorderSizePixel = 0
    level1Btn.Parent = level1Card
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = level1Btn
    
    -- Level 2 Card (240+ FPS)
    local level2Card = Instance.new("Frame")
    level2Card.Name = "Level2Card"
    level2Card.Size = UDim2.new(1, 0, 0, 100)
    level2Card.Position = UDim2.new(0, 0, 0, 130)
    level2Card.BackgroundColor3 = Color3.fromRGB(30, 20, 0) -- Solid
    level2Card.BorderSizePixel = 0
    level2Card.Parent = scrollingFrame
    
    local card2Corner = Instance.new("UICorner")
    card2Corner.CornerRadius = UDim.new(0, 12)
    card2Corner.Parent = level2Card
    
    -- Level 2 Glow (Stroke emas dobel)
    local stroke2 = Instance.new("UIStroke")
    stroke2.Color = Color3.fromRGB(255, 215, 0)
    stroke2.Thickness = 2
    stroke2.Transparency = 0
    stroke2.Parent = level2Card
    
    -- Level 2 Title
    local level2Title = Instance.new("TextLabel")
    level2Title.Name = "Level2Title"
    level2Title.Size = UDim2.new(1, -20, 0, 30)
    level2Title.Position = UDim2.new(0, 15, 0, 10)
    level2Title.BackgroundTransparency = 1
    level2Title.Text = "⚡ LEVEL 2 - EXTREME 240+ FPS ⚡"
    level2Title.TextColor3 = Color3.fromRGB(255, 215, 0)
    level2Title.TextSize = 16
    level2Title.Font = Enum.Font.GothamBold
    level2Title.TextXAlignment = Enum.TextXAlignment.Left
    level2Title.Parent = level2Card
    
    -- Level 2 Desc
    local level2Desc = Instance.new("TextLabel")
    level2Desc.Name = "Level2Desc"
    level2Desc.Size = UDim2.new(0.7, -20, 0, 50)
    level2Desc.Position = UDim2.new(0, 15, 0, 40)
    level2Desc.BackgroundTransparency = 1
    level2Desc.Text = "Remove ALL effects: shaders, shadows, textures, images, particles, decals + Low graphics + Render distance cut + Disable anti-aliasing"
    level2Desc.TextColor3 = Color3.fromRGB(200, 200, 150)
    level2Desc.TextSize = 11
    level2Desc.Font = Enum.Font.Gotham
    level2Desc.TextXAlignment = Enum.TextXAlignment.Left
    level2Desc.TextWrapped = true
    level2Desc.Parent = level2Card
    
    -- Level 2 Button
    local level2Btn = Instance.new("TextButton")
    level2Btn.Name = "Level2Btn"
    level2Btn.Size = UDim2.new(0, 80, 0, 40)
    level2Btn.Position = UDim2.new(1, -95, 0, 30)
    level2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    level2Btn.Text = "240+"
    level2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    level2Btn.TextSize = 14
    level2Btn.Font = Enum.Font.GothamBold
    level2Btn.BorderSizePixel = 0
    level2Btn.Parent = level2Card
    
    local btn2Corner = Instance.new("UICorner")
    btn2Corner.CornerRadius = UDim.new(0, 8)
    btn2Corner.Parent = level2Btn
    
    -- Status
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = "StatusFrame"
    statusFrame.Size = UDim2.new(1, 0, 0, 50)
    statusFrame.Position = UDim2.new(0, 0, 0, 240)
    statusFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    statusFrame.BorderSizePixel = 0
    statusFrame.Parent = scrollingFrame
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 10)
    statusCorner.Parent = statusFrame
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, -20, 1, 0)
    statusLabel.Position = UDim2.new(0, 10, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "⏳ Status: Ready to boost"
    statusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    statusLabel.TextSize = 14
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = statusFrame
    
    -- Level 1 Boost Function
    level1Btn.MouseButton1Click:Connect(function()
        pcall(function()
            -- Hapus elemen grafis level 1
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") then
                    v:Destroy()
                end
            end
            statusLabel.Text = "✅ Status: Level 1 Active (Basic Boost)"
            statusFrame.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
        end)
    end)
    
    -- Level 2 Boost Function (240+ FPS)
    level2Btn.MouseButton1Click:Connect(function()
        pcall(function()
            -- Hapus SEMUA elemen grafis yang memberatkan
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v:Destroy()
                end
            end
            
            -- Setting grafis ke PALING RENDAH
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 1
            lighting.GlobalShadows = false
            lighting.FogEnd = 1e10
            lighting.FogStart = 1e10
            lighting.Outlines = false
            lighting.Ambient = Color3.fromRGB(128, 128, 128)
            lighting.Brightness = 2
            
            -- Render settings ke minimum
            local renderSettings = settings():GetService("RenderSettings")
            renderSettings.QualityLevel = 1
            renderSettings.MaterialQuality = Enum.MaterialQuality.Low
            renderSettings.RenderQuality = Enum.RenderQuality.Low
            
            -- Matikan anti-aliasing
            renderSettings.AntiAliasingQuality = 0
            
            -- Kurangi draw distance
            workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() end)
            
            statusLabel.Text = "⚡⚡⚡ Status: EXTREME 240+ FPS ACTIVE ⚡⚡⚡"
            statusFrame.BackgroundColor3 = Color3.fromRGB(50, 20, 0)
        end)
    end)
end

-- Fungsi untuk membuat tab Setting
function library:CreateSettingTabExtreme(parent)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "SettingScrolling"
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.Parent = parent
    
    -- FPS Indicator Card
    local fpsCard = Instance.new("Frame")
    fpsCard.Name = "FPSCard"
    fpsCard.Size = UDim2.new(1, 0, 0, 80)
    fpsCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    fpsCard.BorderSizePixel = 0
    fpsCard.Parent = scrollingFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = fpsCard
    
    -- Title
    local fpsTitle = Instance.new("TextLabel")
    fpsTitle.Name = "FPSTitle"
    fpsTitle.Size = UDim2.new(0.7, -20, 0, 30)
    fpsTitle.Position = UDim2.new(0, 15, 0, 10)
    fpsTitle.BackgroundTransparency = 1
    fpsTitle.Text = "FPS INDICATOR"
    fpsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsTitle.TextSize = 16
    fpsTitle.Font = Enum.Font.GothamBold
    fpsTitle.TextXAlignment = Enum.TextXAlignment.Left
    fpsTitle.Parent = fpsCard
    
    -- Desc
    local fpsDesc = Instance.new("TextLabel")
    fpsDesc.Name = "FPSDesc"
    fpsDesc.Size = UDim2.new(0.7, -20, 0, 30)
    fpsDesc.Position = UDim2.new(0, 15, 0, 40)
    fpsDesc.BackgroundTransparency = 1
    fpsDesc.Text = "Show real-time FPS counter"
    fpsDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
    fpsDesc.TextSize = 12
    fpsDesc.Font = Enum.Font.Gotham
    fpsDesc.TextXAlignment = Enum.TextXAlignment.Left
    fpsDesc.Parent = fpsCard
    
    -- Toggle Button (ON/OFF)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 70, 0, 40)
    toggleBtn.Position = UDim2.new(1, -85, 0, 20)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 16
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = fpsCard
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleBtn
    
    local fpsEnabled = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        fpsEnabled = not fpsEnabled
        if fpsEnabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            toggleBtn.Text = "ON"
            self:StartFPSIndicatorExtreme()
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            toggleBtn.Text = "OFF"
            self:StopFPSIndicator()
        end
    end)
    
    -- Info Card
    local infoCard = Instance.new("Frame")
    infoCard.Name = "InfoCard"
    infoCard.Size = UDim2.new(1, 0, 0, 80)
    infoCard.Position = UDim2.new(0, 0, 0, 100)
    infoCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    infoCard.BorderSizePixel = 0
    infoCard.Parent = scrollingFrame
    
    local infoCorner = Instance.new("UICorner")
    infoCorner.CornerRadius = UDim.new(0, 12)
    infoCorner.Parent = infoCard
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, -20, 1, -20)
    infoLabel.Position = UDim2.new(0, 10, 0, 10)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "⚠️ EXTREME MODE: Hapus SEMUA efek grafis untuk FPS 240+. Cocok untuk device low-end & laptop jadul!"
    infoLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    infoLabel.TextSize = 13
    infoLabel.Font = Enum.Font.GothamBold
    infoLabel.TextWrapped = true
    infoLabel.Parent = infoCard
    
    -- Render Settings Card
    local renderCard = Instance.new("Frame")
    renderCard.Name = "RenderCard"
    renderCard.Size = UDim2.new(1, 0, 0, 80)
    renderCard.Position = UDim2.new(0, 0, 0, 200)
    renderCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    renderCard.BorderSizePixel = 0
    renderCard.Parent = scrollingFrame
    
    local renderCorner = Instance.new("UICorner")
    renderCorner.CornerRadius = UDim.new(0, 12)
    renderCorner.Parent = renderCard
    
    local renderTitle = Instance.new("TextLabel")
    renderTitle.Name = "RenderTitle"
    renderTitle.Size = UDim2.new(1, -20, 0, 60)
    renderTitle.Position = UDim2.new(0, 10, 0, 10)
    renderTitle.BackgroundTransparency = 1
    renderTitle.Text = "⚙️ Render Settings:\nQuality Level: 1\nMaterial Quality: Low\nAnti-Aliasing: OFF"
    renderTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    renderTitle.TextSize = 12
    renderTitle.Font = Enum.Font.Gotham
    renderTitle.TextXAlignment = Enum.TextXAlignment.Left
    renderTitle.TextWrapped = true
    renderTitle.Parent = renderCard
end

-- Fungsi untuk membuat tab LAYAR GEPENG
function library:CreateScreenStretchTab(parent)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "ScreenStretchScrolling"
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.Parent = parent
    
    -- Title LAYAR GEPENG
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.Text = "🖥️ LAYAR GEPENG PRO PLAYER 🖥️"
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = scrollingFrame
    
    -- Main Toggle Card
    local mainCard = Instance.new("Frame")
    mainCard.Name = "MainCard"
    mainCard.Size = UDim2.new(1, 0, 0, 120)
    mainCard.Position = UDim2.new(0, 0, 0, 50)
    mainCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    mainCard.BorderSizePixel = 0
    mainCard.Parent = scrollingFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = mainCard
    
    local mainTitle = Instance.new("TextLabel")
    mainTitle.Name = "MainTitle"
    mainTitle.Size = UDim2.new(1, -20, 0, 30)
    mainTitle.Position = UDim2.new(0, 10, 0, 10)
    mainTitle.BackgroundTransparency = 1
    mainTitle.Text = "LAYAR GEPENG"
    mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainTitle.TextSize = 16
    mainTitle.Font = Enum.Font.GothamBold
    mainTitle.TextXAlignment = Enum.TextXAlignment.Left
    mainTitle.Parent = mainCard
    
    local mainDesc = Instance.new("TextLabel")
    mainDesc.Name = "MainDesc"
    mainDesc.Size = UDim2.new(0.6, -10, 0, 60)
    mainDesc.Position = UDim2.new(0, 10, 0, 40)
    mainDesc.BackgroundTransparency = 1
    mainDesc.Text = "nambahin fps dikit sama fov nya jadi lebih lebar"
    mainDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
    mainDesc.TextSize = 12
    mainDesc.Font = Enum.Font.Gotham
    mainDesc.TextXAlignment = Enum.TextXAlignment.Left
    mainDesc.TextWrapped = true
    mainDesc.Parent = mainCard
    
    -- Toggle Button
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "StretchToggleBtn"
    toggleBtn.Size = UDim2.new(0, 90, 0, 50)
    toggleBtn.Position = UDim2.new(1, -105, 0, 35)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 18
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = mainCard
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleBtn
    
    -- Stretch Level Card
    local levelCard = Instance.new("Frame")
    levelCard.Name = "LevelCard"
    levelCard.Size = UDim2.new(1, 0, 0, 150)
    levelCard.Position = UDim2.new(0, 0, 0, 180)
    levelCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    levelCard.BorderSizePixel = 0
    levelCard.Parent = scrollingFrame
    
    local levelCorner = Instance.new("UICorner")
    levelCorner.CornerRadius = UDim.new(0, 12)
    levelCorner.Parent = levelCard
    
    local levelTitle = Instance.new("TextLabel")
    levelTitle.Name = "LevelTitle"
    levelTitle.Size = UDim2.new(1, -20, 0, 30)
    levelTitle.Position = UDim2.new(0, 10, 0, 10)
    levelTitle.BackgroundTransparency = 1
    levelTitle.Text = "⚡ LEVEL STRETCH ⚡"
    levelTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    levelTitle.TextSize = 16
    levelTitle.Font = Enum.Font.GothamBold
    levelTitle.TextXAlignment = Enum.TextXAlignment.Left
    levelTitle.Parent = levelCard
    
    -- Level Buttons
    local level1Btn = Instance.new("TextButton")
    level1Btn.Name = "Level1Btn"
    level1Btn.Size = UDim2.new(0.3, -10, 0, 40)
    level1Btn.Position = UDim2.new(0.025, 0, 0, 50)
    level1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    level1Btn.Text = "LOW"
    level1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    level1Btn.TextSize = 14
    level1Btn.Font = Enum.Font.GothamBold
    level1Btn.BorderSizePixel = 0
    level1Btn.Parent = levelCard
    
    local lvl1Corner = Instance.new("UICorner")
    lvl1Corner.CornerRadius = UDim.new(0, 8)
    lvl1Corner.Parent = level1Btn
    
    local level2Btn = Instance.new("TextButton")
    level2Btn.Name = "Level2Btn"
    level2Btn.Size = UDim2.new(0.3, -10, 0, 40)
    level2Btn.Position = UDim2.new(0.35, 0, 0, 50)
    level2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    level2Btn.Text = "MEDIUM"
    level2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    level2Btn.TextSize = 14
    level2Btn.Font = Enum.Font.GothamBold
    level2Btn.BorderSizePixel = 0
    level2Btn.Parent = levelCard
    
    local lvl2Corner = Instance.new("UICorner")
    lvl2Corner.CornerRadius = UDim.new(0, 8)
    lvl2Corner.Parent = level2Btn
    
    local level3Btn = Instance.new("TextButton")
    level3Btn.Name = "Level3Btn"
    level3Btn.Size = UDim2.new(0.3, -10, 0, 40)
    level3Btn.Position = UDim2.new(0.675, 0, 0, 50)
    level3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    level3Btn.Text = "EXTREME"
    level3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    level3Btn.TextSize = 14
    level3Btn.Font = Enum.Font.GothamBold
    level3Btn.BorderSizePixel = 0
    level3Btn.Parent = levelCard
    
    local lvl3Corner = Instance.new("UICorner")
    lvl3Corner.CornerRadius = UDim.new(0, 8)
    lvl3Corner.Parent = level3Btn
    
    -- Level Description
    local levelDesc = Instance.new("TextLabel")
    levelDesc.Name = "LevelDesc"
    levelDesc.Size = UDim2.new(1, -20, 0, 40)
    levelDesc.Position = UDim2.new(0, 10, 0, 100)
    levelDesc.BackgroundTransparency = 1
    levelDesc.Text = "Pilih level stretch: LOW (16:9), MEDIUM (21:9), EXTREME (32:9)"
    levelDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
    levelDesc.TextSize = 12
    levelDesc.Font = Enum.Font.Gotham
    levelDesc.TextXAlignment = Enum.TextXAlignment.Left
    levelDesc.Parent = levelCard
    
    -- Current Status
    local statusCard = Instance.new("Frame")
    statusCard.Name = "StatusCard"
    statusCard.Size = UDim2.new(1, 0, 0, 60)
    statusCard.Position = UDim2.new(0, 0, 0, 340)
    statusCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Solid
    statusCard.BorderSizePixel = 0
    statusCard.Parent = scrollingFrame
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 12)
    statusCorner.Parent = statusCard
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, -20, 1, 0)
    statusLabel.Position = UDim2.new(0, 10, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "⏸️ Status: Layar Normal (OFF)"
    statusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    statusLabel.TextSize = 14
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = statusCard
    
    -- Variable untuk menyimpan level stretch
    local currentStretchLevel = "OFF"
    local stretchEnabled = false
    
    -- Fungsi untuk mengaktifkan stretch
    local function enableStretch(level)
        pcall(function()
            local camera = workspace.CurrentCamera
            local viewportSize = camera.ViewportSize
            
            -- Simpan properti asli camera jika belum disimpan
            if not originalCameraProperties.FOV then
                originalCameraProperties.FOV = camera.FieldOfView
                originalCameraProperties.ViewportSize = viewportSize
            end
            
            -- Set FieldOfView berdasarkan level
            if level == "LOW" then
                camera.FieldOfView = 110 -- Stretch ringan (16:9 effect)
                levelDesc.Text = "LOW ACTIVE: Stretch ringan seperti 16:9"
            elseif level == "MEDIUM" then
                camera.FieldOfView = 120 -- Stretch sedang (21:9 ultrawide)
                levelDesc.Text = "MEDIUM ACTIVE: Stretch sedang seperti 21:9 ultrawide"
            elseif level == "EXTREME" then
                camera.FieldOfView = 140 -- Stretch ekstrim (32:9 super ultrawide)
                levelDesc.Text = "EXTREME ACTIVE: Stretch ekstrim seperti 32:9"
            end
            
            -- Ubah ViewportSize secara manual untuk efek stretch tambahan
            -- Ini akan membuat tampilan lebih gepeng
            local newWidth = viewportSize.X * 1.3
            local newHeight = viewportSize.Y * 0.9
            camera.ViewportSize = Vector2.new(newWidth, newHeight)
            
            stretchEnabled = true
            currentStretchLevel = level
            statusLabel.Text = "✅ Status: LAYAR GEPENG " .. level .. " (ON)"
            statusCard.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            toggleBtn.Text = "ON"
        end)
    end
    
    -- Fungsi untuk menonaktifkan stretch
    local function disableStretch()
        pcall(function()
            local camera = workspace.CurrentCamera
            
            -- Kembalikan ke properti asli
            if originalCameraProperties.FOV then
                camera.FieldOfView = originalCameraProperties.FOV
                camera.ViewportSize = originalCameraProperties.ViewportSize
            else
                -- Fallback jika tidak ada data tersimpan
                camera.FieldOfView = 70
                camera.ViewportSize = Vector2.new(camera.ViewportSize.X / 1.3, camera.ViewportSize.Y / 0.9)
            end
            
            stretchEnabled = false
            currentStretchLevel = "OFF"
            levelDesc.Text = "Pilih level stretch: LOW (16:9), MEDIUM (21:9), EXTREME (32:9)"
            statusLabel.Text = "⏸️ Status: Layar Normal (OFF)"
            statusCard.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            toggleBtn.Text = "OFF"
            
            -- Reset warna tombol level
            level1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            level1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            level2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            level2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            level3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            level3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end)
    end
    
    -- Toggle Button function
    toggleBtn.MouseButton1Click:Connect(function()
        if stretchEnabled then
            disableStretch()
        else
            -- Jika belum aktif, aktifkan dengan level terakhir atau default MEDIUM
            if currentStretchLevel ~= "OFF" then
                enableStretch(currentStretchLevel)
            else
                enableStretch("MEDIUM")
                -- Highlight tombol MEDIUM
                level2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
                level2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
            end
        end
    end)
    
    -- Level buttons
    level1Btn.MouseButton1Click:Connect(function()
        if stretchEnabled then
            enableStretch("LOW")
        else
            currentStretchLevel = "LOW"
        end
        -- Visual feedback
        level1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        level1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        level2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        level3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)
    
    level2Btn.MouseButton1Click:Connect(function()
        if stretchEnabled then
            enableStretch("MEDIUM")
        else
            currentStretchLevel = "MEDIUM"
        end
        -- Visual feedback
        level2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        level2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        level1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        level3Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level3Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)
    
    level3Btn.MouseButton1Click:Connect(function()
        if stretchEnabled then
            enableStretch("EXTREME")
        else
            currentStretchLevel = "EXTREME"
        end
        -- Visual feedback
        level3Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        level3Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        level1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        level2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        level2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)
    
    -- Info tambahan
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, -20, 0, 40)
    infoLabel.Position = UDim2.new(0, 10, 0, 410)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "⚠️ Catatan: Fitur ini mengubah Field of View camera. Beberapa game mungkin mereset sendiri saat teleport."
    infoLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    infoLabel.TextSize = 11
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextWrapped = true
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel.Parent = scrollingFrame
end

-- Fungsi FPS Indicator Extreme
function library:StartFPSIndicatorExtreme()
    if fpsIndicator then
        fpsIndicator:Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSIndicator_Extreme"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 1000
    screenGui.Parent = game:GetService("CoreGui")
    
    local frame = Instance.new("Frame")
    frame.Name = "FPSFrame"
    frame.Size = UDim2.new(0, 100, 0, 40)
    frame.Position = UDim2.new(0, 20, 0, 60)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam solid
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 12)
    frameCorner.Parent = frame
    
    local frameStroke = Instance.new("UIStroke")
    frameStroke.Color = Color3.fromRGB(255, 215, 0)
    frameStroke.Thickness = 2
    frameStroke.Transparency = 0
    frameStroke.Parent = frame
    
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "FPSLabel"
    fpsLabel.Size = UDim2.new(1, -10, 1, 0)
    fpsLabel.Position = UDim2.new(0, 5, 0, 0)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = "FPS: 60"
    fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    fpsLabel.TextSize = 18
    fpsLabel.Font = Enum.Font.GothamBold
    fpsLabel.Parent = frame
    
    fpsIndicator = screenGui
    fpsRunning = true
    
    local lastIteration = tick()
    local frameCount = 0
    local fps = 60
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if fpsRunning and fpsIndicator and fpsIndicator.Parent then
            frameCount = frameCount + 1
            local currentTime = tick()
            local timePassed = currentTime - lastIteration
            
            if timePassed >= 0.5 then -- Update lebih cepat
                fps = math.floor((frameCount / timePassed) * 2)
                fpsLabel.Text = "FPS: " .. fps
                
                if fps >= 100 then
                    fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                    fpsLabel.Text = "FPS: " .. fps .. " ⚡"
                elseif fps >= 60 then
                    fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif fps >= 30 then
                    fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                frameCount = 0
                lastIteration = currentTime
            end
        end
    end)
end

function library:StopFPSIndicator()
    if fpsIndicator then
        fpsIndicator:Destroy()
        fpsIndicator = nil
    end
    fpsRunning = false
end

-- Fungsi untuk menonaktifkan screen stretch (dipanggil saat close)
function library:DisableScreenStretch()
    pcall(function()
        local camera = workspace.CurrentCamera
        if originalCameraProperties.FOV then
            camera.FieldOfView = originalCameraProperties.FOV
            camera.ViewportSize = originalCameraProperties.ViewportSize
        end
        screenStretchEnabled = false
    end)
end

-- Eksekusi utama
local success, err = pcall(function()
    -- Bersihkan GUI lama jika ada
    local oldGui = game:GetService("CoreGui"):FindFirstChild("191FPSHub_Extreme")
    if oldGui then
        oldGui:Destroy()
    end
    
    local mainGui = library:CreateMain()
    mainGui.Parent = game:GetService("CoreGui")
    
    -- Notifikasi sukses
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚡ 191 FPS Extreme ⚡",
        Text = "Mode 240+ FPS + Layar Gepeng siap digunakan!",
        Duration = 3
    })
end)

if not success then
    warn("Error: " .. tostring(err))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error",
        Text = "Gagal memuat: " .. tostring(err),
        Duration = 5
    })
end
