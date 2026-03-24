local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

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

-- Tab Buttons
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1,0,0,TAB_HEIGHT)
TabFrame.Position = UDim2.new(0,0,0,TITLE_HEIGHT)
TabFrame.BackgroundColor3 = Color3.fromRGB(30,30,40)
TabFrame.BorderSizePixel = 0

local TPTabBtn = Instance.new("TextButton")
TPTabBtn.Parent = TabFrame
TPTabBtn.Size = UDim2.new(0.25,-2,1,-4)
TPTabBtn.Position = UDim2.new(0,2,0,2)
TPTabBtn.BackgroundColor3 = Color3.fromRGB(50,50,60)
TPTabBtn.Text = "🚀 TP"
TPTabBtn.TextColor3 = Color3.fromRGB(255,255,255)
TPTabBtn.Font = Enum.Font.GothamBold
TPTabBtn.TextSize = 11
local TPTabCorner = Instance.new("UICorner")
TPTabCorner.Parent = TPTabBtn
TPTabCorner.CornerRadius = UDim.new(0,6)

local MSLoopTabBtn = Instance.new("TextButton")
MSLoopTabBtn.Parent = TabFrame
MSLoopTabBtn.Size = UDim2.new(0.25,-2,1,-4)
MSLoopTabBtn.Position = UDim2.new(0.25,0,0,2)
MSLoopTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
MSLoopTabBtn.Text = "🔄 MS"
MSLoopTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
MSLoopTabBtn.Font = Enum.Font.GothamBold
MSLoopTabBtn.TextSize = 11
local MSLoopTabCorner = Instance.new("UICorner")
MSLoopTabCorner.Parent = MSLoopTabBtn
MSLoopTabCorner.CornerRadius = UDim.new(0,6)

local MSSafetyTabBtn = Instance.new("TextButton")
MSSafetyTabBtn.Parent = TabFrame
MSSafetyTabBtn.Size = UDim2.new(0.25,-2,1,-4)
MSSafetyTabBtn.Position = UDim2.new(0.5,0,0,2)
MSSafetyTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
MSSafetyTabBtn.Text = "🛡️ SAFETY"
MSSafetyTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
MSSafetyTabBtn.Font = Enum.Font.GothamBold
MSSafetyTabBtn.TextSize = 10
local MSSafetyTabCorner = Instance.new("UICorner")
MSSafetyTabCorner.Parent = MSSafetyTabBtn
MSSafetyTabCorner.CornerRadius = UDim.new(0,6)

local AutoSellTabBtn = Instance.new("TextButton")
AutoSellTabBtn.Parent = TabFrame
AutoSellTabBtn.Size = UDim2.new(0.25,-2,1,-4)
AutoSellTabBtn.Position = UDim2.new(0.75,0,0,2)
AutoSellTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
AutoSellTabBtn.Text = "💰 SELL"
AutoSellTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
AutoSellTabBtn.Font = Enum.Font.GothamBold
AutoSellTabBtn.TextSize = 11
local AutoSellTabCorner = Instance.new("UICorner")
AutoSellTabCorner.Parent = AutoSellTabBtn
AutoSellTabCorner.CornerRadius = UDim.new(0,6)

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

-- ========== TP BUTTONS ==========
local BtnBahan = Instance.new("TextButton")
BtnBahan.Parent = TPContent
BtnBahan.Size = UDim2.new(1,-16,0,60)
BtnBahan.Position = UDim2.new(0,8,0,10)
BtnBahan.BackgroundColor3 = Color3.fromRGB(50,50,70)
BtnBahan.Text = ""
BtnBahan.BorderSizePixel = 0
local BtnBahanCorner = Instance.new("UICorner")
BtnBahanCorner.Parent = BtnBahan
BtnBahanCorner.CornerRadius = UDim.new(0,8)

local BahanIcon = Instance.new("TextLabel")
BahanIcon.Parent = BtnBahan
BahanIcon.Size = UDim2.new(0,40,1,0)
BahanIcon.Position = UDim2.new(0,8,0,0)
BahanIcon.BackgroundTransparency = 1
BahanIcon.Text = "⚒️"
BahanIcon.TextSize = 26
BahanIcon.Font = Enum.Font.GothamBold

local BahanText = Instance.new("TextLabel")
BahanText.Parent = BtnBahan
BahanText.Size = UDim2.new(1,-56,0,25)
BahanText.Position = UDim2.new(0,48,0,8)
BahanText.BackgroundTransparency = 1
BahanText.Text = "TP MS BAHAN"
BahanText.TextColor3 = Color3.fromRGB(255,255,255)
BahanText.TextXAlignment = Enum.TextXAlignment.Left
BahanText.Font = Enum.Font.GothamBold
BahanText.TextSize = 14

