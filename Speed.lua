-- Script zVNcnvice | No Vietnamese Text Fix for Delta Mobile
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local ParentGui = game:GetService("CoreGui")

if ParentGui:FindFirstChild("zVNcnvice_Menu") then ParentGui.zVNcnvice_Menu:Destroy() end
if ParentGui:FindFirstChild("zVNcnvice_Loading") then ParentGui.zVNcnvice_Loading:Destroy() end

-- LOADING SCREEN
local LoadGui = Instance.new("ScreenGui")
LoadGui.Name = "zVNcnvice_Loading"
LoadGui.ResetOnSpawn = false
LoadGui.IgnoreGuiInset = true
LoadGui.Parent = ParentGui

local LoadFrame = Instance.new("Frame", LoadGui)
LoadFrame.Size = UDim2.new(0, 240, 0, 70)
LoadFrame.Position = UDim2.new(0.5, -120, 0.5, -35)
LoadFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Instance.new("UICorner", LoadFrame).CornerRadius = UDim.new(0, 8)
local LoadStroke = Instance.new("UIStroke", LoadFrame)
LoadStroke.Color = Color3.fromRGB(255, 255, 255)

local LoadText = Instance.new("TextLabel", LoadFrame)
LoadText.Size = UDim2.new(1, 0, 0, 30)
LoadText.Position = UDim2.new(0, 0, 0, 10)
LoadText.BackgroundTransparency = 1
LoadText.Text = "Loading zVNcnvice..."
LoadText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadText.Font = Enum.Font.SourceSansBold

local BarBg = Instance.new("Frame", LoadFrame)
BarBg.Size = UDim2.new(0, 200, 0, 6)
BarBg.Position = UDim2.new(0.5, -100, 0, 45)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", BarBg)

local BarFill = Instance.new("Frame", BarBg)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", BarFill)

task.spawn(function()
    for i = 1, 20 do
        BarFill.Size = UDim2.new(i/20, 0, 1, 0)
        task.wait(0.05)
    end
    LoadText.Text = "Success!"
    task.wait(0.3)
    LoadGui:Destroy()
end)

task.wait(1.3)

-- MAIN GUI
local ScreenGui = Instance.new("ScreenGui", ParentGui)
ScreenGui.Name = "zVNcnvice_Menu"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(0, 20, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "+"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 24
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Active = true
ToggleButton.Draggable = true
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleButton)
ToggleStroke.Color = Color3.fromRGB(255, 255, 255)

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 320, 0, 280)
MainFrame.Position = UDim2.new(0.5, -160, 0.3, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 255, 255)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", TopBar)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Size = UDim2.new(1, -10, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "zVNcnvice | Multi-Tool"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local TabSelfBtn = Instance.new("TextButton", MainFrame)
TabSelfBtn.Size = UDim2.new(0.5, 0, 0, 30)
TabSelfBtn.Position = UDim2.new(0, 0, 0, 38)
TabSelfBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabSelfBtn.Text = "Self"
TabSelfBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabSelfBtn.Font = Enum.Font.SourceSansBold

local TabMainBtn = Instance.new("TextButton", MainFrame)
TabMainBtn.Size = UDim2.new(0.5, 0, 0, 30)
TabMainBtn.Position = UDim2.new(0.5, 0, 0, 38)
TabMainBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabMainBtn.Text = "Universal"
TabMainBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
TabMainBtn.Font = Enum.Font.SourceSansBold

local SelfContainer = Instance.new("ScrollingFrame", MainFrame)
SelfContainer.Size = UDim2.new(1, -10, 1, -80)
SelfContainer.Position = UDim2.new(0, 5, 0, 73)
SelfContainer.BackgroundTransparency = 1
SelfContainer.CanvasSize = UDim2.new(0, 0, 0, 280)

local MainContainer = Instance.new("ScrollingFrame", MainFrame)
MainContainer.Size = UDim2.new(1, -10, 1, -80)
MainContainer.Position = UDim2.new(0, 5, 0, 73)
MainContainer.BackgroundTransparency = 1
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 350)
MainContainer.Visible = false

TabSelfBtn.MouseButton1Click:Connect(function()
    SelfContainer.Visible = true MainContainer.Visible = false
    TabSelfBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40) TabSelfBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20) TabMainBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

TabMainBtn.MouseButton1Click:Connect(function()
    SelfContainer.Visible = false MainContainer.Visible = true
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40) TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabSelfBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20) TabSelfBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

