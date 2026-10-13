-- Script zVNcnvice | Fixed CoreGui Display for Delta Mobile
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Xác định vùng lưu GUI an toàn nhất cho Delta
local ParentGui = game:GetService("CoreGui")

-- Xóa GUI cũ nếu đã tồn tại
if ParentGui:FindFirstChild("zVNcnvice_Menu") then
    ParentGui.zVNcnvice_Menu:Destroy()
end

-- Tạo ScreenGui chính
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "zVNcnvice_Menu"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = ParentGui

-- Nút dấu '+' mở/đóng menu (Có thể kéo thả)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(0, 20, 0.3, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.Text = "+"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 24
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleButton)
ToggleStroke.Color = Color3.fromRGB(255, 255, 255)
ToggleStroke.Thickness = 1.5

-- Khung Menu Chính (Tông đen trắng, có thể kéo thả)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 280)
MainFrame.Position = UDim2.new(0.5, -160, 0.3, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 1.5

-- Logic nút '+' ẩn/hiện menu
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Thanh tiêu đề
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -10, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "zVNcnvice | Multi-Tool"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Nút chuyển Tab (Bản thân / Chính)
local TabSelfBtn = Instance.new("TextButton")
TabSelfBtn.Size = UDim2.new(0.5, 0, 0, 30)
TabSelfBtn.Position = UDim2.new(0, 0, 0, 38)
TabSelfBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabSelfBtn.Text = "Bản Thân"
TabSelfBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabSelfBtn.TextSize = 12
TabSelfBtn.Font = Enum.Font.SourceSansBold
TabSelfBtn.Parent = MainFrame

local TabMainBtn = Instance.new("TextButton")
TabMainBtn.Size = UDim2.new(0.5, 0, 0, 30)
TabMainBtn.Position = UDim2.new(0.5, 0, 0, 38)
TabMainBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabMainBtn.Text = "Chính (Universal)"
TabMainBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
TabMainBtn.TextSize = 12
TabMainBtn.Font = Enum.Font.SourceSansBold
TabMainBtn.Parent = MainFrame

-- Container chứa nội dung các Tab
local SelfContainer = Instance.new("ScrollingFrame")
SelfContainer.Size = UDim2.new(1, -10, 1, -80)
SelfContainer.Position = UDim2.new(0, 5, 0, 73)
SelfContainer.BackgroundTransparency = 1
SelfContainer.CanvasSize = UDim2.new(0, 0, 0, 280)
SelfContainer.ScrollBarThickness = 4
SelfContainer.Parent = MainFrame

local MainContainer = Instance.new("ScrollingFrame")
MainContainer.Size = UDim2.new(1, -10, 1, -80)
MainContainer.Position = UDim2.new(0, 5, 0, 73)
MainContainer.BackgroundTransparency = 1
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 350)
MainContainer.ScrollBarThickness = 4
MainContainer.Visible = false
MainContainer.Parent = MainFrame

