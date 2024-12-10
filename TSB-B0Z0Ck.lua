local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "B0Z0CKMovsets"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create the draggable B0Z0CK TSB button
local b0z0ckButton = Instance.new("TextButton")
b0z0ckButton.Name = "B0Z0CKTSBButton"
b0z0ckButton.Size = UDim2.new(0.1, 0, 0.05, 0)
b0z0ckButton.Position = UDim2.new(0.85, 0, 0.05, 0)
b0z0ckButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
b0z0ckButton.Text = "B0Z0CK TSB"
b0z0ckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
b0z0ckButton.Font = Enum.Font.SourceSansBold
b0z0ckButton.TextScaled = true
b0z0ckButton.Parent = screenGui

-- Add a UI corner for rounded edges
local b0z0ckCorner = Instance.new("UICorner")
b0z0ckCorner.CornerRadius = UDim.new(0, 5)
b0z0ckCorner.Parent = b0z0ckButton

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

makeDraggable(b0z0ckButton)

-- Create the main menu frame
local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
menuFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false -- Initially hidden
menuFrame.Parent = screenGui

-- Add a UI corner for the menu
local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 10)
menuCorner.Parent = menuFrame

-- Add tabs
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0.15, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabContainer.Parent = menuFrame

local movesetsTab = Instance.new("TextButton")
movesetsTab.Text = "Movesets"
movesetsTab.Size = UDim2.new(0.2, -5, 1, -5)
movesetsTab.Position = UDim2.new(0, 5, 0, 5)
movesetsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
movesetsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
movesetsTab.Font = Enum.Font.SourceSansBold
movesetsTab.TextScaled = true
movesetsTab.Parent = tabContainer

local socialMediaTab = Instance.new("TextButton")
socialMediaTab.Text = "Social Media"
socialMediaTab.Size = UDim2.new(0.2, -5, 1, -5)
socialMediaTab.Position = UDim2.new(0.2, 5, 0, 5)
socialMediaTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
socialMediaTab.TextColor3 = Color3.fromRGB(255, 255, 255)
socialMediaTab.Font = Enum.Font.SourceSansBold
socialMediaTab.TextScaled = true
socialMediaTab.Parent = tabContainer

local settingsTab = Instance.new("TextButton")
settingsTab.Text = "Settings"
settingsTab.Size = UDim2.new(0.2, -5, 1, -5)
settingsTab.Position = UDim2.new(0.4, 5, 0, 5)
settingsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
settingsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTab.Font = Enum.Font.SourceSansBold
settingsTab.TextScaled = true
settingsTab.Parent = tabContainer

local helpTab = Instance.new("TextButton")
helpTab.Text = "Help"
helpTab.Size = UDim2.new(0.2, -5, 1, -5)
helpTab.Position = UDim2.new(0.6, 5, 0, 5)
helpTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
helpTab.TextColor3 = Color3.fromRGB(255, 255, 255)
helpTab.Font = Enum.Font.SourceSansBold
helpTab.TextScaled = true
helpTab.Parent = tabContainer

local tsbToolsTab = Instance.new("TextButton")
tsbToolsTab.Text = "TSB Tools"
tsbToolsTab.Size = UDim2.new(0.2, -5, 1, -5)
tsbToolsTab.Position = UDim2.new(0.8, 5, 0, 5)
tsbToolsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tsbToolsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
tsbToolsTab.Font = Enum.Font.SourceSansBold
tsbToolsTab.TextScaled = true
tsbToolsTab.Parent = tabContainer

-- Apply Hover Effect
local function applyHoverEffect(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

applyHoverEffect(movesetsTab)
applyHoverEffect(socialMediaTab)
applyHoverEffect(settingsTab)
applyHoverEffect(helpTab)
applyHoverEffect(tsbToolsTab)

-- Create a container for the Movesets buttons
local movesetContainer = Instance.new("Frame")
movesetContainer.Size = UDim2.new(1, 0, 0.75, 0)
movesetContainer.Position = UDim2.new(0, 0, 0.15, 0)
movesetContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
movesetContainer.Parent = menuFrame

local function createMovesetButton(name, position, loadUrl)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(0.8, 0, 0.15, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true
    button.Parent = movesetContainer

    button.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(loadUrl))()
        end)
        if not success then
            warn("Failed to load moveset: " .. err)
        end
    end)

    applyHoverEffect(button)