-- TAB 1: SELF
local UserInfoLabel = Instance.new("TextLabel", SelfContainer)
UserInfoLabel.Size = UDim2.new(1, 0, 0, 25)
UserInfoLabel.Position = UDim2.new(0, 0, 0, 5)
UserInfoLabel.BackgroundTransparency = 1
UserInfoLabel.Text = "User: " .. LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
UserInfoLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
UserInfoLabel.Font = Enum.Font.SourceSansBold
UserInfoLabel.TextXAlignment = Enum.TextXAlignment.Left

local SpeedTitle = Instance.new("TextLabel", SelfContainer)
SpeedTitle.Size = UDim2.new(1, 0, 0, 20)
SpeedTitle.Position = UDim2.new(0, 0, 0, 35)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "WalkSpeed: 16"
SpeedTitle.TextColor3 = Color3.fromRGB(180, 180, 180)

local SubSpeed = Instance.new("TextButton", SelfContainer)
SubSpeed.Size, SubSpeed.Position, SubSpeed.Text = UDim2.new(0, 30, 0, 24), UDim2.new(0, 0, 0, 58), "-"
SubSpeed.BackgroundColor3, SubSpeed.TextColor3 = Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SubSpeed)

local AddSpeed = Instance.new("TextButton", SelfContainer)
AddSpeed.Size, AddSpeed.Position, AddSpeed.Text = UDim2.new(0, 30, 0, 24), UDim2.new(1, -30, 0, 58), "+"
AddSpeed.BackgroundColor3, AddSpeed.TextColor3 = Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", AddSpeed)

local SpeedBar = Instance.new("Frame", SelfContainer)
SpeedBar.Size, SpeedBar.Position = UDim2.new(1, -75, 0, 6), UDim2.new(0, 38, 0, 67)
SpeedBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", SpeedBar)

local SpeedBtnSlider = Instance.new("TextButton", SpeedBar)
SpeedBtnSlider.Size, SpeedBtnSlider.Position = UDim2.new(0, 14, 0, 14), UDim2.new(0, -7, 0.5, -7)
SpeedBtnSlider.BackgroundColor3, SpeedBtnSlider.Text = Color3.fromRGB(255, 255, 255), ""
Instance.new("UICorner", SpeedBtnSlider)

local currentSpeed, speedActive = 16, false
local function updateSpeed(val)
    currentSpeed = math.clamp(math.floor(val), 16, 200)
    SpeedTitle.Text = "WalkSpeed: " .. currentSpeed
    SpeedBtnSlider.Position = UDim2.new((currentSpeed - 16) / 184, -7, 0.5, -7)
    speedActive = (currentSpeed > 16)
end
SubSpeed.MouseButton1Click:Connect(function() updateSpeed(currentSpeed - 5) end)
AddSpeed.MouseButton1Click:Connect(function() updateSpeed(currentSpeed + 5) end)

RunService.Heartbeat:Connect(function()
    if speedActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = currentSpeed
    end
end)

local InfJumpBtn = Instance.new("TextButton", SelfContainer)
InfJumpBtn.Size, InfJumpBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 95)
InfJumpBtn.BackgroundColor3, InfJumpBtn.Text = Color3.fromRGB(30, 30, 30), "Infinite Jump: OFF"
InfJumpBtn.TextColor3, InfJumpBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", InfJumpBtn)

local infJumpEnabled = false
InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    InfJumpBtn.Text = infJumpEnabled and "Infinite Jump: ON" or "Infinite Jump: OFF"
    InfJumpBtn.BackgroundColor3 = infJumpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)
UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

local InvisBtn = Instance.new("TextButton", SelfContainer)
InvisBtn.Size, InvisBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 135)
InvisBtn.BackgroundColor3, InvisBtn.Text = Color3.fromRGB(30, 30, 30), "Invisibility: OFF"
InvisBtn.TextColor3, InvisBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", InvisBtn)

local invisEnabled = false
InvisBtn.MouseButton1Click:Connect(function()
    invisEnabled = not invisEnabled
    InvisBtn.Text = invisEnabled and "Invisibility: ON" or "Invisibility: OFF"
    InvisBtn.BackgroundColor3 = invisEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    if LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then part.Transparency = invisEnabled and 1 or 0 end
        end
    end
end)

