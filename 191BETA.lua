local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

-- Konfigurasi ukuran HP
local GUI_WIDTH = 320
local GUI_HEIGHT = 480
local TAB_HEIGHT = 35
local TITLE_HEIGHT = 45
local CONTENT_HEIGHT = GUI_HEIGHT - TITLE_HEIGHT - TAB_HEIGHT

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "TP_Hub_191"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Loading Screen
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Parent = ScreenGui
LoadingFrame.Size = UDim2.new(1,0,1,0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
LoadingFrame.BackgroundTransparency = 0.5
LoadingFrame.Visible = false
LoadingFrame.ZIndex = 10

local LoadingMain = Instance.new("Frame")
LoadingMain.Parent = LoadingFrame
LoadingMain.Size = UDim2.new(0,280,0,150)
LoadingMain.Position = UDim2.new(0.5,-140,0.5,-75)
LoadingMain.BackgroundColor3 = Color3.fromRGB(25,25,35)
LoadingMain.BackgroundTransparency = 0.1
LoadingMain.BorderSizePixel = 0
LoadingMain.ZIndex = 11

local LoadingMainCorner = Instance.new("UICorner")
LoadingMainCorner.Parent = LoadingMain
LoadingMainCorner.CornerRadius = UDim.new(0,15)

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Parent = LoadingMain
LoadingTitle.Size = UDim2.new(1,0,0,40)
LoadingTitle.Position = UDim2.new(0,0,0,10)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "191"
LoadingTitle.TextColor3 = Color3.fromRGB(100,200,255)
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.TextSize = 28
LoadingTitle.ZIndex = 12

local LoadingBarBg = Instance.new("Frame")
LoadingBarBg.Parent = LoadingMain
LoadingBarBg.Size = UDim2.new(0.8,0,0,12)
LoadingBarBg.Position = UDim2.new(0.1,0,0,65)
LoadingBarBg.BackgroundColor3 = Color3.fromRGB(40,40,50)
LoadingBarBg.BorderSizePixel = 0
LoadingBarBg.ZIndex = 12

local LoadingBarBgCorner = Instance.new("UICorner")
LoadingBarBgCorner.Parent = LoadingBarBg
LoadingBarBgCorner.CornerRadius = UDim.new(0,6)

local LoadingBar = Instance.new("Frame")
LoadingBar.Parent = LoadingBarBg
LoadingBar.Size = UDim2.new(0,0,1,0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(0,200,255)
LoadingBar.BorderSizePixel = 0
LoadingBar.ZIndex = 13

local LoadingBarCorner = Instance.new("UICorner")
LoadingBarCorner.Parent = LoadingBar
LoadingBarCorner.CornerRadius = UDim.new(0,6)

local LoadingPercent = Instance.new("TextLabel")
LoadingPercent.Parent = LoadingMain
LoadingPercent.Size = UDim2.new(1,0,0,25)
LoadingPercent.Position = UDim2.new(0,0,0,85)
LoadingPercent.BackgroundTransparency = 1
LoadingPercent.Text = "0%"
LoadingPercent.TextColor3 = Color3.fromRGB(255,255,255)
LoadingPercent.Font = Enum.Font.GothamBold
LoadingPercent.TextSize = 16
LoadingPercent.ZIndex = 12

local LoadingStatus = Instance.new("TextLabel")
LoadingStatus.Parent = LoadingMain
LoadingStatus.Size = UDim2.new(1,0,0,25)
LoadingStatus.Position = UDim2.new(0,0,0,110)
LoadingStatus.BackgroundTransparency = 1
LoadingStatus.Text = "MEMPERSIAPKAN..."
LoadingStatus.TextColor3 = Color3.fromRGB(200,200,200)
LoadingStatus.Font = Enum.Font.Gotham
LoadingStatus.TextSize = 11
LoadingStatus.ZIndex = 12

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,GUI_WIDTH,0,GUI_HEIGHT)
Frame.Position = UDim2.new(0.5,-GUI_WIDTH/2,0.5,-GUI_HEIGHT/2)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,35)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true

local Corner = Instance.new("UICorner")
Corner.Parent = Frame
Corner.CornerRadius = UDim.new(0,12)

