local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "B0Z0CKMovsets"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create the draggable Movsets button
local movsetsButton = Instance.new("TextButton")
movsetsButton.Name = "MovsetsButton"
movsetsButton.Size = UDim2.new(0.1, 0, 0.05, 0)
movsetsButton.Position = UDim2.new(0.85, 0, 0.05, 0)
movsetsButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
movsetsButton.Text = "Movsets"
movsetsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
movsetsButton.Font = Enum.Font.SourceSansBold
movsetsButton.TextScaled = true
movsetsButton.Parent = screenGui

-- Add a UI corner for rounded edges
local movsetsCorner = Instance.new("UICorner")
movsetsCorner.CornerRadius = UDim.new(0, 5)
movsetsCorner.Parent = movsetsButton

-- Function to make UI elements draggable
local function makeDraggable(frame)
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(movsetsButton)

-- Create the main menu frame
local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
menuFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false -- Initially hidden
menuFrame.Parent = screenGui

-- Add a UI corner for the menu
local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 10)
menuCorner.Parent = menuFrame

-- Add tabs
local movesetsTab = Instance.new("TextButton")
movesetsTab.Text = "Movesets"
movesetsTab.Size = UDim2.new(0.25, 0, 0.1, 0)
movesetsTab.Position = UDim2.new(0, 0, 0, 0)
movesetsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
movesetsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
movesetsTab.Font = Enum.Font.SourceSansBold
movesetsTab.TextScaled = true
movesetsTab.Parent = menuFrame

local socialMediaTab = Instance.new("TextButton")
socialMediaTab.Text = "Social Media"
socialMediaTab.Size = UDim2.new(0.25, 0, 0.1, 0)
socialMediaTab.Position = UDim2.new(0.25, 0, 0, 0)
socialMediaTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
socialMediaTab.TextColor3 = Color3.fromRGB(255, 255, 255)
socialMediaTab.Font = Enum.Font.SourceSansBold
socialMediaTab.TextScaled = true
socialMediaTab.Parent = menuFrame

local adminsTab = Instance.new("TextButton")
adminsTab.Text = "Admins"
adminsTab.Size = UDim2.new(0.25, 0, 0.1, 0)
adminsTab.Position = UDim2.new(0.5, 0, 0, 0)
adminsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
adminsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
adminsTab.Font = Enum.Font.SourceSansBold
adminsTab.TextScaled = true
adminsTab.Parent = menuFrame

local earlyAccessTab = Instance.new("TextButton")
earlyAccessTab.Text = "Early Access"
earlyAccessTab.Size = UDim2.new(0.25, 0, 0.1, 0)
earlyAccessTab.Position = UDim2.new(0.75, 0, 0, 0)
earlyAccessTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
earlyAccessTab.TextColor3 = Color3.fromRGB(255, 255, 255)
earlyAccessTab.Font = Enum.Font.SourceSansBold
earlyAccessTab.TextScaled = true
earlyAccessTab.Parent = menuFrame
earlyAccessTab.Visible = false -- Initially hidden

-- Helper function to create a Movest button
local function createMoveButton(name, position, url, parent)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(0.8, 0, 0.2, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true
    button.Parent = parent

    button.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load " .. name .. " moveset: " .. err)
        end
    end)

    return button
end

-- Initial Movesets
local borosButton = createMoveButton("Boros (The Strongest Hero)", UDim2.new(0.1, 0, 0.25, 0), "https://paste.ee/r/XPIH5", menuFrame)
local aTrainButton = createMoveButton("A-TRAIN (Hero Hunter)", UDim2.new(0.1, 0, 0.5, 0), "https://paste.ee/r/AnZ5j", menuFrame)
local minosPrimeButton = createMoveButton("MINOS PRIME (Hero Hunter)", UDim2.new(0.1, 0, 0.75, 0), "https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma", menuFrame)

-- Admins input section
local adminInputFrame = Instance.new("Frame")
adminInputFrame.Size = UDim2.new(1, 0, 0.4, 0)
adminInputFrame.Position = UDim2.new(0, 0, 0.1, 0)
adminInputFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
adminInputFrame.Visible = false
adminInputFrame.Parent = menuFrame

local adminInputLabel = Instance.new("TextLabel")
adminInputLabel.Text = "Enter Admin Key:"
adminInputLabel.Size = UDim2.new(1, 0, 0.2, 0)
adminInputLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
adminInputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
adminInputLabel.Font = Enum.Font.SourceSans
adminInputLabel.TextScaled = true
adminInputLabel.Parent = adminInputFrame

local adminInputBox = Instance.new("TextBox")
adminInputBox.Size = UDim2.new(0.8, 0, 0.2, 0)
adminInputBox.Position = UDim2.new(0.1, 0, 0.25, 0)
adminInputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
adminInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
adminInputBox.Font = Enum.Font.SourceSans
adminInputBox.PlaceholderText = "Enter key here"
adminInputBox.TextScaled = true
adminInputBox.Parent = adminInputFrame

local unlockButton = Instance.new("TextButton")
unlockButton.Text = "Unlock"
unlockButton.Size = UDim2.new(0.3, 0, 0.2, 0)
unlockButton.Position = UDim2.new(0.35, 0, 0.5, 0)
unlockButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
unlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
unlockButton.Font = Enum.Font.SourceSansBold
unlockButton.TextScaled = true
unlockButton.Parent = adminInputFrame

unlockButton.MouseButton1Click:Connect(function()
    if adminInputBox.Text == "Ded-maxim" then
        earlyAccessTab.Visible = true
        adminInputFrame.Visible = false
    else
        warn("Incorrect key!")
    end
end)

-- Early Access movsets content
local titanButton = createMoveButton("Titan (The Strongest Hero)", UDim2.new(0.1, 0, 0.25, 0), "https://paste.ee/r/fxY03", menuFrame)
titanButton.Visible = false -- Initially hidden

local diddyButton = createMoveButton("DIDDY (Hero Hunter)", UDim2.new(0.1, 0, 0.5, 0), "https://paste.ee/r/gKC8V", menuFrame)
diddyButton.Visible = false -- Initially hidden

-- Tab functionality
movesetsTab.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    adminInputFrame.Visible = false
    earlyAccessTab.Visible = false -- This ensures Early Access does not show when clicking Movesets
end)

socialMediaTab.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    adminInputFrame.Visible = false
    earlyAccessTab.Visible = false -- This ensures Early Access does not show when clicking Social Media
end)

adminsTab.MouseButton1Click:Connect(function()
    adminInputFrame.Visible = true
    earlyAccessTab.Visible = false -- Hide Early Access until unlocked
    menuFrame.Visible = true
end)

earlyAccessTab.MouseButton1Click:Connect(function()
    titanButton.Visible = true
    diddyButton.Visible = true
    menuFrame.Visible = true
    earlyAccessTab.Visible = true -- Ensure it stays visible
    adminInputFrame.Visible = false -- Hide admin input when accessing Early Access
end)

-- Toggle Movsets button
movsetsButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)
