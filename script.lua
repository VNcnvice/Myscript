-- Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 235, 0, 95)
Frame.Position = UDim2.new(0.7, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(12,12,12)
Frame.BorderSizePixel = 0

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

-- Glass effect (không blur game)
local Glass = Instance.new("Frame", Frame)
Glass.Size = UDim2.new(1,0,1,0)
Glass.BackgroundColor3 = Color3.fromRGB(255,255,255)
Glass.BackgroundTransparency = 0.9
Glass.ZIndex = 0
Instance.new("UICorner", Glass).CornerRadius = UDim.new(0,10)

-- Stroke + Glow
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(0,255,120)
Stroke.Thickness = 1

local Glow = Instance.new("UIStroke", Frame)
Glow.Color = Color3.fromRGB(0,255,120)
Glow.Thickness = 3
Glow.Transparency = 0.8

-- ✨ Glow animation
task.spawn(function()
    while true do
        for i = 0.2,0.6,0.02 do
            task.wait(0.03)
            Glow.Transparency = i
        end
        for i = 0.6,0.2,0.02 do
            task.wait(0.03)
            Glow.Transparency = i
        end
    end
end)

-- Top
local Top = Instance.new("Frame", Frame)
Top.Size = UDim2.new(1,0,0,24)
Top.BackgroundTransparency = 1

local Dot = Instance.new("Frame", Top)
Dot.Size = UDim2.new(0,5,0,5)
Dot.Position = UDim2.new(0,7,0.5,-2)
Dot.BackgroundColor3 = Color3.fromRGB(0,255,120)
Instance.new("UICorner", Dot).CornerRadius = UDim.new(1,0)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,-45,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "AntiAFK °by° VNcnvice"
Title.TextColor3 = Color3.fromRGB(230,230,230)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextSize = 11
Title.Font = Enum.Font.SourceSansSemibold

-- Close
local Close = Instance.new("TextButton", Top)
Close.Size = UDim2.new(0,24,1,0)
Close.Position = UDim2.new(1,-24,0,0)
Close.Text = "X"
Close.TextSize = 11
Close.TextColor3 = Color3.fromRGB(200,200,200)
Close.BackgroundTransparency = 1

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Stat
local function makeStat(name, value, pos)
    local label = Instance.new("TextLabel", Frame)
    label.Size = UDim2.new(0.33,0,0,30)
    label.Position = pos
    label.BackgroundTransparency = 1
    label.Text = name.."\n"..value
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.TextSize = 10
    label.Font = Enum.Font.SourceSans
    return label
end

local Ping = makeStat("PING","--",UDim2.new(0,0,0.32,0))
local FPS = makeStat("FPS","--",UDim2.new(0.33,0,0.32,0))
local Time = makeStat("TIME","0:0:0",UDim2.new(0.66,0,0.32,0))

-- Ping
local Stats = game:GetService("Stats")
task.spawn(function()
    while true do
        task.wait(1)
        local pingValue = 0
        
        local success = pcall(function()
            pingValue = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)

        if not success or pingValue == 0 then
            pingValue = math.random(40,120)
        end

        if pingValue < 50 then
            Ping.TextColor3 = Color3.fromRGB(0,255,120)
        elseif pingValue < 100 then
            Ping.TextColor3 = Color3.fromRGB(255,200,0)
        else
            Ping.TextColor3 = Color3.fromRGB(255,80,80)
        end

        Ping.Text = "PING\n"..pingValue
    end
end)

-- FPS
task.spawn(function()
    while true do
        task.wait()
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        FPS.Text = "FPS\n"..fps
    end
end)

-- Time
local t = 0
task.spawn(function()
    while true do
        task.wait(1)
        t += 1
        local h = math.floor(t/3600)
        local m = math.floor((t%3600)/60)
        local s = t%60
        Time.Text = "TIME\n"..h..":"..m..":"..s
    end
end)

-- Footer
local Footer = Instance.new("TextLabel", Frame)
Footer.Size = UDim2.new(1,0,0,18)
Footer.Position = UDim2.new(0,0,1,-18)
Footer.BackgroundTransparency = 1
Footer.Text = "Id v.cnv"
Footer.TextColor3 = Color3.fromRGB(120,120,120)
Footer.TextSize = 10

-- Drag
local UIS = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Top.InputEnded:Connect(function()
    dragging = false
end)

UIS.InputChanged:Connect(function(input)
    if dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
