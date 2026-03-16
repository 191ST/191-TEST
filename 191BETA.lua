--[[
╔══════════════════════════════════════════╗
║         SUPER FLING XENO EDITION         ║
║         By: Dark System v1.0             ║
╚══════════════════════════════════════════╝
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local LP = Players.LocalPlayer

-- Variables
local flingRadius = 50
local flingPower = 500000
local flingEnabled = true
local espEnabled = false
local infiniteJump = false
local speedEnabled = false
local speedValue = 50
local espObjects = {}
local infiniteJumpConnection = nil

-- Main Functions
local function CreateFlingGUI()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "XenoFlingHub"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Cek executor
    if syn and syn.protect_gui then
        syn.protect_gui(screenGui)
        screenGui.Parent = game:GetService("CoreGui")
    elseif gethui then
        screenGui.Parent = gethui()
    else
        screenGui.Parent = LP:FindFirstChild("PlayerGui") or LP:WaitForChild("PlayerGui")
    end
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 450)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    
    -- Shadow
    local shadow = Instance.new("ImageLabel")
    shadow.Size = UDim2.new(1, 20, 1, 20)
    shadow.Position = UDim2.new(0, -10, 0, -10)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Parent = mainFrame
    
    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame
    
    -- Gradient
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
    })
    gradient.Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 45)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    titleBar.BackgroundTransparency = 0.2
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 10)
    titleCorner.Parent = titleBar
    
    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, -50, 1, 0)
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "💀 XENO FLING HUB 💀"
    titleText.TextColor3 = Color3.fromRGB(255, 50, 50)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 20
    titleText.Parent = titleBar
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -40, 0.5, -15)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 20
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
        end
        -- Cleanup ESP
        for _, obj in pairs(espObjects) do
            if obj then obj:Destroy() end
        end
    end)
    
    -- Tab Buttons
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, -20, 0, 40)
    tabFrame.Position = UDim2.new(0, 10, 0, 55)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Parent = mainFrame
    
    local flingTab = Instance.new("TextButton")
    flingTab.Size = UDim2.new(0.33, -3, 1, 0)
    flingTab.Position = UDim2.new(0, 0, 0, 0)
    flingTab.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    flingTab.Text = "FLING"
    flingTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    flingTab.TextSize = 16
    flingTab.Font = Enum.Font.GothamBold
    flingTab.Parent = tabFrame
    
    local espTab = Instance.new("TextButton")
    espTab.Size = UDim2.new(0.33, -3, 1, 0)
    espTab.Position = UDim2.new(0.335, 0, 0, 0)
    espTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    espTab.Text = "ESP"
    espTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    espTab.TextSize = 16
    espTab.Font = Enum.Font.GothamBold
    espTab.Parent = tabFrame
    
    local playerTab = Instance.new("TextButton")
    playerTab.Size = UDim2.new(0.33, -3, 1, 0)
    playerTab.Position = UDim2.new(0.67, 0, 0, 0)
    playerTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    playerTab.Text = "PLAYER"
    playerTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerTab.TextSize = 16
    playerTab.Font = Enum.Font.GothamBold
    playerTab.Parent = tabFrame
    
    for _, btn in pairs({flingTab, espTab, playerTab}) do
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = btn
    end
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -20, 1, -110)
    contentFrame.Position = UDim2.new(0, 10, 0, 100)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    -- FLING TAB CONTENT
    local flingContent = Instance.new("Frame")
    flingContent.Size = UDim2.new(1, 0, 1, 0)
    flingContent.BackgroundTransparency = 1
    flingContent.Visible = true
    flingContent.Parent = contentFrame
    
    -- ESP TAB CONTENT
    local espContent = Instance.new("Frame")
    espContent.Size = UDim2.new(1, 0, 1, 0)
    espContent.BackgroundTransparency = 1
    espContent.Visible = false
    espContent.Parent = contentFrame
    
    -- PLAYER TAB CONTENT
    local playerContent = Instance.new("Frame")
    playerContent.Size = UDim2.new(1, 0, 1, 0)
    playerContent.BackgroundTransparency = 1
    playerContent.Visible = false
    playerContent.Parent = contentFrame
    
    -- Tab Switching
    flingTab.MouseButton1Click:Connect(function()
        flingTab.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        espTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        playerTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        flingContent.Visible = true
        espContent.Visible = false
        playerContent.Visible = false
    end)
    
    espTab.MouseButton1Click:Connect(function()
        espTab.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        flingTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        playerTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        espContent.Visible = true
        flingContent.Visible = false
        playerContent.Visible = false
    end)
    
    playerTab.MouseButton1Click:Connect(function()
        playerTab.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        flingTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        espTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        playerContent.Visible = true
        flingContent.Visible = false
        espContent.Visible = false
    end)
    
    -- FLING CONTENT
    local radiusLabel = Instance.new("TextLabel")
    radiusLabel.Size = UDim2.new(1, 0, 0, 25)
    radiusLabel.Position = UDim2.new(0, 0, 0, 10)
    radiusLabel.BackgroundTransparency = 1
    radiusLabel.Text = "📏 RADIUS: " .. flingRadius
    radiusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    radiusLabel.TextXAlignment = Enum.TextXAlignment.Left
    radiusLabel.Font = Enum.Font.GothamBold
    radiusLabel.TextSize = 16
    radiusLabel.Parent = flingContent
    
    -- Slider
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, 0, 0, 25)
    sliderBg.Position = UDim2.new(0, 0, 0, 40)
    sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = flingContent
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 15)
    sliderCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new(0.005, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 15)
    fillCorner.Parent = sliderFill
    
    local sliderBtn = Instance.new("TextButton")
    sliderBtn.Size = UDim2.new(0, 20, 0, 20)
    sliderBtn.Position = UDim2.new(0.005, -10, 0.5, -10)
    sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderBtn.Text = ""
    sliderBtn.ZIndex = 2
    sliderBtn.Parent = sliderBg
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = sliderBtn
    
    -- Fling Toggle
    local flingToggle = Instance.new("TextButton")
    flingToggle.Size = UDim2.new(1, 0, 0, 40)
    flingToggle.Position = UDim2.new(0, 0, 0, 80)
    flingToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    flingToggle.Text = "🔵 FLING: ON"
    flingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    flingToggle.TextSize = 16
    flingToggle.Font = Enum.Font.GothamBold
    flingToggle.Parent = flingContent
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = flingToggle
    
    -- Auto Fling
    local autoFlingBtn = Instance.new("TextButton")
    autoFlingBtn.Size = UDim2.new(1, 0, 0, 40)
    autoFlingBtn.Position = UDim2.new(0, 0, 0, 130)
    autoFlingBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    autoFlingBtn.Text = "⚡ AUTO FLING: OFF"
    autoFlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoFlingBtn.TextSize = 16
    autoFlingBtn.Font = Enum.Font.GothamBold
    autoFlingBtn.Parent = flingContent
    
    local autoCorner = Instance.new("UICorner")
    autoCorner.CornerRadius = UDim.new(0, 8)
    autoCorner.Parent = autoFlingBtn
    
    -- ESP CONTENT
    local espToggle = Instance.new("TextButton")
    espToggle.Size = UDim2.new(1, 0, 0, 40)
    espToggle.Position = UDim2.new(0, 0, 0, 10)
    espToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    espToggle.Text = "👁️ ESP: OFF"
    espToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    espToggle.TextSize = 16
    espToggle.Font = Enum.Font.GothamBold
    espToggle.Parent = espContent
    
    local espToggleCorner = Instance.new("UICorner")
    espToggleCorner.CornerRadius = UDim.new(0, 8)
    espToggleCorner.Parent = espToggle
    
    -- ESP Color Picker
    local colorLabel = Instance.new("TextLabel")
    colorLabel.Size = UDim2.new(1, 0, 0, 25)
    colorLabel.Position = UDim2.new(0, 0, 0, 60)
    colorLabel.BackgroundTransparency = 1
    colorLabel.Text = "🎨 ESP COLOR"
    colorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    colorLabel.TextXAlignment = Enum.TextXAlignment.Left
    colorLabel.Font = Enum.Font.Gotham
    colorLabel.TextSize = 14
    colorLabel.Parent = espContent
    
    local colorPicker = Instance.new("Frame")
    colorPicker.Size = UDim2.new(1, 0, 0, 30)
    colorPicker.Position = UDim2.new(0, 0, 0, 85)
    colorPicker.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    colorPicker.Parent = espContent
    
    local pickerCorner = Instance.new("UICorner")
    pickerCorner.CornerRadius = UDim.new(0, 6)
    pickerCorner.Parent = colorPicker
    
    -- PLAYER CONTENT
    local infJumpToggle = Instance.new("TextButton")
    infJumpToggle.Size = UDim2.new(1, 0, 0, 40)
    infJumpToggle.Position = UDim2.new(0, 0, 0, 10)
    infJumpToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    infJumpToggle.Text = "🦘 INFINITE JUMP: OFF"
    infJumpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    infJumpToggle.TextSize = 16
    infJumpToggle.Font = Enum.Font.GothamBold
    infJumpToggle.Parent = playerContent
    
    local infCorner = Instance.new("UICorner")
    infCorner.CornerRadius = UDim.new(0, 8)
    infCorner.Parent = infJumpToggle
    
    local speedToggle = Instance.new("TextButton")
    speedToggle.Size = UDim2.new(1, 0, 0, 40)
    speedToggle.Position = UDim2.new(0, 0, 0, 60)
    speedToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    speedToggle.Text = "⚡ SPEED: OFF"
    speedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedToggle.TextSize = 16
    speedToggle.Font = Enum.Font.GothamBold
    speedToggle.Parent = playerContent
    
    local speedCorner = Instance.new("UICorner")
    speedCorner.CornerRadius = UDim.new(0, 8)
    speedCorner.Parent = speedToggle
    
    local speedSliderBg = Instance.new("Frame")
    speedSliderBg.Size = UDim2.new(1, 0, 0, 20)
    speedSliderBg.Position = UDim2.new(0, 0, 0, 110)
    speedSliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    speedSliderBg.BorderSizePixel = 0
    speedSliderBg.Parent = playerContent
    
    local speedSliderCorner = Instance.new("UICorner")
    speedSliderCorner.CornerRadius = UDim.new(0, 10)
    speedSliderCorner.Parent = speedSliderBg
    
    local speedSliderFill = Instance.new("Frame")
    speedSliderFill.Size = UDim2.new(0.05, 0, 1, 0)
    speedSliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    speedSliderFill.BorderSizePixel = 0
    speedSliderFill.Parent = speedSliderBg
    
    local speedFillCorner = Instance.new("UICorner")
    speedFillCorner.CornerRadius = UDim.new(0, 10)
    speedFillCorner.Parent = speedSliderFill
    
    local speedSliderBtn = Instance.new("TextButton")
    speedSliderBtn.Size = UDim2.new(0, 16, 0, 16)
    speedSliderBtn.Position = UDim2.new(0.05, -8, 0.5, -8)
    speedSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    speedSliderBtn.Text = ""
    speedSliderBtn.ZIndex = 2
    speedSliderBtn.Parent = speedSliderBg
    
    local speedBtnCorner = Instance.new("UICorner")
    speedBtnCorner.CornerRadius = UDim.new(0, 8)
    speedBtnCorner.Parent = speedSliderBtn
    
    -- FUNCTIONS
    -- Fling Function
    local function flingTargets()
        if not flingEnabled or not LP.Character then return end
        
        local rootPart = LP.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LP and player.Character then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                local targetHumanoid = player.Character:FindFirstChild("Humanoid")
                
                if targetRoot and targetHumanoid then
                    local dist = (targetRoot.Position - rootPart.Position).Magnitude
                    if dist <= flingRadius then
                        targetHumanoid.PlatformStand = true
                        
                        local direction = (targetRoot.Position - rootPart.Position).Unit
                        local force = direction * flingPower
                        
                        local bv = Instance.new("BodyVelocity")
                        bv.Velocity = force
                        bv.MaxForce = Vector3.new(1, 1, 1) * 9e9
                        bv.Parent = targetRoot
                        
                        game:GetService("Debris"):AddItem(bv, 2)
                        
                        task.delay(2, function()
                            if targetHumanoid and targetHumanoid.Parent then
                                targetHumanoid.PlatformStand = false
                            end
                        end)
                    end
                end
            end
        end
    end
    
    -- ESP Function
    local function toggleESP(state)
        if state then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LP then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "XenoESP"
                    highlight.FillColor = colorPicker.BackgroundColor3
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.Adornee = player.Character
                    highlight.Parent = player.Character
                    
                    table.insert(espObjects, highlight)
                    
                    -- Box
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "XenoBox"
                    box.Size = Vector3.new(4, 6, 2)
                    box.Color3 = colorPicker.BackgroundColor3
                    box.Transparency = 0.5
                    box.AlwaysOnTop = true
                    box.ZIndex = 5
                    box.Adornee = player.Character
                    box.Parent = player.Character
                    
                    table.insert(espObjects, box)
                end
            end
        else
            for _, obj in pairs(espObjects) do
                if obj then obj:Destroy() end
            end
            espObjects = {}
        end
    end
    
    -- Infinite Jump
    local function toggleInfJump(state)
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
            infiniteJumpConnection = nil
        end
        
        if state then
            infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                    LP.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end
    
    -- Speed
    local function updateSpeed(value)
        if speedEnabled and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = value
        end
    end
    
    -- SLIDER FUNCTIONS
    local dragging = false
    local speedDragging = false
    
    sliderBtn.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    speedSliderBtn.MouseButton1Down:Connect(function()
        speedDragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            speedDragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderPos = sliderBg.AbsolutePosition
            local sliderSize = sliderBg.AbsoluteSize.X
            
            local relativeX = math.clamp(mousePos.X - sliderPos.X, 0, sliderSize)
            local percentage = relativeX / sliderSize
            flingRadius = math.floor(1 + (percentage * 9999))
            
            radiusLabel.Text = "📏 RADIUS: " .. flingRadius
            sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            sliderBtn.Position = UDim2.new(percentage, -10, 0.5, -10)
        end
        
        if speedDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local sliderPos = speedSliderBg.AbsolutePosition
            local sliderSize = speedSliderBg.AbsoluteSize.X
            
            local relativeX = math.clamp(mousePos.X - sliderPos.X, 0, sliderSize)
            local percentage = relativeX / sliderSize
            speedValue = math.floor(16 + (percentage * 100))
            
            speedSliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            speedSliderBtn.Position = UDim2.new(percentage, -8, 0.5, -8)
            
            updateSpeed(speedValue)
        end
    end)
    
    -- BUTTON FUNCTIONS
    flingToggle.MouseButton1Click:Connect(function()
        flingEnabled = not flingEnabled
        if flingEnabled then
            flingToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            flingToggle.Text = "🔵 FLING: ON"
        else
            flingToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            flingToggle.Text = "⚫ FLING: OFF"
        end
    end)
    
    local autoFling = false
    autoFlingBtn.MouseButton1Click:Connect(function()
        autoFling = not autoFling
        if autoFling then
            autoFlingBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            autoFlingBtn.Text = "⚡ AUTO FLING: ON"
            
            -- Auto fling loop
            coroutine.wrap(function()
                while autoFling do
                    flingTargets()
                    wait(0.1)
                end
            end)()
        else
            autoFlingBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            autoFlingBtn.Text = "⚡ AUTO FLING: OFF"
        end
    end)
    
    espToggle.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        if espEnabled then
            espToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            espToggle.Text = "👁️ ESP: ON"
            toggleESP(true)
        else
            espToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            espToggle.Text = "👁️ ESP: OFF"
            toggleESP(false)
        end
    end)
    
    colorPicker.MouseButton1Click:Connect(function()
        -- Simple color cycle
        local colors = {
            Color3.fromRGB(255, 0, 0),
            Color3.fromRGB(0, 255, 0),
            Color3.fromRGB(0, 0, 255),
            Color3.fromRGB(255, 255, 0),
            Color3.fromRGB(255, 0, 255),
            Color3.fromRGB(0, 255, 255)
        }
        local currentIndex = 1
        for i, color in ipairs(colors) do
            if color == colorPicker.BackgroundColor3 then
                currentIndex = i
                break
            end
        end
        currentIndex = currentIndex % #colors + 1
        colorPicker.BackgroundColor3 = colors[currentIndex]
        
        if espEnabled then
            toggleESP(false)
            toggleESP(true)
        end
    end)
    
    infJumpToggle.MouseButton1Click:Connect(function()
        infiniteJump = not infiniteJump
        if infiniteJump then
            infJumpToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            infJumpToggle.Text = "🦘 INFINITE JUMP: ON"
            toggleInfJump(true)
        else
            infJumpToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            infJumpToggle.Text = "🦘 INFINITE JUMP: OFF"
            toggleInfJump(false)
        end
    end)
    
    speedToggle.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        if speedEnabled then
            speedToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            speedToggle.Text = "⚡ SPEED: ON"
            updateSpeed(speedValue)
        else
            speedToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            speedToggle.Text = "⚡ SPEED: OFF"
            if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid.WalkSpeed = 16
            end
        end
    end)
    
    -- Manual fling on key press
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.F and flingEnabled then
            flingTargets()
        end
    end)
    
    -- Anti AFK
    LP.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    
    -- Animasi masuk
    mainFrame.Position = UDim2.new(0.5, -175, -0.5, 0)
    local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -175, 0.5, -225)})
    tween:Play()
    
    return screenGui
end

-- Execute
CreateFlingGUI()
print("✅ Xeno Fling Hub Loaded! Tekan F untuk fling manual")