local BahanDesc = Instance.new("TextLabel")
BahanDesc.Parent = BtnBahan
BahanDesc.Size = UDim2.new(1,-56,0,20)
BahanDesc.Position = UDim2.new(0,48,0,33)
BahanDesc.BackgroundTransparency = 1
BahanDesc.Text = "Material Storage"
BahanDesc.TextColor3 = Color3.fromRGB(180,180,180)
BahanDesc.TextXAlignment = Enum.TextXAlignment.Left
BahanDesc.Font = Enum.Font.Gotham
BahanDesc.TextSize = 10

local BtnRS = Instance.new("TextButton")
BtnRS.Parent = TPContent
BtnRS.Size = UDim2.new(1,-16,0,60)
BtnRS.Position = UDim2.new(0,8,0,80)
BtnRS.BackgroundColor3 = Color3.fromRGB(70,50,50)
BtnRS.Text = ""
BtnRS.BorderSizePixel = 0
local BtnRSCorner = Instance.new("UICorner")
BtnRSCorner.Parent = BtnRS
BtnRSCorner.CornerRadius = UDim.new(0,8)

local RSIcon = Instance.new("TextLabel")
RSIcon.Parent = BtnRS
RSIcon.Size = UDim2.new(0,40,1,0)
RSIcon.Position = UDim2.new(0,8,0,0)
RSIcon.BackgroundTransparency = 1
RSIcon.Text = "🏥"
RSIcon.TextSize = 26
RSIcon.Font = Enum.Font.GothamBold

local RSText = Instance.new("TextLabel")
RSText.Parent = BtnRS
RSText.Size = UDim2.new(1,-56,0,25)
RSText.Position = UDim2.new(0,48,0,8)
RSText.BackgroundTransparency = 1
RSText.Text = "TP RS"
RSText.TextColor3 = Color3.fromRGB(255,255,255)
RSText.TextXAlignment = Enum.TextXAlignment.Left
RSText.Font = Enum.Font.GothamBold
RSText.TextSize = 14

local RSDesc = Instance.new("TextLabel")
RSDesc.Parent = BtnRS
RSDesc.Size = UDim2.new(1,-56,0,20)
RSDesc.Position = UDim2.new(0,48,0,33)
RSDesc.BackgroundTransparency = 1
RSDesc.Text = "Hospital"
RSDesc.TextColor3 = Color3.fromRGB(180,180,180)
RSDesc.TextXAlignment = Enum.TextXAlignment.Left
RSDesc.Font = Enum.Font.Gotham
RSDesc.TextSize = 10

-- ========== MS LOOP CONTENT ==========
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

-- INDICATOR
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

-- ========== MS SAFETY CONTENT ==========
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

-- Blink Atas
local BlinkAtasFrame = Instance.new("Frame")
BlinkAtasFrame.Parent = MSSafetyContent
BlinkAtasFrame.Size = UDim2.new(1,-16,0,55)
BlinkAtasFrame.Position = UDim2.new(0,8,0,40)
BlinkAtasFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
BlinkAtasFrame.BorderSizePixel = 0
local BlinkAtasCorner = Instance.new("UICorner")
BlinkAtasCorner.Parent = BlinkAtasFrame
BlinkAtasCorner.CornerRadius = UDim.new(0,8)

local BlinkAtasIcon = Instance.new("TextLabel")
BlinkAtasIcon.Parent = BlinkAtasFrame
BlinkAtasIcon.Size = UDim2.new(0,40,1,0)
BlinkAtasIcon.Position = UDim2.new(0,8,0,0)
BlinkAtasIcon.BackgroundTransparency = 1
BlinkAtasIcon.Text = "⬆️"
BlinkAtasIcon.TextSize = 28
BlinkAtasIcon.Font = Enum.Font.GothamBold

local BlinkAtasTitle = Instance.new("TextLabel")
BlinkAtasTitle.Parent = BlinkAtasFrame
BlinkAtasTitle.Size = UDim2.new(1,-100,0,22)
BlinkAtasTitle.Position = UDim2.new(0,48,0,8)
BlinkAtasTitle.BackgroundTransparency = 1
BlinkAtasTitle.Text = "BLINK KE ATAS"
BlinkAtasTitle.TextColor3 = Color3.fromRGB(255,255,255)
BlinkAtasTitle.TextXAlignment = Enum.TextXAlignment.Left
BlinkAtasTitle.Font = Enum.Font.GothamBold
BlinkAtasTitle.TextSize = 12