end

createMovesetButton("Boros (The Strongest Hero)", UDim2.new(0.1, 0, 0.1, 0), "https://paste.ee/r/XPIH5")
createMovesetButton("A-TRAIN (Hero Hunter)", UDim2.new(0.1, 0, 0.3, 0), "https://paste.ee/r/AnZ5j")
createMovesetButton("MINOS PRIME (Hero Hunter)", UDim2.new(0.1, 0, 0.5, 0), "https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma")

-- Create the TSB Tools menu
local tsbToolsMenu = Instance.new("Frame")
tsbToolsMenu.Size = UDim2.new(1, 0, 0.75, 0)
tsbToolsMenu.Position = UDim2.new(0, 0, 0.15, 0)
tsbToolsMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tsbToolsMenu.Visible = false
tsbToolsMenu.Parent = menuFrame

local teleportButton = Instance.new("TextButton")
teleportButton.Text = "Teleport to Atomic Slash Location"
teleportButton.Size = UDim2.new(0.8, 0, 0.2, 0)
teleportButton.Position = UDim2.new(0.1, 0, 0.1, 0)
teleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.Font = Enum.Font.SourceSans
teleportButton.TextScaled = true
teleportButton.Parent = tsbToolsMenu

teleportButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tanos5305/b0c0-am-chacking/refs/heads/main/script.lua"))()
    end)
    if not success then
        warn("Failed to teleport: " .. err)
    end
end)

-- Social Media menu
local socialMediaMenu = Instance.new("Frame")
socialMediaMenu.Size = UDim2.new(1, 0, 0.75, 0)
socialMediaMenu.Position = UDim2.new(0, 0, 0.15, 0)
socialMediaMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
socialMediaMenu.Visible = false
socialMediaMenu.Parent = menuFrame

local discordButton = Instance.new("TextButton")
discordButton.Text = "Discord"
discordButton.Size = UDim2.new(0.8, 0, 0.2, 0)
discordButton.Position = UDim2.new(0.1, 0, 0.1, 0)
discordButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Font = Enum.Font.SourceSans
discordButton.TextScaled = true
discordButton.Parent = socialMediaMenu

discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/yourdiscordlink")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Link Copied",
        Text = "Discord link copied to clipboard",
        Duration = 3
    })
end)

local youtubeButton = Instance.new("TextButton")
youtubeButton.Text = "YouTube"
youtubeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
youtubeButton.Position = UDim2.new(0.1, 0, 0.5, 0)
youtubeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
youtubeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
youtubeButton.Font = Enum.Font.SourceSans
youtubeButton.TextScaled = true
youtubeButton.Parent = socialMediaMenu

youtubeButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/channel/UCpAdTw6Vf06pCo6QMEpzvAw")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Link Copied",
        Text = "YouTube link copied to clipboard",
        Duration = 3
    })
end)

-- Tab Button Click Events
movesetsTab.MouseButton1Click:Connect(function()
    movesetContainer.Visible = true
    socialMediaMenu.Visible = false
    tsbToolsMenu.Visible = false -- Hide TSB Tools menu
end)

socialMediaTab.MouseButton1Click:Connect(function()
    movesetContainer.Visible = false
    socialMediaMenu.Visible = true
    tsbToolsMenu.Visible = false -- Hide TSB Tools menu
end)

tsbToolsTab.MouseButton1Click:Connect(function()
    movesetContainer.Visible = false
    socialMediaMenu.Visible = false -- Hide social media menu
    tsbToolsMenu.Visible = true     -- Show TSB Tools menu
end)

-- Settings Tab functionality
settingsTab.MouseButton1Click:Connect(function()
    -- Example: Toggle Dark Mode
    local currentColor = menuFrame.BackgroundColor3
    if currentColor == Color3.fromRGB(40, 40, 40) then
        menuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    else
        menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

-- Help Tab functionality
helpTab.MouseButton1Click:Connect(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Help",
        Text = "Use the 'Movesets' tab to load new movesets and the 'Social Media' tab for links.",
        Duration = 5
    })
end)

-- Toggle the menu visibility
b0z0ckButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Initially show the Movesets tab
movesetContainer.Visible = true
socialMediaMenu.Visible = false
tsbToolsMenu.Visible = false -- Hide TSB Tools menu initially