local NoclipBtn = Instance.new("TextButton", SelfContainer)
NoclipBtn.Size, NoclipBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 175)
NoclipBtn.BackgroundColor3, NoclipBtn.Text = Color3.fromRGB(30, 30, 30), "Noclip: OFF"
NoclipBtn.TextColor3, NoclipBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", NoclipBtn)

local noclipEnabled = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and "Noclip: ON" or "Noclip: OFF"
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)
RunService.Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- TAB 2: UNIVERSAL
local EspBtn = Instance.new("TextButton", MainContainer)
EspBtn.Size, EspBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 10)
EspBtn.BackgroundColor3, EspBtn.Text = Color3.fromRGB(30, 30, 30), "Player ESP: OFF"
EspBtn.TextColor3, EspBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", EspBtn)

local espEnabled = false
local function setupESP(plr)
    if plr == LocalPlayer then return end
    local function addTag(char)
        if not char then return end
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end
        if hrp:FindFirstChild("SafeESP") then hrp.SafeESP:Destroy() end
        local bb = Instance.new("BillboardGui", hrp)
        bb.Name, bb.Size, bb.StudsOffset, bb.AlwaysOnTop, bb.Enabled = "SafeESP", UDim2.new(0, 120, 0, 30), Vector3.new(0, 3, 0), true, espEnabled
        local lbl = Instance.new("TextLabel", bb)
        lbl.Size, lbl.BackgroundTransparency, lbl.Text, lbl.TextColor3, lbl.Font = UDim2.new(1, 0, 1, 0), 1, plr.Name, Color3.fromRGB(0, 255, 255), Enum.Font.SourceSansBold
        RunService.RenderStepped:Connect(function()
            if espEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and hrp and bb.Parent then
                local dist = math.floor((hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                lbl.Text = plr.Name .. " [" .. dist .. "m]"
            end
        end)
    end
    if plr.Character then addTag(plr.Character) end
    plr.CharacterAdded:Connect(addTag)
end
for _, p in ipairs(Players:GetPlayers()) do setupESP(p) end
Players.PlayerAdded:Connect(setupESP)

EspBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    EspBtn.Text = espEnabled and "Player ESP: ON" or "Player ESP: OFF"
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local tag = p.Character.HumanoidRootPart:FindFirstChild("SafeESP")
            if tag then tag.Enabled = espEnabled end
        end
    end
end)

local FlingBtn = Instance.new("TextButton", MainContainer)
FlingBtn.Size, FlingBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 50)
FlingBtn.BackgroundColor3, FlingBtn.Text = Color3.fromRGB(30, 30, 30), "Fling Others: OFF"
FlingBtn.TextColor3, FlingBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", FlingBtn)

local flingEnabled = false
FlingBtn.MouseButton1Click:Connect(function()
    flingEnabled = not flingEnabled
    FlingBtn.Text = flingEnabled and "Fling Others: ON" or "Fling Others: OFF"
    FlingBtn.BackgroundColor3 = flingEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)
RunService.Heartbeat:Connect(function()
    if flingEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 10000, 0) + Vector3.new(math.random(-5000, 5000), 0, math.random(-5000, 5000))
    end
end)

local HitboxBtn = Instance.new("TextButton", MainContainer)
HitboxBtn.Size, HitboxBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 90)
HitboxBtn.BackgroundColor3, HitboxBtn.Text = Color3.fromRGB(30, 30, 30), "Expand Hitbox: OFF"
HitboxBtn.TextColor3, HitboxBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", HitboxBtn)

local HitboxSliderTitle = Instance.new("TextLabel", MainContainer)
HitboxSliderTitle.Size, HitboxSliderTitle.Position = UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 0, 125)
HitboxSliderTitle.BackgroundTransparency, HitboxSliderTitle.Text = 1, "Hitbox Size: 2"
HitboxSliderTitle.TextColor3 = Color3.fromRGB(180, 180, 180)

local SubHitbox = Instance.new("TextButton", MainContainer)
SubHitbox.Size, SubHitbox.Position, SubHitbox.Text = UDim2.new(0, 30, 0, 22), UDim2.new(0, 0, 0, 148), "-"
SubHitbox.BackgroundColor3, SubHitbox.TextColor3 = Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SubHitbox)

local AddHitbox = Instance.new("TextButton", MainContainer)
AddHitbox.Size, AddHitbox.Position, AddHitbox.Text = UDim2.new(0, 30, 0, 22), UDim2.new(1, -30, 0, 148), "+"
AddHitbox.BackgroundColor3, AddHitbox.TextColor3 = Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", AddHitbox)