local BlinkAtasDesc = Instance.new("TextLabel")
BlinkAtasDesc.Parent = BlinkAtasFrame
BlinkAtasDesc.Size = UDim2.new(1,-100,0,18)
BlinkAtasDesc.Position = UDim2.new(0,48,0,30)
BlinkAtasDesc.BackgroundTransparency = 1
BlinkAtasDesc.Text = "Naik 2 studs"
BlinkAtasDesc.TextColor3 = Color3.fromRGB(180,180,180)
BlinkAtasDesc.TextXAlignment = Enum.TextXAlignment.Left
BlinkAtasDesc.Font = Enum.Font.Gotham
BlinkAtasDesc.TextSize = 9

local BlinkAtasBtn = Instance.new("TextButton")
BlinkAtasBtn.Parent = BlinkAtasFrame
BlinkAtasBtn.Size = UDim2.new(0,32,0,32)
BlinkAtasBtn.Position = UDim2.new(1,-40,0.5,-16)
BlinkAtasBtn.BackgroundColor3 = Color3.fromRGB(150,100,200)
BlinkAtasBtn.Text = "▶️"
BlinkAtasBtn.TextColor3 = Color3.fromRGB(255,255,255)
BlinkAtasBtn.TextSize = 14
BlinkAtasBtn.Font = Enum.Font.GothamBold
local BlinkAtasBtnCorner = Instance.new("UICorner")
BlinkAtasBtnCorner.Parent = BlinkAtasBtn
BlinkAtasBtnCorner.CornerRadius = UDim.new(0,6)

-- Blink Bawah
local BlinkDownFrame = Instance.new("Frame")
BlinkDownFrame.Parent = MSSafetyContent
BlinkDownFrame.Size = UDim2.new(1,-16,0,55)
BlinkDownFrame.Position = UDim2.new(0,8,0,100)
BlinkDownFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
BlinkDownFrame.BorderSizePixel = 0
local BlinkDownCorner = Instance.new("UICorner")
BlinkDownCorner.Parent = BlinkDownFrame
BlinkDownCorner.CornerRadius = UDim.new(0,8)

local BlinkDownIcon = Instance.new("TextLabel")
BlinkDownIcon.Parent = BlinkDownFrame
BlinkDownIcon.Size = UDim2.new(0,40,1,0)
BlinkDownIcon.Position = UDim2.new(0,8,0,0)
BlinkDownIcon.BackgroundTransparency = 1
BlinkDownIcon.Text = "⬇️"
BlinkDownIcon.TextSize = 28
BlinkDownIcon.Font = Enum.Font.GothamBold

local BlinkDownTitle = Instance.new("TextLabel")
BlinkDownTitle.Parent = BlinkDownFrame
BlinkDownTitle.Size = UDim2.new(1,-100,0,22)
BlinkDownTitle.Position = UDim2.new(0,48,0,8)
BlinkDownTitle.BackgroundTransparency = 1
BlinkDownTitle.Text = "BLINK KE BAWAH"
BlinkDownTitle.TextColor3 = Color3.fromRGB(255,255,255)
BlinkDownTitle.TextXAlignment = Enum.TextXAlignment.Left
BlinkDownTitle.Font = Enum.Font.GothamBold
BlinkDownTitle.TextSize = 12

local BlinkDownDesc = Instance.new("TextLabel")
BlinkDownDesc.Parent = BlinkDownFrame
BlinkDownDesc.Size = UDim2.new(1,-100,0,18)
BlinkDownDesc.Position = UDim2.new(0,48,0,30)
BlinkDownDesc.BackgroundTransparency = 1
BlinkDownDesc.Text = "Turun 4 studs"
BlinkDownDesc.TextColor3 = Color3.fromRGB(180,180,180)
BlinkDownDesc.TextXAlignment = Enum.TextXAlignment.Left
BlinkDownDesc.Font = Enum.Font.Gotham
BlinkDownDesc.TextSize = 9

local BlinkDownBtn = Instance.new("TextButton")
BlinkDownBtn.Parent = BlinkDownFrame
BlinkDownBtn.Size = UDim2.new(0,32,0,32)
BlinkDownBtn.Position = UDim2.new(1,-40,0.5,-16)
BlinkDownBtn.BackgroundColor3 = Color3.fromRGB(0,150,200)
BlinkDownBtn.Text = "▶️"
BlinkDownBtn.TextColor3 = Color3.fromRGB(255,255,255)
BlinkDownBtn.TextSize = 14
BlinkDownBtn.Font = Enum.Font.GothamBold
local BlinkDownBtnCorner = Instance.new("UICorner")
BlinkDownBtnCorner.Parent = BlinkDownBtn
BlinkDownBtnCorner.CornerRadius = UDim.new(0,6)