local Stroke = Instance.new("UIStroke")
Stroke.Parent = Frame
Stroke.Color = Color3.fromRGB(45,45,55)
Stroke.Thickness = 1

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1,0,0,TITLE_HEIGHT)
TitleBar.BackgroundColor3 = Color3.fromRGB(35,35,45)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.Parent = TitleBar
TitleCorner.CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.Size = UDim2.new(1,-60,0,25)
Title.Position = UDim2.new(0,8,0,2)
Title.BackgroundTransparency = 1
Title.Text = "191 STORE"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local BillboardText = Instance.new("TextLabel")
BillboardText.Parent = TitleBar
BillboardText.Size = UDim2.new(1,-60,0,18)
BillboardText.Position = UDim2.new(0,8,0,24)
BillboardText.BackgroundTransparency = 1
BillboardText.Text = "Discord.gg/h5CWN2sP4y"
BillboardText.TextColor3 = Color3.fromRGB(100,200,255)
BillboardText.TextXAlignment = Enum.TextXAlignment.Left
BillboardText.Font = Enum.Font.Gotham
BillboardText.TextSize = 9
BillboardText.TextWrapped = true

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0,28,0,28)
CloseBtn.Position = UDim2.new(1,-34,0,8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = CloseBtn
CloseCorner.CornerRadius = UDim.new(0,6)

local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0,28,0,28)
MinBtn.Position = UDim2.new(1,-62,0,8)
MinBtn.BackgroundColor3 = Color3.fromRGB(60,60,70)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.TextSize = 16
MinBtn.Font = Enum.Font.GothamBold

local MinCorner = Instance.new("UICorner")
MinCorner.Parent = MinBtn
MinCorner.CornerRadius = UDim.new(0,6)

-- Billboard changer
local billboardMessages = {
    {text = "Discord.gg/h5CWN2sP4y", color = Color3.fromRGB(100,200,255)},
    {text = "Saran? ke dc ajaa", color = Color3.fromRGB(255,255,100)},
    {text = "Bug? lapor di dc", color = Color3.fromRGB(255,150,200)}
}
local currentBillboard = 1

task.spawn(function()
    while true do
        task.wait(60)
        currentBillboard = (currentBillboard % #billboardMessages) + 1
        BillboardText.Text = billboardMessages[currentBillboard].text
        BillboardText.TextColor3 = billboardMessages[currentBillboard].color
    end
end)

-- Tab Buttons (4 tab)
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1,0,0,TAB_HEIGHT)
TabFrame.Position = UDim2.new(0,0,0,TITLE_HEIGHT)
TabFrame.BackgroundColor3 = Color3.fromRGB(30,30,40)
TabFrame.BorderSizePixel = 0

local function createTabButton(parent, position, text, color)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(0.25,-2,1,-4)
    btn.Position = UDim2.new(position,2,0,2)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200,200,200)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextWrapped = true
    
    local corner = Instance.new("UICorner")
    corner.Parent = btn
    corner.CornerRadius = UDim.new(0,6)
    
    return btn
end

local TPTabBtn = createTabButton(TabFrame, 0, "🚀 TP", Color3.fromRGB(50,50,60))
local MSLoopTabBtn = createTabButton(TabFrame, 0.25, "🔄 MS", Color3.fromRGB(40,40,50))
local MSSafetyTabBtn = createTabButton(TabFrame, 0.5, "🛡️ SAFETY", Color3.fromRGB(40,40,50))
local AutoSellTabBtn = createTabButton(TabFrame, 0.75, "💰 SELL", Color3.fromRGB(40,40,50))

-- Content Container
local Content = Instance.new("Frame")
Content.Parent = Frame
Content.Size = UDim2.new(1,0,1,-(TITLE_HEIGHT + TAB_HEIGHT))
Content.Position = UDim2.new(0,0,0,TITLE_HEIGHT + TAB_HEIGHT)
Content.BackgroundColor3 = Color3.fromRGB(25,25,35)
Content.BorderSizePixel = 0
Content.BackgroundTransparency = 0.1

local ContentCorner = Instance.new("UICorner")
ContentCorner.Parent = Content
ContentCorner.CornerRadius = UDim.new(0,12)

-- TP Tab Content
local TPContent = Instance.new("ScrollingFrame")
TPContent.Parent = Content
TPContent.Size = UDim2.new(1,0,1,0)
TPContent.BackgroundTransparency = 1
TPContent.Visible = true
TPContent.ScrollBarThickness = 4
TPContent.CanvasSize = UDim2.new(0,0,0,180)

-- MS Loop Tab Content
local MSLoopContent = Instance.new("ScrollingFrame")
MSLoopContent.Parent = Content
MSLoopContent.Size = UDim2.new(1,0,1,0)
MSLoopContent.BackgroundTransparency = 1
MSLoopContent.Visible = false
MSLoopContent.ScrollBarThickness = 4
MSLoopContent.CanvasSize = UDim2.new(0,0,0,480)

