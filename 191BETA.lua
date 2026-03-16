local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local remoteEvent = ReplicatedStorage:WaitForChild("FlingEvent")

-- Tunggu sampai player siap
repeat task.wait() until player.Character and player:FindFirstChild("PlayerGui")

-- Hapus GUI lama kalau ada
local oldGui = player.PlayerGui:FindFirstChild("FlingGUI")
if oldGui then oldGui:Destroy() end

-- Buat GUI baru
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlingGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- Frame utama
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 280, 0, 160)
mainFrame.Position = UDim2.new(0, 30, 0.5, -80)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
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
shadow.ImageTransparency = 0.5
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ FLING CONTROLLER ⚡"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 16
titleText.Parent = titleBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Content frame
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -45)
content.Position = UDim2.new(0, 10, 0, 40)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Radius label
local radiusLabel = Instance.new("TextLabel")
radiusLabel.Size = UDim2.new(1, 0, 0, 25)
radiusLabel.BackgroundTransparency = 1
radiusLabel.Text = "Radius: 50"
radiusLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
radiusLabel.TextXAlignment = Enum.TextXAlignment.Left
radiusLabel.Font = Enum.Font.Gotham
radiusLabel.TextSize = 14
radiusLabel.Parent = content

-- Slider background
local sliderBg = Instance.new("Frame")
sliderBg.Size = UDim2.new(1, 0, 0, 20)
sliderBg.Position = UDim2.new(0, 0, 0, 25)
sliderBg.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
sliderBg.BorderSizePixel = 0
sliderBg.Parent = content

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 10)
sliderCorner.Parent = sliderBg

-- Slider fill
local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new(0.005, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 10)
fillCorner.Parent = sliderFill

-- Slider button
local sliderBtn = Instance.new("TextButton")
sliderBtn.Size = UDim2.new(0, 16, 0, 16)
sliderBtn.Position = UDim2.new(0.005, -8, 0.5, -8)
sliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderBtn.Text = ""
sliderBtn.ZIndex = 2
sliderBtn.Parent = sliderBg

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = sliderBtn

-- Variables
local currentRadius = 50
local minRadius = 1
local maxRadius = 10000
local dragging = false

-- Update function
local function updateRadius(value)
	value = math.clamp(value, minRadius, maxRadius)
	currentRadius = math.floor(value)
	radiusLabel.Text = "Radius: " .. currentRadius
	
	local percentage = (value - minRadius) / (maxRadius - minRadius)
	sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
	sliderBtn.Position = UDim2.new(percentage, -8, 0.5, -8)
	
	-- Kirim ke server
	remoteEvent:FireServer({
		type = "updateRadius",
		radius = currentRadius
	})
end

-- Slider dragging
sliderBtn.MouseButton1Down:Connect(function()
	dragging = true
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local mousePos = UserInputService:GetMouseLocation()
		local sliderPos = sliderBg.AbsolutePosition
		local sliderSize = sliderBg.AbsoluteSize.X
		
		local relativeX = math.clamp(mousePos.X - sliderPos.X, 0, sliderSize)
		local percentage = relativeX / sliderSize
		local newRadius = minRadius + (percentage * (maxRadius - minRadius))
		
		updateRadius(newRadius)
	end
end)

-- Input manual
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.6, -5, 0, 30)
inputBox.Position = UDim2.new(0, 0, 0, 55)
inputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
inputBox.PlaceholderText = "Radius 1-10000"
inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
inputBox.Text = "50"
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.TextSize = 14
inputBox.Font = Enum.Font.Gotham
inputBox.ClearTextOnFocus = false
inputBox.Parent = content

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent = inputBox

local setBtn = Instance.new("TextButton")
setBtn.Size = UDim2.new(0.4, -5, 0, 30)
setBtn.Position = UDim2.new(0.6, 5, 0, 55)
setBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
setBtn.Text = "SET"
setBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
setBtn.TextSize = 14
setBtn.Font = Enum.Font.GothamBold
setBtn.Parent = content

local setCorner = Instance.new("UICorner")
setCorner.CornerRadius = UDim.new(0, 6)
setCorner.Parent = setBtn

setBtn.MouseButton1Click:Connect(function()
	local value = tonumber(inputBox.Text)
	if value then
		value = math.clamp(value, minRadius, maxRadius)
		inputBox.Text = tostring(value)
		updateRadius(value)
	end
end)

-- Info text
local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, 0, 0, 30)
infoText.Position = UDim2.new(0, 0, 0, 95)
infoText.BackgroundTransparency = 1
infoText.Text = "Klik tool untuk fling!"
infoText.TextColor3 = Color3.fromRGB(255, 200, 100)
infoText.TextSize = 14
infoText.Font = Enum.Font.GothamBold
infoText.Parent = content

-- Status
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0, 25)
statusText.Position = UDim2.new(0, 0, 0, 125)
statusText.BackgroundTransparency = 1
statusText.Text = "🟢 READY"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.TextSize = 14
statusText.Font = Enum.Font.GothamBold
statusText.Parent = content

-- Initialize
updateRadius(50)

-- Animasi masuk
mainFrame.Position = UDim2.new(0, -300, 0.5, -80)
local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 30, 0.5, -80)})
tween:Play()

print("GUI Fling telah dibuat!")