-- Blink Maju
local BlinkMajuFrame = Instance.new("Frame")
BlinkMajuFrame.Parent = MSSafetyContent
BlinkMajuFrame.Size = UDim2.new(1,-16,0,55)
BlinkMajuFrame.Position = UDim2.new(0,8,0,160)
BlinkMajuFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
BlinkMajuFrame.BorderSizePixel = 0
local BlinkMajuCorner = Instance.new("UICorner")
BlinkMajuCorner.Parent = BlinkMajuFrame
BlinkMajuCorner.CornerRadius = UDim.new(0,8)

local BlinkMajuIcon = Instance.new("TextLabel")
BlinkMajuIcon.Parent = BlinkMajuFrame
BlinkMajuIcon.Size = UDim2.new(0,40,1,0)
BlinkMajuIcon.Position = UDim2.new(0,8,0,0)
BlinkMajuIcon.BackgroundTransparency = 1
BlinkMajuIcon.Text = "➡️"
BlinkMajuIcon.TextSize = 28
BlinkMajuIcon.Font = Enum.Font.GothamBold

local BlinkMajuTitle = Instance.new("TextLabel")
BlinkMajuTitle.Parent = BlinkMajuFrame
BlinkMajuTitle.Size = UDim2.new(1,-100,0,22)
BlinkMajuTitle.Position = UDim2.new(0,48,0,8)
BlinkMajuTitle.BackgroundTransparency = 1
BlinkMajuTitle.Text = "BLINK MAJU"
BlinkMajuTitle.TextColor3 = Color3.fromRGB(255,255,255)
BlinkMajuTitle.TextXAlignment = Enum.TextXAlignment.Left
BlinkMajuTitle.Font = Enum.Font.GothamBold
BlinkMajuTitle.TextSize = 12

local BlinkMajuDesc = Instance.new("TextLabel")
BlinkMajuDesc.Parent = BlinkMajuFrame
BlinkMajuDesc.Size = UDim2.new(1,-100,0,18)
BlinkMajuDesc.Position = UDim2.new(0,48,0,30)
BlinkMajuDesc.BackgroundTransparency = 1
BlinkMajuDesc.Text = "Maju 5 studs"
BlinkMajuDesc.TextColor3 = Color3.fromRGB(180,180,180)
BlinkMajuDesc.TextXAlignment = Enum.TextXAlignment.Left
BlinkMajuDesc.Font = Enum.Font.Gotham
BlinkMajuDesc.TextSize = 9

local BlinkMajuBtn = Instance.new("TextButton")
BlinkMajuBtn.Parent = BlinkMajuFrame
BlinkMajuBtn.Size = UDim2.new(0,32,0,32)
BlinkMajuBtn.Position = UDim2.new(1,-40,0.5,-16)
BlinkMajuBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
BlinkMajuBtn.Text = "▶️"
BlinkMajuBtn.TextColor3 = Color3.fromRGB(255,255,255)
BlinkMajuBtn.TextSize = 14
BlinkMajuBtn.Font = Enum.Font.GothamBold
local BlinkMajuBtnCorner = Instance.new("UICorner")
BlinkMajuBtnCorner.Parent = BlinkMajuBtn
BlinkMajuBtnCorner.CornerRadius = UDim.new(0,6)

-- Blink Mundur
local BlinkMundurFrame = Instance.new("Frame")
BlinkMundurFrame.Parent = MSSafetyContent
BlinkMundurFrame.Size = UDim2.new(1,-16,0,55)
BlinkMundurFrame.Position = UDim2.new(0,8,0,220)
BlinkMundurFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
BlinkMundurFrame.BorderSizePixel = 0
local BlinkMundurCorner = Instance.new("UICorner")
BlinkMundurCorner.Parent = BlinkMundurFrame
BlinkMundurCorner.CornerRadius = UDim.new(0,8)

local BlinkMundurIcon = Instance.new("TextLabel")
BlinkMundurIcon.Parent = BlinkMundurFrame
BlinkMundurIcon.Size = UDim2.new(0,40,1,0)
BlinkMundurIcon.Position = UDim2.new(0,8,0,0)
BlinkMundurIcon.BackgroundTransparency = 1
BlinkMundurIcon.Text = "⬅️"
BlinkMundurIcon.TextSize = 28
BlinkMundurIcon.Font = Enum.Font.GothamBold