-- Xử lý chuyển tab
TabSelfBtn.MouseButton1Click:Connect(function()
    SelfContainer.Visible = true
    MainContainer.Visible = false
    TabSelfBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabSelfBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabMainBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

TabMainBtn.MouseButton1Click:Connect(function()
    SelfContainer.Visible = false
    MainContainer.Visible = true
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabSelfBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabSelfBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

----------------------------------------------------------------
-- TAB 1: BẢN THÂN (SELF)
----------------------------------------------------------------

local UserInfoLabel = Instance.new("TextLabel")
UserInfoLabel.Size = UDim2.new(1, 0, 0, 25)
UserInfoLabel.Position = UDim2.new(0, 0, 0, 5)
UserInfoLabel.BackgroundTransparency = 1
UserInfoLabel.Text = "👤 User: " .. LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
UserInfoLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
UserInfoLabel.TextSize = 12
UserInfoLabel.Font = Enum.Font.SourceSansBold
UserInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
UserInfoLabel.Parent = SelfContainer

-- 1. Tốc độ chạy (WalkSpeed)
local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Size = UDim2.new(1, 0, 0, 20)
SpeedTitle.Position = UDim2.new(0, 0, 0, 35)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "Tốc độ chạy: 16"
SpeedTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SpeedTitle.TextSize = 12
SpeedTitle.Font = Enum.Font.SourceSans
SpeedTitle.Parent = SelfContainer

local SubSpeed = Instance.new("TextButton")
SubSpeed.Size = UDim2.new(0, 30, 0, 24)
SubSpeed.Position = UDim2.new(0, 0, 0, 58)
SubSpeed.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SubSpeed.Text = "-"
SubSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
SubSpeed.Parent = SelfContainer
Instance.new("UICorner", SubSpeed).CornerRadius = UDim.new(0, 4)

local AddSpeed = Instance.new("TextButton")
AddSpeed.Size = UDim2.new(0, 30, 0, 24)
AddSpeed.Position = UDim2.new(1, -30, 0, 58)
AddSpeed.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AddSpeed.Text = "+"
AddSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
AddSpeed.Parent = SelfContainer
Instance.new("UICorner", AddSpeed).CornerRadius = UDim.new(0, 4)

local SpeedBar = Instance.new("Frame")
SpeedBar.Size = UDim2.new(1, -75, 0, 6)
SpeedBar.Position = UDim2.new(0, 38, 0, 67)
SpeedBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBar.Parent = SelfContainer
Instance.new("UICorner", SpeedBar).CornerRadius = UDim.new(1, 0)

local SpeedBtnSlider = Instance.new("TextButton")
SpeedBtnSlider.Size = UDim2.new(0, 14, 0, 14)
SpeedBtnSlider.Position = UDim2.new(0, -7, 0.5, -7)
SpeedBtnSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtnSlider.Text = ""
SpeedBtnSlider.Parent = SpeedBar
Instance.new("UICorner", SpeedBtnSlider).CornerRadius = UDim.new(1, 0)

local currentSpeed = 16
local speedActive = false
local function updateSpeed(val)
    currentSpeed = math.clamp(math.floor(val), 16, 200)
    SpeedTitle.Text = "Tốc độ chạy: " .. currentSpeed
    local ratio = (currentSpeed - 16) / (200 - 16)
    SpeedBtnSlider.Position = UDim2.new(ratio, -7, 0.5, -7)
    speedActive = (currentSpeed > 16)
end

SubSpeed.MouseButton1Click:Connect(function() updateSpeed(currentSpeed - 5) end)
AddSpeed.MouseButton1Click:Connect(function() updateSpeed(currentSpeed + 5) end)

RunService.Heartbeat:Connect(function()
    if speedActive then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid.WalkSpeed = currentSpeed
        end
    end
end)

-- 2. Nhảy liên tục (Infinite Jump)
local InfJumpBtn = Instance.new("TextButton")
InfJumpBtn.Size = UDim2.new(1, 0, 0, 30)
InfJumpBtn.Position = UDim2.new(0, 0, 0, 95)
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InfJumpBtn.Text = "Nhảy liên tục: TẮT"
InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJumpBtn.TextSize = 12
InfJumpBtn.Font = Enum.Font.SourceSansBold
InfJumpBtn.Parent = SelfContainer
Instance.new("UICorner", InfJumpBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", InfJumpBtn).Color = Color3.fromRGB(80, 80, 80)

local infJumpEnabled = false
InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    InfJumpBtn.Text = infJumpEnabled and "Nhảy liên tục: BẬT" or "Nhảy liên tục: TẮT"
    InfJumpBtn.BackgroundColor3 = infJumpEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- 3. Tàng hình (Invisibility)
local InvisBtn = Instance.new("TextButton")
InvisBtn.Size = UDim2.new(1, 0, 0, 30)
InvisBtn.Position = UDim2.new(0, 0, 0, 135)
InvisBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InvisBtn.Text = "Tàng hình bản thân: TẮT"
InvisBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisBtn.TextSize = 12
InvisBtn.Font = Enum.Font.SourceSansBold
InvisBtn.Parent = SelfContainer
Instance.new("UICorner", InvisBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", InvisBtn).Color = Color3.fromRGB(80, 80, 80)

local invisEnabled = false
InvisBtn.MouseButton1Click:Connect(function()
    invisEnabled = not invisEnabled
    InvisBtn.Text = invisEnabled and "Tàng hình bản thân: BẬT" or "Tàng hình bản thân: TẮT"
    InvisBtn.BackgroundColor3 = invisEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    
    local char = LocalPlayer.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = invisEnabled and 1 or 0
            end
        end
    end
end)

-- 4. Đi xuyên tường (Noclip)
local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(1, 0, 0, 30)
NoclipBtn.Position = UDim2.new(0, 0, 0, 175)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NoclipBtn.Text = "Xuyên tường (Noclip): TẮT"
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtn.TextSize = 12
NoclipBtn.Font = Enum.Font.SourceSansBold
NoclipBtn.Parent = SelfContainer
Instance.new("UICorner", NoclipBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", NoclipBtn).Color = Color3.fromRGB(80, 80, 80)

local noclipEnabled = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and "Xuyên tường (Noclip): BẬT" or "Xuyên tường (Noclip): TẮT"
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)

RunService.Stepped:Connect(function()
    if noclipEnabled then
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

----------------------------------------------------------------
-- TAB 2: CHÍNH / UNIVERSAL (DÙNG CHO NHIỀU GAME)
----------------------------------------------------------------

-- 1. ESP Người chơi
local EspBtn = Instance.new("TextButton")
EspBtn.Size = UDim2.new(1, 0, 0, 30)
EspBtn.Position = UDim2.new(0, 0, 0, 10)
EspBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EspBtn.Text = "ESP Tên & Khoảng cách: TẮT"
EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtn.TextSize = 12
EspBtn.Font = Enum.Font.SourceSansBold
EspBtn.Parent = MainContainer
Instance.new("UICorner", EspBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", EspBtn).Color = Color3.fromRGB(80, 80, 80)

local espEnabled = false
local function setupESP(plr)
    if plr == LocalPlayer then return end
    local function addTag(char)
        if not char then return end
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end
        if hrp:FindFirstChild("SafeESP") then hrp.SafeESP:Destroy() end

        local bb = Instance.new("BillboardGui")
        bb.Name = "SafeESP"
        bb.Adornee = hrp
        bb.Size = UDim2.new(0, 120, 0, 30)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.Enabled = espEnabled
        bb.Parent = hrp

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = plr.Name
        lbl.TextColor3 = Color3.fromRGB(0, 255, 255)
        lbl.TextStrokeTransparency = 0
        lbl.TextSize = 12
        lbl.Font = Enum.Font.SourceSansBold
        lbl.Parent = bb

        local conn
        conn = RunService.RenderStepped:Connect(function()
            if not char or not char:Parent or not hrp or not bb.Parent then
                conn:Disconnect()
                return
            end
            if espEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
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
    EspBtn.Text = espEnabled and "ESP Tên & Khoảng cách: BẬT" or "ESP Tên & Khoảng cách: TẮT"
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local tag = p.Character.HumanoidRootPart:FindFirstChild("SafeESP")
            if tag then tag.Enabled = espEnabled end
        end
    end
end)

-- 2. Fling Người khác
local FlingBtn = Instance.new("TextButton")
FlingBtn.Size = UDim2.new(1, 0, 0, 30)
FlingBtn.Position = UDim2.new(0, 0, 0, 50)
FlingBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FlingBtn.Text = "Fling Người Khác (Bay): TẮT"
FlingBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingBtn.TextSize = 12
FlingBtn.Font = Enum.Font.SourceSansBold
FlingBtn.Parent = MainContainer
Instance.new("UICorner", FlingBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", FlingBtn).Color = Color3.fromRGB(80, 80, 80)

local flingEnabled = false
FlingBtn.MouseButton1Click:Connect(function()
    flingEnabled = not flingEnabled
    FlingBtn.Text = flingEnabled and "Fling Người Khác (Bay): BẬT" or "Fling Người Khác (Bay): TẮT"
    FlingBtn.BackgroundColor3 = flingEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)

RunService.Heartbeat:Connect(function()
    if flingEnabled then
        pcall(function()
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.new(0, 10000, 0) + Vector3.new(math.random(-5000, 5000), 0, math.random(-5000, 5000))
            end
        end)
    end
end)

-- 3. Mở rộng Hitbox
local HitboxBtn = Instance.new("TextButton")
HitboxBtn.Size = UDim2.new(1, 0, 0, 30)
HitboxBtn.Position = UDim2.new(0, 0, 0, 90)
HitboxBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HitboxBtn.Text = "Mở rộng Hitbox: TẮT"
HitboxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxBtn.TextSize = 12
HitboxBtn.Font = Enum.Font.SourceSansBold
HitboxBtn.Parent = MainContainer
Instance.new("UICorner", HitboxBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", HitboxBtn).Color = Color3.fromRGB(80, 80, 80)

local HitboxSliderTitle = Instance.new("TextLabel")
HitboxSliderTitle.Size = UDim2.new(1, 0, 0, 20)
HitboxSliderTitle.Position = UDim2.new(0, 0, 0, 125)
HitboxSliderTitle.BackgroundTransparency = 1
HitboxSliderTitle.Text = "Kích thước Hitbox: 2"
HitboxSliderTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
HitboxSliderTitle.TextSize = 12
HitboxSliderTitle.Font = Enum.Font.SourceSans
HitboxSliderTitle.Parent = MainContainer

local SubHitbox = Instance.new("TextButton")
SubHitbox.Size = UDim2.new(0, 30, 0, 22)
SubHitbox.Position = UDim2.new(0, 0, 0, 148)
SubHitbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SubHitbox.Text = "-"
SubHitbox.TextColor3 = Color3.fromRGB(255, 255, 255)
SubHitbox.Parent = MainContainer
Instance.new("UICorner", SubHitbox).CornerRadius = UDim.new(0, 4)

local AddHitbox = Instance.new("TextButton")
AddHitbox.Size = UDim2.new(0, 30, 0, 22)
AddHitbox.Position = UDim2.new(1, -30, 0, 148)
AddHitbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AddHitbox.Text = "+"
AddHitbox.TextColor3 = Color3.fromRGB(255, 255, 255)
AddHitbox.Parent = MainContainer
Instance.new("UICorner", AddHitbox).CornerRadius = UDim.new(0, 4)

local HitboxBar = Instance.new("Frame")
HitboxBar.Size = UDim2.new(1, -75, 0, 6)
HitboxBar.Position = UDim2.new(0, 38, 0, 156)
HitboxBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HitboxBar.Parent = MainContainer
Instance.new("UICorner", HitboxBar).CornerRadius = UDim.new(1, 0)

local HitboxBtnSlider = Instance.new("TextButton")
HitboxBtnSlider.Size = UDim2.new(0, 14, 0, 14)
HitboxBtnSlider.Position = UDim2.new(0, -7, 0.5, -7)
HitboxBtnSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HitboxBtnSlider.Text = ""
HitboxBtnSlider.Parent = HitboxBar
Instance.new("UICorner", HitboxBtnSlider).CornerRadius = UDim.new(1, 0)

local hitboxSizeVal = 2
local hitboxEnabled = false

local function updateHitboxSize(val)
    hitboxSizeVal = math.clamp(math.floor(val), 1, 500)
    HitboxSliderTitle.Text = "Kích thước Hitbox: " .. hitboxSizeVal
    local ratio = (hitboxSizeVal - 1) / (500 - 1)
    HitboxBtnSlider.Position = UDim2.new(ratio, -7, 0.5, -7)
end

SubHitbox.MouseButton1Click:Connect(function() updateHitboxSize(hitboxSizeVal - 5) end)
AddHitbox.MouseButton1Click:Connect(function() updateHitboxSize(hitboxSizeVal + 5) end)

HitboxBtn.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    HitboxBtn.Text = hitboxEnabled and "Mở rộng Hitbox: BẬT" or "Mở rộng Hitbox: TẮT"
    HitboxBtn.BackgroundColor3 = hitboxEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
end)

RunService.Heartbeat:Connect(function()
    if hitboxEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                hrp.Size = Vector3.new(hitboxSizeVal, hitboxSizeVal, hitboxSizeVal)
                hrp.Transparency = 0.7
                hrp.CanCollide = false
            end
        end
    end
end)

-- 4. Fullbright
local BrightBtn = Instance.new("TextButton")
BrightBtn.Size = UDim2.new(1, 0, 0, 30)
BrightBtn.Position = UDim2.new(0, 0, 0, 185)
BrightBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BrightBtn.Text = "Sáng toàn bản đồ (Fullbright): TẮT"
BrightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BrightBtn.TextSize = 12
BrightBtn.Font = Enum.Font.SourceSansBold
BrightBtn.Parent = MainContainer
Instance.new("UICorner", BrightBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", BrightBtn).Color = Color3.fromRGB(80, 80, 80)

local lighting = game:GetService("Lighting")
local brightEnabled = false
BrightBtn.MouseButton1Click:Connect(function()
    brightEnabled = not brightEnabled
    BrightBtn.Text = brightEnabled and "Sáng toàn bản đồ (Fullbright): BẬT" or "Sáng toàn bản đồ (Fullbright): TẮT"
    BrightBtn.BackgroundColor3 = brightEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    
    lighting.Brightness = brightEnabled and 2 or 1
    lighting.ClockTime = brightEnabled and 14 or 12
    lighting.GlobalShadows = not brightEnabled
end)

-- 5. Xóa sương mù (No Fog)
local NoFogBtn = Instance.new("TextButton")
NoFogBtn.Size = UDim2.new(1, 0, 0, 30)
NoFogBtn.Position = UDim2.new(0, 0, 0, 225)
NoFogBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NoFogBtn.Text = "Xóa sương mù (No Fog): TẮT"
NoFogBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoFogBtn.TextSize = 12
NoFogBtn.Font = Enum.Font.SourceSansBold
NoFogBtn.Parent = MainContainer
Instance.new("UICorner", NoFogBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", NoFogBtn).Color = Color3.fromRGB(80, 80, 80)

local noFogEnabled = false
NoFogBtn.MouseButton1Click:Connect(function()
    noFogEnabled = not noFogEnabled
    NoFogBtn.Text = noFogEnabled and "Xóa sương mù (No Fog): BẬT" or "Xóa sương mù (No Fog): TẮT"
    NoFogBtn.BackgroundColor3 = noFogEnabled and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(30, 30, 30)
    
    lighting.FogEnd = noFogEnabled and 999999 or 1000
end)

----------------------------------------------------------------
-- TÍNH NĂNG KÉO CO GIÃN MENU (RESIZE TỪ GÓC PHẢI DƯỚI)
----------------------------------------------------------------
local ResizeHandle = Instance.new("TextButton")
ResizeHandle.Size = UDim2.new(0, 15, 0, 15)
ResizeHandle.Position = UDim2.new(1, -15, 1, -15)
ResizeHandle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ResizeHandle.Text = ""
ResizeHandle.Parent = MainFrame
Instance.new("UICorner", ResizeHandle).CornerRadius = UDim.new(1, 0)

local resizing = false
local startSize, startMousePos

ResizeHandle.MouseButton1Down:Connect(function()
    resizing = true
    startSize = MainFrame.AbsoluteSize
    startMousePos = UserInputService:GetMouseLocation()
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mousePos = UserInputService:GetMouseLocation()
        local delta = mousePos - startMousePos
        local newWidth = math.clamp(startSize.X + delta.X, 260, 500)
        local newHeight = math.clamp(startSize.Y + delta.Y, 200, 480)
        MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
end)