-- MS SAFETY TAB CONTENT
local MSSafetyContent = Instance.new("ScrollingFrame")
MSSafetyContent.Parent = Content
MSSafetyContent.Size = UDim2.new(1,0,1,0)
MSSafetyContent.BackgroundTransparency = 1
MSSafetyContent.Visible = false
MSSafetyContent.ScrollBarThickness = 4
MSSafetyContent.CanvasSize = UDim2.new(0,0,0,360)

-- AUTO SELL TAB CONTENT
local AutoSellContent = Instance.new("ScrollingFrame")
AutoSellContent.Parent = Content
AutoSellContent.Size = UDim2.new(1,0,1,0)
AutoSellContent.BackgroundTransparency = 1
AutoSellContent.Visible = false
AutoSellContent.ScrollBarThickness = 4
AutoSellContent.CanvasSize = UDim2.new(0,0,0,220)

-- TP Buttons
local function createTPButton(parent, position, icon, title, desc, color)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = UDim2.new(1,-16,0,60)
    btn.Position = UDim2.new(0,8,0,position)
    btn.BackgroundColor3 = color or Color3.fromRGB(50,50,70)
    btn.Text = ""
    btn.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.Parent = btn
    corner.CornerRadius = UDim.new(0,8)
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Parent = btn
    iconLabel.Size = UDim2.new(0,40,1,0)
    iconLabel.Position = UDim2.new(0,8,0,0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 26
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextColor3 = Color3.fromRGB(255,255,255)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = btn
    titleLabel.Size = UDim2.new(1,-56,0,25)
    titleLabel.Position = UDim2.new(0,48,0,8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Parent = btn
    descLabel.Size = UDim2.new(1,-56,0,20)
    descLabel.Position = UDim2.new(0,48,0,33)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = desc
    descLabel.TextColor3 = Color3.fromRGB(180,180,180)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 10
    
    return btn
end

local BtnBahan = createTPButton(TPContent, 10, "⚒️", "TP MS BAHAN", "Material Storage", Color3.fromRGB(50,50,70))
local BtnRS = createTPButton(TPContent, 80, "🏥", "TP RS", "Hospital", Color3.fromRGB(70,50,50))

-- MS LOOP CONTENT
local MSLoopTitle = Instance.new("TextLabel")
MSLoopTitle.Parent = MSLoopContent
MSLoopTitle.Size = UDim2.new(1,-16,0,25)
MSLoopTitle.Position = UDim2.new(0,8,0,5)
MSLoopTitle.BackgroundTransparency = 1
MSLoopTitle.Text = "🔄 MS LOOP (AUTO TOOLS)"
MSLoopTitle.TextColor3 = Color3.fromRGB(100,255,100)
MSLoopTitle.TextXAlignment = Enum.TextXAlignment.Left
MSLoopTitle.Font = Enum.Font.GothamBold
MSLoopTitle.TextSize = 12

local MSLoopStatus = Instance.new("TextLabel")
MSLoopStatus.Parent = MSLoopContent
MSLoopStatus.Size = UDim2.new(1,-16,0,32)
MSLoopStatus.Position = UDim2.new(0,8,0,35)
MSLoopStatus.BackgroundColor3 = Color3.fromRGB(40,40,50)
MSLoopStatus.Text = "⏹️ LOOP STOPPED"
MSLoopStatus.TextColor3 = Color3.fromRGB(255,100,100)
MSLoopStatus.Font = Enum.Font.GothamBold
MSLoopStatus.TextSize = 12

local MSLoopStatusCorner = Instance.new("UICorner")
MSLoopStatusCorner.Parent = MSLoopStatus
MSLoopStatusCorner.CornerRadius = UDim.new(0,6)

-- INDICATOR BELI TOOLS
local BuyIndicatorFrame = Instance.new("Frame")
BuyIndicatorFrame.Parent = MSLoopContent
BuyIndicatorFrame.Size = UDim2.new(1,-16,0,130)
BuyIndicatorFrame.Position = UDim2.new(0,8,0,75)
BuyIndicatorFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
BuyIndicatorFrame.BorderSizePixel = 0

local BuyIndicatorCorner = Instance.new("UICorner")
BuyIndicatorCorner.Parent = BuyIndicatorFrame
BuyIndicatorCorner.CornerRadius = UDim.new(0,8)

local BuyIndicatorTitle = Instance.new("TextLabel")
BuyIndicatorTitle.Parent = BuyIndicatorFrame
BuyIndicatorTitle.Size = UDim2.new(1,-12,0,20)
BuyIndicatorTitle.Position = UDim2.new(0,6,0,5)
BuyIndicatorTitle.BackgroundTransparency = 1
BuyIndicatorTitle.Text = "🛒 INDIKATOR"
BuyIndicatorTitle.TextColor3 = Color3.fromRGB(255,255,100)
BuyIndicatorTitle.TextXAlignment = Enum.TextXAlignment.Left
BuyIndicatorTitle.Font = Enum.Font.GothamBold
BuyIndicatorTitle.TextSize = 11

local BisaMasak = Instance.new("TextLabel")
BisaMasak.Parent = BuyIndicatorFrame
BisaMasak.Size = UDim2.new(1,-12,0,22)
BisaMasak.Position = UDim2.new(0,6,0,28)
BisaMasak.BackgroundTransparency = 1
BisaMasak.Text = "🍳 BISA MASAK: 0"
BisaMasak.TextColor3 = Color3.fromRGB(255,255,255)
BisaMasak.TextXAlignment = Enum.TextXAlignment.Left
BisaMasak.Font = Enum.Font.GothamBold
BisaMasak.TextSize = 13

local WaterIndicator = Instance.new("TextLabel")
WaterIndicator.Parent = BuyIndicatorFrame
WaterIndicator.Size = UDim2.new(1,-12,0,20)
WaterIndicator.Position = UDim2.new(0,6,0,52)
WaterIndicator.BackgroundTransparency = 1
WaterIndicator.Text = "💧 WATER: 0"
WaterIndicator.TextColor3 = Color3.fromRGB(255,255,255)
WaterIndicator.TextXAlignment = Enum.TextXAlignment.Left
WaterIndicator.Font = Enum.Font.GothamBold
WaterIndicator.TextSize = 11

local SugarIndicator = Instance.new("TextLabel")
SugarIndicator.Parent = BuyIndicatorFrame
SugarIndicator.Size = UDim2.new(1,-12,0,20)
SugarIndicator.Position = UDim2.new(0,6,0,74)
SugarIndicator.BackgroundTransparency = 1
SugarIndicator.Text = "🍚 SUGAR: 0"
SugarIndicator.TextColor3 = Color3.fromRGB(255,255,255)
SugarIndicator.TextXAlignment = Enum.TextXAlignment.Left
SugarIndicator.Font = Enum.Font.GothamBold
SugarIndicator.TextSize = 11

local GelatinIndicator = Instance.new("TextLabel")
GelatinIndicator.Parent = BuyIndicatorFrame
GelatinIndicator.Size = UDim2.new(1,-12,0,20)
GelatinIndicator.Position = UDim2.new(0,6,0,96)
GelatinIndicator.BackgroundTransparency = 1
GelatinIndicator.Text = "🧪 GELATIN: 0"
GelatinIndicator.TextColor3 = Color3.fromRGB(255,255,255)
GelatinIndicator.TextXAlignment = Enum.TextXAlignment.Left
GelatinIndicator.Font = Enum.Font.GothamBold
GelatinIndicator.TextSize = 11

local MSLoopStepLabel = Instance.new("TextLabel")
MSLoopStepLabel.Parent = MSLoopContent
MSLoopStepLabel.Size = UDim2.new(1,-16,0,20)
MSLoopStepLabel.Position = UDim2.new(0,8,0,210)
MSLoopStepLabel.BackgroundTransparency = 1
MSLoopStepLabel.Text = "Step: Waiting..."
MSLoopStepLabel.TextColor3 = Color3.fromRGB(200,200,200)
MSLoopStepLabel.TextXAlignment = Enum.TextXAlignment.Left
MSLoopStepLabel.Font = Enum.Font.Gotham
MSLoopStepLabel.TextSize = 10

local MSLoopTimer = Instance.new("TextLabel")
MSLoopTimer.Parent = MSLoopContent
MSLoopTimer.Size = UDim2.new(1,-16,0,20)
MSLoopTimer.Position = UDim2.new(0,8,0,232)
MSLoopTimer.BackgroundTransparency = 1
MSLoopTimer.Text = "Timer: 0s"
MSLoopTimer.TextColor3 = Color3.fromRGB(200,200,200)
MSLoopTimer.TextXAlignment = Enum.TextXAlignment.Left
MSLoopTimer.Font = Enum.Font.Gotham
MSLoopTimer.TextSize = 10

local ToolStatus = Instance.new("TextLabel")
ToolStatus.Parent = MSLoopContent
ToolStatus.Size = UDim2.new(1,-16,0,20)
ToolStatus.Position = UDim2.new(0,8,0,254)
ToolStatus.BackgroundTransparency = 1
ToolStatus.Text = "Tool: -"
ToolStatus.TextColor3 = Color3.fromRGB(200,200,200)
ToolStatus.TextXAlignment = Enum.TextXAlignment.Left
ToolStatus.Font = Enum.Font.GothamBold
ToolStatus.TextSize = 10

local MSLoopStartBtn = Instance.new("TextButton")
MSLoopStartBtn.Parent = MSLoopContent
MSLoopStartBtn.Size = UDim2.new(0.5,-8,0,36)
MSLoopStartBtn.Position = UDim2.new(0,8,0,280)
MSLoopStartBtn.BackgroundColor3 = Color3.fromRGB(50,150,50)
MSLoopStartBtn.Text = "▶️ START"
MSLoopStartBtn.TextColor3 = Color3.fromRGB(255,255,255)
MSLoopStartBtn.Font = Enum.Font.GothamBold
MSLoopStartBtn.TextSize = 12

local MSLoopStartCorner = Instance.new("UICorner")
MSLoopStartCorner.Parent = MSLoopStartBtn
MSLoopStartCorner.CornerRadius = UDim.new(0,6)

local MSLoopStopBtn = Instance.new("TextButton")
MSLoopStopBtn.Parent = MSLoopContent
MSLoopStopBtn.Size = UDim2.new(0.5,-8,0,36)
MSLoopStopBtn.Position = UDim2.new(0.5,4,0,280)
MSLoopStopBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
MSLoopStopBtn.Text = "⏹️ STOP"
MSLoopStopBtn.TextColor3 = Color3.fromRGB(255,255,255)
MSLoopStopBtn.Font = Enum.Font.GothamBold
MSLoopStopBtn.TextSize = 12

local MSLoopStopCorner = Instance.new("UICorner")
MSLoopStopCorner.Parent = MSLoopStopBtn
MSLoopStopCorner.CornerRadius = UDim.new(0,6)

local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Parent = MSLoopContent
RefreshBtn.Size = UDim2.new(1,-16,0,28)
RefreshBtn.Position = UDim2.new(0,8,0,322)
RefreshBtn.BackgroundColor3 = Color3.fromRGB(60,60,80)
RefreshBtn.Text = "🔄 REFRESH"
RefreshBtn.TextColor3 = Color3.fromRGB(200,200,255)
RefreshBtn.Font = Enum.Font.GothamBold
RefreshBtn.TextSize = 11

local RefreshBtnCorner = Instance.new("UICorner")
RefreshBtnCorner.Parent = RefreshBtn
RefreshBtnCorner.CornerRadius = UDim.new(0,6)

-- MS SAFETY CONTENT
local MSSafetyTitle = Instance.new("TextLabel")
MSSafetyTitle.Parent = MSSafetyContent
MSSafetyTitle.Size = UDim2.new(1,-16,0,28)
MSSafetyTitle.Position = UDim2.new(0,8,0,5)
MSSafetyTitle.BackgroundTransparency = 1
MSSafetyTitle.Text = "🛡️ MS SAFETY"
MSSafetyTitle.TextColor3 = Color3.fromRGB(100,200,255)
MSSafetyTitle.TextXAlignment = Enum.TextXAlignment.Left
MSSafetyTitle.Font = Enum.Font.GothamBold
MSSafetyTitle.TextSize = 14

local function createBlinkButton(parent, yPos, icon, title, desc, color)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(1,-16,0,55)
    frame.Position = UDim2.new(0,8,0,yPos)
    frame.BackgroundColor3 = Color3.fromRGB(35,35,45)
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.Parent = frame
    corner.CornerRadius = UDim.new(0,8)
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Parent = frame
    iconLabel.Size = UDim2.new(0,40,1,0)
    iconLabel.Position = UDim2.new(0,8,0,0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextSize = 28
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextColor3 = Color3.fromRGB(255,255,255)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1,-100,0,22)
    titleLabel.Position = UDim2.new(0,48,0,8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 12
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Parent = frame
    descLabel.Size = UDim2.new(1,-100,0,18)
    descLabel.Position = UDim2.new(0,48,0,30)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = desc
    descLabel.TextColor3 = Color3.fromRGB(180,180,180)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 9
    
    local btn = Instance.new("TextButton")
    btn.Parent = frame
    btn.Size = UDim2.new(0,32,0,32)
    btn.Position = UDim2.new(1,-40,0.5,-16)
    btn.BackgroundColor3 = color
    btn.Text = "▶️"
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = btn
    btnCorner.CornerRadius = UDim.new(0,6)
    
    return frame, btn
end

local blinkAtasFrame, BlinkAtasBtn = createBlinkButton(MSSafetyContent, 40, "⬆️", "BLINK KE ATAS", "Naik 2 studs", Color3.fromRGB(150,100,200))
local blinkDownFrame, BlinkDownBtn = createBlinkButton(MSSafetyContent, 100, "⬇️", "BLINK KE BAWAH", "Turun 4 studs", Color3.fromRGB(0,150,200))
local blinkMajuFrame, BlinkMajuBtn = createBlinkButton(MSSafetyContent, 160, "➡️", "BLINK MAJU", "Maju 5 studs", Color3.fromRGB(0,200,100))
local blinkMundurFrame, BlinkMundurBtn = createBlinkButton(MSSafetyContent, 220, "⬅️", "BLINK MUNDUR", "Mundur 5 studs", Color3.fromRGB(200,100,0))

local BlinkStatus = Instance.new("TextLabel")
BlinkStatus.Parent = MSSafetyContent
BlinkStatus.Size = UDim2.new(1,-16,0,28)
BlinkStatus.Position = UDim2.new(0,8,0,285)
BlinkStatus.BackgroundColor3 = Color3.fromRGB(40,40,50)
BlinkStatus.Text = "klik aja ngab"
BlinkStatus.TextColor3 = Color3.fromRGB(100,255,100)
BlinkStatus.Font = Enum.Font.GothamBold
BlinkStatus.TextSize = 10

local BlinkStatusCorner = Instance.new("UICorner")
BlinkStatusCorner.Parent = BlinkStatus
BlinkStatusCorner.CornerRadius = UDim.new(0,6)

-- AUTO SELL CONTENT
local AutoSellTitle = Instance.new("TextLabel")
AutoSellTitle.Parent = AutoSellContent
AutoSellTitle.Size = UDim2.new(1,-16,0,28)
AutoSellTitle.Position = UDim2.new(0,8,0,8)
AutoSellTitle.BackgroundTransparency = 1
AutoSellTitle.Text = "💰 AUTO SELL"
AutoSellTitle.TextColor3 = Color3.fromRGB(100,255,100)
AutoSellTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoSellTitle.Font = Enum.Font.GothamBold
AutoSellTitle.TextSize = 16

local AutoSellDesc = Instance.new("TextLabel")
AutoSellDesc.Parent = AutoSellContent
AutoSellDesc.Size = UDim2.new(1,-16,0,20)
AutoSellDesc.Position = UDim2.new(0,8,0,38)
AutoSellDesc.BackgroundTransparency = 1
AutoSellDesc.Text = "Auto Sell Marshmallow"
AutoSellDesc.TextColor3 = Color3.fromRGB(200,200,200)
AutoSellDesc.TextXAlignment = Enum.TextXAlignment.Left
AutoSellDesc.Font = Enum.Font.Gotham
AutoSellDesc.TextSize = 10

local AutoSellStatusFrame = Instance.new("Frame")
AutoSellStatusFrame.Parent = AutoSellContent
AutoSellStatusFrame.Size = UDim2.new(1,-16,0,85)
AutoSellStatusFrame.Position = UDim2.new(0,8,0,65)
AutoSellStatusFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
AutoSellStatusFrame.BorderSizePixel = 0

local AutoSellStatusCorner = Instance.new("UICorner")
AutoSellStatusCorner.Parent = AutoSellStatusFrame
AutoSellStatusCorner.CornerRadius = UDim.new(0,8)

local AutoSellIcon = Instance.new("TextLabel")
AutoSellIcon.Parent = AutoSellStatusFrame
AutoSellIcon.Size = UDim2.new(0,45,1,0)
AutoSellIcon.Position = UDim2.new(0,8,0,0)
AutoSellIcon.BackgroundTransparency = 1
AutoSellIcon.Text = "💰"
AutoSellIcon.TextSize = 40
AutoSellIcon.Font = Enum.Font.GothamBold
AutoSellIcon.TextColor3 = Color3.fromRGB(255,255,100)

local AutoSellStatusTitle = Instance.new("TextLabel")
AutoSellStatusTitle.Parent = AutoSellStatusFrame
AutoSellStatusTitle.Size = UDim2.new(1,-70,0,22)
AutoSellStatusTitle.Position = UDim2.new(0,55,0,8)
AutoSellStatusTitle.BackgroundTransparency = 1
AutoSellStatusTitle.Text = "STATUS"
AutoSellStatusTitle.TextColor3 = Color3.fromRGB(255,255,255)
AutoSellStatusTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoSellStatusTitle.Font = Enum.Font.GothamBold
AutoSellStatusTitle.TextSize = 12

local AutoSellStatus = Instance.new("TextLabel")
AutoSellStatus.Parent = AutoSellStatusFrame
AutoSellStatus.Size = UDim2.new(1,-70,0,22)
AutoSellStatus.Position = UDim2.new(0,55,0,30)
AutoSellStatus.BackgroundTransparency = 1
AutoSellStatus.Text = "⏹️ STOPPED"
AutoSellStatus.TextColor3 = Color3.fromRGB(255,100,100)
AutoSellStatus.TextXAlignment = Enum.TextXAlignment.Left
AutoSellStatus.Font = Enum.Font.GothamBold
AutoSellStatus.TextSize = 12

local AutoSellCounter = Instance.new("TextLabel")
AutoSellCounter.Parent = AutoSellStatusFrame
AutoSellCounter.Size = UDim2.new(1,-70,0,18)
AutoSellCounter.Position = UDim2.new(0,55,0,52)
AutoSellCounter.BackgroundTransparency = 1
AutoSellCounter.Text = "Terjual: 0"
AutoSellCounter.TextColor3 = Color3.fromRGB(100,255,255)
AutoSellCounter.TextXAlignment = Enum.TextXAlignment.Left
AutoSellCounter.Font = Enum.Font.GothamBold
AutoSellCounter.TextSize = 10

local AutoSellInfo = Instance.new("TextLabel")
AutoSellInfo.Parent = AutoSellStatusFrame
AutoSellInfo.Size = UDim2.new(1,-70,0,15)
AutoSellInfo.Position = UDim2.new(0,55,0,70)
AutoSellInfo.BackgroundTransparency = 1
AutoSellInfo.Text = "Tools: 0"
AutoSellInfo.TextColor3 = Color3.fromRGB(200,200,200)
AutoSellInfo.TextXAlignment = Enum.TextXAlignment.Left
AutoSellInfo.Font = Enum.Font.Gotham
AutoSellInfo.TextSize = 9

local AutoSellButtonFrame = Instance.new("Frame")
AutoSellButtonFrame.Parent = AutoSellContent
AutoSellButtonFrame.Size = UDim2.new(1,-16,0,45)
AutoSellButtonFrame.Position = UDim2.new(0,8,0,158)
AutoSellButtonFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
AutoSellButtonFrame.BorderSizePixel = 0

local AutoSellButtonCorner = Instance.new("UICorner")
AutoSellButtonCorner.Parent = AutoSellButtonFrame
AutoSellButtonCorner.CornerRadius = UDim.new(0,8)

local AutoSellStartBtn = Instance.new("TextButton")
AutoSellStartBtn.Parent = AutoSellButtonFrame
AutoSellStartBtn.Size = UDim2.new(0.5,-8,0,32)
AutoSellStartBtn.Position = UDim2.new(0,6,0,6)
AutoSellStartBtn.BackgroundColor3 = Color3.fromRGB(50,150,50)
AutoSellStartBtn.Text = "▶️ START"
AutoSellStartBtn.TextColor3 = Color3.fromRGB(255,255,255)
AutoSellStartBtn.Font = Enum.Font.GothamBold
AutoSellStartBtn.TextSize = 12

local AutoSellStartCorner = Instance.new("UICorner")
AutoSellStartCorner.Parent = AutoSellStartBtn
AutoSellStartCorner.CornerRadius = UDim.new(0,6)

local AutoSellStopBtn = Instance.new("TextButton")
AutoSellStopBtn.Parent = AutoSellButtonFrame
AutoSellStopBtn.Size = UDim2.new(0.5,-8,0,32)
AutoSellStopBtn.Position = UDim2.new(0.5,2,0,6)
AutoSellStopBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
AutoSellStopBtn.Text = "⏹️ STOP"
AutoSellStopBtn.TextColor3 = Color3.fromRGB(255,255,255)
AutoSellStopBtn.Font = Enum.Font.GothamBold
AutoSellStopBtn.TextSize = 12

local AutoSellStopCorner = Instance.new("UICorner")
AutoSellStopCorner.Parent = AutoSellStopBtn
AutoSellStopCorner.CornerRadius = UDim.new(0,6)

-- [Semua fungsi tetap sama seperti sebelumnya]
-- (Function countTools, updateBuyIndicators, getSellTools, countSellTools, 
--  startAutoSell, stopAutoSell, findTool, equipTool, pressE,
--  blinkAtas, blinkDown, blinkMaju, blinkMundur, startMSLoop,
--  smoothTeleport, TP_MS_BAHAN, TP_RS, closeGUI tetap sama)

-- Variables
local loopRunning = false
local autoSellRunning = false
local autoSellCount = 0

local SELL_TOOLS = {
    "Small Marshmallow Bag",
    "Medium Marshmallow Bag", 
    "Large Marshmallow Bag"
}

-- [Sisanya fungsi-fungsi tetap sama, hanya disesuaikan ukuran GUI]

-- BUTTON CONNECTIONS (sama seperti sebelumnya)
CloseBtn.MouseButton1Click:Connect(closeGUI)
BtnBahan.MouseButton1Click:Connect(TP_MS_BAHAN)
BtnRS.MouseButton1Click:Connect(TP_RS)

MSLoopStartBtn.MouseButton1Click:Connect(function()
    if not loopRunning then
        task.spawn(startMSLoop)
    end
end)

MSLoopStopBtn.MouseButton1Click:Connect(function()
    loopRunning = false
end)

RefreshBtn.MouseButton1Click:Connect(updateBuyIndicators)

BlinkAtasBtn.MouseButton1Click:Connect(blinkAtas)
BlinkDownBtn.MouseButton1Click:Connect(blinkDown)
BlinkMajuBtn.MouseButton1Click:Connect(blinkMaju)
BlinkMundurBtn.MouseButton1Click:Connect(blinkMundur)

AutoSellStartBtn.MouseButton1Click:Connect(function()
    if not autoSellRunning then
        startAutoSell()
    end
end)

AutoSellStopBtn.MouseButton1Click:Connect(function()
    stopAutoSell()
end)

-- Tab Switching
local function switchTab(activeTab)
    TPContent.Visible = false
    MSLoopContent.Visible = false
    MSSafetyContent.Visible = false
    AutoSellContent.Visible = false
    
    local btns = {TPTabBtn, MSLoopTabBtn, MSSafetyTabBtn, AutoSellTabBtn}
    for _, btn in ipairs(btns) do
        btn.BackgroundColor3 = Color3.fromRGB(40,40,50)
        btn.TextColor3 = Color3.fromRGB(200,200,200)
    end
    
    activeTab.btn.BackgroundColor3 = Color3.fromRGB(50,50,60)
    activeTab.btn.TextColor3 = Color3.fromRGB(255,255,255)
    activeTab.content.Visible = true
end

TPTabBtn.MouseButton1Click:Connect(function()
    switchTab({btn = TPTabBtn, content = TPContent})
end)

MSLoopTabBtn.MouseButton1Click:Connect(function()
    switchTab({btn = MSLoopTabBtn, content = MSLoopContent})
    updateBuyIndicators()
end)

MSSafetyTabBtn.MouseButton1Click:Connect(function()
    switchTab({btn = MSSafetyTabBtn, content = MSSafetyContent})
end)

AutoSellTabBtn.MouseButton1Click:Connect(function()
    switchTab({btn = AutoSellTabBtn, content = AutoSellContent})
    AutoSellInfo.Text = "Tools: " .. countSellTools()
end)

-- Minimize
local minimized = false
local openSize = UDim2.new(0,GUI_WIDTH,0,GUI_HEIGHT)
local closedSize = UDim2.new(0,GUI_WIDTH,0,TITLE_HEIGHT + 4)
local tweenInfo = TweenInfo.new(0.3)

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TPContent.Visible = false
        MSLoopContent.Visible = false
        MSSafetyContent.Visible = false
        AutoSellContent.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
        TweenService:Create(Frame, tweenInfo, {Size = closedSize}):Play()
    else
        TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()
        task.wait(0.3)
        TPContent.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Z then
        minimized = not minimized
        if minimized then
            TPContent.Visible = false
            MSLoopContent.Visible = false
            MSSafetyContent.Visible = false
            AutoSellContent.Visible = false
            TabFrame.Visible = false
            MinBtn.Text = "□"
            TweenService:Create(Frame, tweenInfo, {Size = closedSize}):Play()
        else
            TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()
            task.wait(0.3)
            TPContent.Visible = true
            TabFrame.Visible = true
            MinBtn.Text = "−"
        end
    end
end)

-- Initial Animation
Frame.Size = UDim2.new(0,0,0,0)
task.wait(0.1)
TweenService:Create(Frame, tweenInfo, {Size = openSize}):Play()

-- Initial update
task.wait(1)
updateBuyIndicators()

-- Auto refresh every 2 seconds
task.spawn(function()
    while true do
        task.wait(2)
        if MSLoopContent.Visible then
            updateBuyIndicators()
        end
        if AutoSellContent.Visible then
            AutoSellInfo.Text = "Tools: " .. countSellTools()
        end
    end
end)