local BlinkMundurTitle = Instance.new("TextLabel")
BlinkMundurTitle.Parent = BlinkMundurFrame
BlinkMundurTitle.Size = UDim2.new(1,-100,0,22)
BlinkMundurTitle.Position = UDim2.new(0,48,0,8)
BlinkMundurTitle.BackgroundTransparency = 1
BlinkMundurTitle.Text = "BLINK MUNDUR"
BlinkMundurTitle.TextColor3 = Color3.fromRGB(255,255,255)
BlinkMundurTitle.TextXAlignment = Enum.TextXAlignment.Left
BlinkMundurTitle.Font = Enum.Font.GothamBold
BlinkMundurTitle.TextSize = 12

local BlinkMundurDesc = Instance.new("TextLabel")
BlinkMundurDesc.Parent = BlinkMundurFrame
BlinkMundurDesc.Size = UDim2.new(1,-100,0,18)
BlinkMundurDesc.Position = UDim2.new(0,48,0,30)
BlinkMundurDesc.BackgroundTransparency = 1
BlinkMundurDesc.Text = "Mundur 5 studs"
BlinkMundurDesc.TextColor3 = Color3.fromRGB(180,180,180)
BlinkMundurDesc.TextXAlignment = Enum.TextXAlignment.Left
BlinkMundurDesc.Font = Enum.Font.Gotham
BlinkMundurDesc.TextSize = 9

local BlinkMundurBtn = Instance.new("TextButton")
BlinkMundurBtn.Parent = BlinkMundurFrame
BlinkMundurBtn.Size = UDim2.new(0,32,0,32)
BlinkMundurBtn.Position = UDim2.new(1,-40,0.5,-16)
BlinkMundurBtn.BackgroundColor3 = Color3.fromRGB(200,100,0)
BlinkMundurBtn.Text = "▶️"
BlinkMundurBtn.TextColor3 = Color3.fromRGB(255,255,255)
BlinkMundurBtn.TextSize = 14
BlinkMundurBtn.Font = Enum.Font.GothamBold
local BlinkMundurBtnCorner = Instance.new("UICorner")
BlinkMundurBtnCorner.Parent = BlinkMundurBtn
BlinkMundurBtnCorner.CornerRadius = UDim.new(0,6)

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

-- ========== AUTO SELL CONTENT ==========
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

-- ========== FUNCTIONS ==========
local function countTools(toolName)
    local count = 0
    if not player.Character then return count end
    
    for _, child in pairs(player.Character:GetChildren()) do
        if child:IsA("Tool") and string.find(string.lower(child.Name), string.lower(toolName)) then
            count = count + 1
        end
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, child in pairs(backpack:GetChildren()) do
            if child:IsA("Tool") and string.find(string.lower(child.Name), string.lower(toolName)) then
                count = count + 1
            end
        end
    end
    
    return count
end

local function updateBuyIndicators()
    local waterCount = countTools("water")
    WaterIndicator.Text = "💧 WATER: " .. waterCount
    if waterCount > 0 then
        WaterIndicator.TextColor3 = Color3.fromRGB(100,200,255)
    else
        WaterIndicator.TextColor3 = Color3.fromRGB(255,255,255)
    end
    
    local sugarCount = countTools("sugar")
    SugarIndicator.Text = "🍚 SUGAR: " .. sugarCount
    if sugarCount > 0 then
        SugarIndicator.TextColor3 = Color3.fromRGB(100,200,255)
    else
        SugarIndicator.TextColor3 = Color3.fromRGB(255,255,255)
    end
    
    local gelatinCount = countTools("gelatin")
    GelatinIndicator.Text = "🧪 GELATIN: " .. gelatinCount
    if gelatinCount > 0 then
        GelatinIndicator.TextColor3 = Color3.fromRGB(100,200,255)
    else
        GelatinIndicator.TextColor3 = Color3.fromRGB(255,255,255)
    end
    
    local bisaMasak = math.min(waterCount, sugarCount, gelatinCount)
    BisaMasak.Text = "🍳 BISA MASAK: " .. bisaMasak
    
    if bisaMasak >= 3 then
        BisaMasak.TextColor3 = Color3.fromRGB(100,255,100)
    elseif bisaMasak >= 1 then
        BisaMasak.TextColor3 = Color3.fromRGB(255,255,100)
    else
        BisaMasak.TextColor3 = Color3.fromRGB(255,255,255)
    end
end

local SELL_TOOLS = {
    "Small Marshmallow Bag",
    "Medium Marshmallow Bag", 
    "Large Marshmallow Bag"
}

