-- ScriptPLUG Loader
-- Key: SricptsPlug1267

local key = "SricptsPlug1267"

local userInput = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui") or nil
-- You can make your own key system here, placeholder for demo
local inputKey = key -- in practice, you can replace with GUI input

if inputKey ~= key then
    warn("Invalid Key!")
    return
end

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptPLUG"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.DisplayOrder = 999999

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.fromScale(0.2, 0.2)
frame.AnchorPoint = Vector2.new(0,0)
frame.Parent = ScreenGui
frame.Active = true
frame.Draggable = true

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 20)
uicorner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Text = "ScriptPLUG"
title.Font = Enum.Font.FredokaOne
title.TextSize = 40
title.TextColor3 = Color3.fromRGB(200, 200, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,60)
title.Parent = frame

-- Script buttons
local scripts = {
    {Name = "Arsenal", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Arsenal.lua"},
    {Name = "Planks", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Planks.lua"},
    {Name = "Hypershot", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Hypershot.lua"},
    {Name = "Rivals", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Rivals.lua"},
    {Name = "Counterblox", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Counterblox.lua"},
    {Name = "Gunfight Arena", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/GunfightArena.lua"},
    {Name = "Universal", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Universal.lua"}
}

local function createButton(name, url, yPos)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 24
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

for i, s in pairs(scripts) do
    createButton(s.Name, s.URL, 80 + (i-1)*60)
end

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(80,80,90)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.TextSize = 24
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