local HitboxBar = Instance.new("Frame", MainContainer)
HitboxBar.Size, HitboxBar.Position = UDim2.new(1, -75, 0, 6), UDim2.new(0, 38, 0, 156)
HitboxBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", HitboxBar)

local HitboxBtnSlider = Instance.new("TextButton", HitboxBar)
HitboxBtnSlider.Size, HitboxBtnSlider.Position = UDim2.new(0, 14, 0, 14), UDim2.new(0, -7, 0.5, -7)
HitboxBtnSlider.BackgroundColor3, HitboxBtnSlider.Text = Color3.fromRGB(255, 255, 255), ""
Instance.new("UICorner", HitboxBtnSlider)

local hitboxSizeVal, hitboxEnabled = 2, false
local function updateHitboxSize(val)
    hitboxSizeVal = math.clamp(math.floor(val), 1, 500)
    HitboxSliderTitle.Text = "Hitbox Size: " .. hitboxSizeVal
    HitboxBtnSlider.Position = UDim2.new((hitboxSizeVal - 1) / 499, -7, 0.5, -7)
end
SubHitbox.MouseButton1Click:Connect(function() updateHitboxSize(hitboxSizeVal - 5) end)
AddHitbox.MouseButton1Click:Connect(function() updateHitboxSize(hitboxSizeVal + 5) end)

HitboxBtn.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    HitboxBtn.Text = hitboxEnabled and "Expand Hitbox: ON" or "Expand Hitbox: OFF"
    HitboxBtn.BackgroundColor3 = hitboxEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)
RunService.Heartbeat:Connect(function()
    if hitboxEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                hrp.Size = Vector3.new(hitboxSizeVal, hitboxSizeVal, hitboxSizeVal)
                hrp.Transparency = 0.7 hrp.CanCollide = false
            end
        end
    end
end)

local BrightBtn = Instance.new("TextButton", MainContainer)
BrightBtn.Size, BrightBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 185)
BrightBtn.BackgroundColor3, BrightBtn.Text = Color3.fromRGB(30, 30, 30), "Fullbright: OFF"
BrightBtn.TextColor3, BrightBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", BrightBtn)

local lighting = game:GetService("Lighting")
local brightEnabled = false
BrightBtn.MouseButton1Click:Connect(function()
    brightEnabled = not brightEnabled
    BrightBtn.Text = brightEnabled and "Fullbright: ON" or "Fullbright: OFF"
    BrightBtn.BackgroundColor3 = brightEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    lighting.Brightness = brightEnabled and 2 or 1
    lighting.ClockTime = brightEnabled and 14 or 12
    lighting.GlobalShadows = not brightEnabled
end)

local NoFogBtn = Instance.new("TextButton", MainContainer)
NoFogBtn.Size, NoFogBtn.Position = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 225)
NoFogBtn.BackgroundColor3, NoFogBtn.Text = Color3.fromRGB(30, 30, 30), "No Fog: OFF"
NoFogBtn.TextColor3, NoFogBtn.Font = Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold
Instance.new("UICorner", NoFogBtn)

local noFogEnabled = false
NoFogBtn.MouseButton1Click:Connect(function()
    noFogEnabled = not noFogEnabled
    NoFogBtn.Text = noFogEnabled and "No Fog: ON" or "No Fog: OFF"
    NoFogBtn.BackgroundColor3 = noFogEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    lighting.FogEnd = noFogEnabled and 999999 or 1000
end)

-- RESIZE HANDLE
local ResizeHandle = Instance.new("TextButton", MainFrame)
ResizeHandle.Size, ResizeHandle.Position = UDim2.new(0, 15, 0, 15), UDim2.new(1, -15, 1, -15)
ResizeHandle.BackgroundColor3, ResizeHandle.Text = Color3.fromRGB(200, 200, 200), ""
Instance.new("UICorner", ResizeHandle)

local resizing, startSize, startMousePos
ResizeHandle.MouseButton1Down:Connect(function()
    resizing = true startSize = MainFrame.AbsoluteSize startMousePos = UserInputService:GetMouseLocation()
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then resizing = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = UserInputService:GetMouseLocation() - startMousePos
        MainFrame.Size = UDim2.new(0, math.clamp(startSize.X + delta.X, 260, 500), 0, math.clamp(startSize.Y + delta.Y, 200, 480))
    end
end)