local function getSellTools()
    local tools = {}
    
    if player.Character then
        for _, child in pairs(player.Character:GetChildren()) do
            if child:IsA("Tool") then
                for _, toolName in ipairs(SELL_TOOLS) do
                    if child.Name == toolName then
                        table.insert(tools, child)
                        break
                    end
                end
            end
        end
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, child in pairs(backpack:GetChildren()) do
            if child:IsA("Tool") then
                for _, toolName in ipairs(SELL_TOOLS) do
                    if child.Name == toolName then
                        table.insert(tools, child)
                        break
                    end
                end
            end
        end
    end
    
    return tools
end

local function countSellTools()
    local count = 0
    
    if player.Character then
        for _, child in pairs(player.Character:GetChildren()) do
            if child:IsA("Tool") then
                for _, toolName in ipairs(SELL_TOOLS) do
                    if child.Name == toolName then
                        count = count + 1
                        break
                    end
                end
            end
        end
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, child in pairs(backpack:GetChildren()) do
            if child:IsA("Tool") then
                for _, toolName in ipairs(SELL_TOOLS) do
                    if child.Name == toolName then
                        count = count + 1
                        break
                    end
                end
            end
        end
    end
    
    return count
end

local autoSellRunning = false
local autoSellCount = 0

local function startAutoSell()
    if autoSellRunning then return end
    
    autoSellRunning = true
    autoSellCount = 0
    AutoSellStatus.Text = "▶️ RUNNING"
    AutoSellStatus.TextColor3 = Color3.fromRGB(100,255,100)
    
    task.spawn(function()
        while autoSellRunning do
            local tools = getSellTools()
            local totalTools = #tools
            
            AutoSellInfo.Text = "Tools: " .. totalTools
            
            if totalTools > 0 then
                for i, tool in ipairs(tools) do
                    if not autoSellRunning then break end
                    
                    if tool and tool.Parent then
                        if tool.Parent == player:FindFirstChild("Backpack") then
                            local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid:EquipTool(tool)
                                task.wait(0.3)
                            end
                        end
                        
                        AutoSellStatus.Text = "▶️ HOLD E..."
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        
                        local holdStart = tick()
                        while autoSellRunning and (tick() - holdStart) < 2 do
                            task.wait(0.1)
                        end
                        
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        
                        autoSellCount = autoSellCount + 1
                        AutoSellCounter.Text = "Terjual: " .. autoSellCount
                        AutoSellStatus.Text = "▶️ RUNNING"
                        
                        task.wait(1)
                    end
                end
            else
                AutoSellInfo.Text = "Tools: 0"
                task.wait(2)
            end
            
            task.wait(0.5)
        end
    end)
end

local function stopAutoSell()
    autoSellRunning = false
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    AutoSellStatus.Text = "⏹️ STOPPED"
    AutoSellStatus.TextColor3 = Color3.fromRGB(255,100,100)
    AutoSellInfo.Text = "Tools: 0"
end

local function findTool(toolName)
    if not player.Character then return nil end
    for _, child in pairs(player.Character:GetChildren()) do
        if child:IsA("Tool") and string.find(string.lower(child.Name), string.lower(toolName)) then
            return child
        end
    end
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, child in pairs(backpack:GetChildren()) do
            if child:IsA("Tool") and string.find(string.lower(child.Name), string.lower(toolName)) then
                return child
            end
        end
    end
    return nil
end

local function equipTool(tool)
    if not tool or not player.Character then return false end
    if tool.Parent == player.Character then return true end
    if tool.Parent == player:FindFirstChild("Backpack") then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:EquipTool(tool)
            task.wait(0.2)
            return tool.Parent == player.Character
        end
    end
    return false
end

local function pressE()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

local loopRunning = false

local function startMSLoop()
    if loopRunning then return end
    
    loopRunning = true
    MSLoopStatus.Text = "▶️ LOOP RUNNING"
    MSLoopStatus.TextColor3 = Color3.fromRGB(100,255,100)
    
    task.spawn(function()
        while loopRunning do
            updateBuyIndicators()
            
            if not loopRunning then break end
            local waterTool = findTool("water")
            if waterTool and equipTool(waterTool) then
                ToolStatus.Text = "Tool: WATER"
                MSLoopStepLabel.Text = "Step 1: WATER"
                pressE()
                local startTime = tick()
                while loopRunning and (tick() - startTime) < 20 do
                    local remaining = 20 - (tick() - startTime)
                    MSLoopTimer.Text = string.format("Timer: %d/20s", math.floor(20 - remaining))
                    task.wait(0.1)
                end
            else
                MSLoopStepLabel.Text = "ERROR: Water tool not found!"
                break
            end
            
            updateBuyIndicators()
            
            if loopRunning then
                MSLoopStepLabel.Text = "Jeda 3 detik..."
                local jedaStart = tick()
                while loopRunning and (tick() - jedaStart) < 3 do
                    MSLoopTimer.Text = string.format("Jeda: %d/3s", math.floor(3 - (tick() - jedaStart)))
                    task.wait(0.1)
                end
            end
            
            if not loopRunning then break end
            
            updateBuyIndicators()
            
            local sugarTool = findTool("sugar")
            if sugarTool and equipTool(sugarTool) then
                ToolStatus.Text = "Tool: SUGAR"
                MSLoopStepLabel.Text = "Step 2: SUGAR"
                pressE()
                local startTime = tick()
                while loopRunning and (tick() - startTime) < 2 do
                    MSLoopTimer.Text = string.format("Timer: %d/2s", math.floor(2 - (tick() - startTime)))
                    task.wait(0.1)
                end
            else
                MSLoopStepLabel.Text = "ERROR: Sugar tool not found!"
                break
            end
            
            task.wait(0.2)
            if not loopRunning then break end
            
            updateBuyIndicators()
            
            local gelatinTool = findTool("gelatin")
            if gelatinTool and equipTool(gelatinTool) then
                ToolStatus.Text = "Tool: GELATIN"
                MSLoopStepLabel.Text = "Step 3: GELATIN"
                pressE()
                local startTime = tick()
                while loopRunning and (tick() - startTime) < 45 do
                    MSLoopTimer.Text = string.format("Timer: %d/45s", math.floor(45 - (tick() - startTime)))
                    task.wait(0.1)
                end
            else
                MSLoopStepLabel.Text = "ERROR: Gelatin tool not found!"
                break
            end
            
            updateBuyIndicators()
            
            if loopRunning then
                MSLoopStepLabel.Text = "Jeda 3 detik..."
                local jedaStart = tick()
                while loopRunning and (tick() - jedaStart) < 3 do
                    MSLoopTimer.Text = string.format("Jeda: %d/3s", math.floor(3 - (tick() - jedaStart)))
                    task.wait(0.1)
                end
            end
            
            if not loopRunning then break end
            
            updateBuyIndicators()
            
            local emptyTool = findTool("empty") or findTool("bag")
            if emptyTool and equipTool(emptyTool) then
                ToolStatus.Text = "Tool: EMPTY BAG"
                MSLoopStepLabel.Text = "Step 4: HASIL"
                pressE()
                local startTime = tick()
                while loopRunning and (tick() - startTime) < 2 do
                    MSLoopTimer.Text = string.format("Timer: %d/2s", math.floor(2 - (tick() - startTime)))
                    task.wait(0.1)
                end
            else
                MSLoopStepLabel.Text = "ERROR: Empty Bag tool not found!"
                break
            end
            
            task.wait(0.2)
            if not loopRunning then break end
            
            updateBuyIndicators()
            
            if loopRunning then
                MSLoopStepLabel.Text = "Loop complete! Restarting..."
                task.wait(1)
            end
        end
        
        loopRunning = false
        MSLoopStatus.Text = "⏹️ LOOP STOPPED"
        MSLoopStatus.TextColor3 = Color3.fromRGB(255,100,100)
        MSLoopStepLabel.Text = "Step: Stopped"
        MSLoopTimer.Text = "Timer: 0s"
        ToolStatus.Text = "Tool: -"
        updateBuyIndicators()
    end)
end

local function blinkAtas()
    local character = player.Character
    if not character then 
        BlinkStatus.Text = "❌ Character tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        BlinkStatus.Text = "❌ HumanoidRootPart tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    BlinkStatus.Text = "⬆️ Blink ke atas 2 studs..."
    BlinkStatus.TextColor3 = Color3.fromRGB(255,255,0)
    
    hrp.CFrame = hrp.CFrame * CFrame.new(0, 2, 0)
    
    BlinkStatus.Text = "✅ Sudah naik 2 studs!"
    BlinkStatus.TextColor3 = Color3.fromRGB(100,255,100)
end

local function blinkDown()
    local character = player.Character
    if not character then 
        BlinkStatus.Text = "❌ Character tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        BlinkStatus.Text = "❌ HumanoidRootPart tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    BlinkStatus.Text = "⬇️ Blink ke bawah 4 studs..."
    BlinkStatus.TextColor3 = Color3.fromRGB(255,255,0)
    
    hrp.CFrame = hrp.CFrame * CFrame.new(0, -4, 0)
    
    BlinkStatus.Text = "✅ Sudah turun 4 studs!"
    BlinkStatus.TextColor3 = Color3.fromRGB(100,255,100)
end

local function blinkMaju()
    local character = player.Character
    if not character then 
        BlinkStatus.Text = "❌ Character tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        BlinkStatus.Text = "❌ HumanoidRootPart tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    BlinkStatus.Text = "➡️ Blink maju 5 studs..."
    BlinkStatus.TextColor3 = Color3.fromRGB(255,255,0)
    
    local lookVector = hrp.CFrame.LookVector
    hrp.CFrame = hrp.CFrame + (lookVector * 5)
    
    BlinkStatus.Text = "✅ Sudah maju 5 studs!"
    BlinkStatus.TextColor3 = Color3.fromRGB(100,255,100)
end

local function blinkMundur()
    local character = player.Character
    if not character then 
        BlinkStatus.Text = "❌ Character tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        BlinkStatus.Text = "❌ HumanoidRootPart tidak ditemukan!"
        BlinkStatus.TextColor3 = Color3.fromRGB(255,100,100)
        return 
    end
    
    BlinkStatus.Text = "⬅️ Blink mundur 5 studs..."
    BlinkStatus.TextColor3 = Color3.fromRGB(255,255,0)
    
    local lookVector = hrp.CFrame.LookVector
    hrp.CFrame = hrp.CFrame - (lookVector * 5)
    
    BlinkStatus.Text = "✅ Sudah mundur 5 studs!"
    BlinkStatus.TextColor3 = Color3.fromRGB(100,255,100)
end

local function smoothTeleport(targetCFrame, duration)
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    LoadingFrame.Visible = true
    LoadingBar.Size = UDim2.new(0,0,1,0)
    LoadingPercent.Text = "0%"
    
    local startCF = hrp.CFrame
    local riseHeight = 65
    local upCF = startCF + Vector3.new(0, riseHeight, 0)
    local horizontalCF = CFrame.new(targetCFrame.X, upCF.Y, targetCFrame.Z) * CFrame.Angles(0, targetCFrame.Rotation.Y, 0)
    
    local totalSteps = 300
    local riseSteps = math.floor(totalSteps * 0.3)
    local travelSteps = math.floor(totalSteps * 0.4)
    local descendSteps = totalSteps - riseSteps - travelSteps
    local stepTime = duration / totalSteps
    
    LoadingStatus.Text = "FASE 1: NAIK..."
    
    for i = 1, riseSteps do
        if not hrp or not hrp.Parent then break end
        local alpha = i / riseSteps
        hrp.CFrame = startCF:Lerp(upCF, alpha)
        local percent = math.floor((i / totalSteps) * 100)
        LoadingBar.Size = UDim2.new(percent/100,0,1,0)
        LoadingPercent.Text = percent .. "%"
        task.wait(stepTime)
    end
    
    LoadingStatus.Text = "FASE 2: BERGERAK..."
    
    for i = 1, travelSteps do
        if not hrp or not hrp.Parent then break end
        local alpha = i / travelSteps
        hrp.CFrame = upCF:Lerp(horizontalCF, alpha)
        local stepIndex = riseSteps + i
        local percent = math.floor((stepIndex / totalSteps) * 100)
        LoadingBar.Size = UDim2.new(percent/100,0,1,0)
        LoadingPercent.Text = percent .. "%"
        task.wait(stepTime)
    end
    
    LoadingStatus.Text = "FASE 3: TURUN..."
    
    for i = 1, descendSteps do
        if not hrp or not hrp.Parent then break end
        local alpha = i / descendSteps
        hrp.CFrame = horizontalCF:Lerp(targetCFrame, alpha)
        local stepIndex = riseSteps + travelSteps + i
        local percent = math.floor((stepIndex / totalSteps) * 100)
        LoadingBar.Size = UDim2.new(percent/100,0,1,0)
        LoadingPercent.Text = percent .. "%"
        task.wait(stepTime)
    end
    
    hrp.CFrame = targetCFrame
    
    LoadingBar.Size = UDim2.new(1,0,1,0)
    LoadingPercent.Text = "100%"
    LoadingStatus.Text = "TELEPORT SELESAI!"
    task.wait(0.5)
    
    LoadingFrame.Visible = false
end

local function TP_MS_BAHAN()
    smoothTeleport(CFrame.new(521.32,47.79,617.25), 10)
end

local function TP_RS()
    smoothTeleport(CFrame.new(1065.19,28.47,420.76), 10)
end

local function closeGUI()
    if autoSellRunning then
        stopAutoSell()
    end
    if loopRunning then
        loopRunning = false
    end
    ScreenGui:Destroy()
end

-- ========== BUTTON CONNECTIONS ==========
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
    
    TPTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    MSLoopTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    MSSafetyTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    AutoSellTabBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    
    TPTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
    MSLoopTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
    MSSafetyTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
    AutoSellTabBtn.TextColor3 = Color3.fromRGB(200,200,200)
    
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
