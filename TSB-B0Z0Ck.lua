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
menuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
menuFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
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
movesetsTab.Size = UDim2.new(0.5, 0, 0.1, 0)
movesetsTab.Position = UDim2.new(0, 0, 0, 0)
movesetsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
movesetsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
movesetsTab.Font = Enum.Font.SourceSansBold
movesetsTab.TextScaled = true
movesetsTab.Parent = menuFrame

local socialMediaTab = Instance.new("TextButton")
socialMediaTab.Text = "Social Media"
socialMediaTab.Size = UDim2.new(0.5, 0, 0.1, 0)
socialMediaTab.Position = UDim2.new(0.5, 0, 0, 0)
socialMediaTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
socialMediaTab.TextColor3 = Color3.fromRGB(255, 255, 255)
socialMediaTab.Font = Enum.Font.SourceSansBold
socialMediaTab.TextScaled = true
socialMediaTab.Parent = menuFrame

-- Movesets content
local function createMovesetButton(name, position, loadUrl)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Size = UDim2.new(0.8, 0, 0.15, 0)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextScaled = true
    button.Parent = menuFrame

    button.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(loadUrl))()
        end)
        if not success then
            warn("Failed to load moveset: " .. err)
        end
    end)
end

createMovesetButton("Boros (The Strongest Hero)", UDim2.new(0.1, 0, 0.25, 0), "https://paste.ee/r/XPIH5")
createMovesetButton("A-TRAIN (Hero Hunter)", UDim2.new(0.1, 0, 0.45, 0), "https://paste.ee/r/AnZ5j")
createMovesetButton("MINOS PRIME (Hero Hunter)", UDim2.new(0.1, 0, 0.65, 0), "https://raw.githubusercontent.com/S1gmaGuy/MinosPrimeFixed/refs/heads/main/ThefixIsSoSigma")

-- Social Media menu
local socialMediaMenu = Instance.new("Frame")
socialMediaMenu.Size = UDim2.new(1, 0, 0.9, 0)
socialMediaMenu.Position = UDim2.new(0, 0, 0.1, 0)
socialMediaMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
socialMediaMenu.Visible = false
socialMediaMenu.Parent = menuFrame

local discordButton = Instance.new("TextButton")
discordButton.Text = "Discord"
discordButton.Size = UDim2.new(0.8, 0, 0.2, 0)
discordButton.Position = UDim2.new(0.1, 0, 0.2, 0)
discordButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Font = Enum.Font.SourceSans
discordButton.TextScaled = true
discordButton.Parent = socialMediaMenu

discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/GMAuCrhyW3")
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
    setclipboard("https://www.youtube.com/@b0z0_404")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Link Copied",
        Text = "YouTube link copied to clipboard",
        Duration = 3
    })
end)

-- Tab switching logic
local function showMovesetsContent()
    -- Hide all non-moveset content
    socialMediaMenu.Visible = false
    for _, child in ipairs(menuFrame:GetChildren()) do
        if child:IsA("TextButton") and child.Text ~= "Movesets" and child.Text ~= "Social Media" then
            child.Visible = true
        end
    end
end

local function showSocialMediaContent()
    -- Hide all non-social-media content
    socialMediaMenu.Visible = true
    for _, child in ipairs(menuFrame:GetChildren()) do
        if child:IsA("TextButton") and child.Text ~= "Movesets" and child.Text ~= "Social Media" then
            child.Visible = false
        end
    end
end

movesetsTab.MouseButton1Click:Connect(function()
    showMovesetsContent()
end)

socialMediaTab.MouseButton1Click:Connect(function()
    showSocialMediaContent()
end)

-- Toggle menu visibility
local menuOpen = false
movsetsButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
    if menuOpen then
        showMovesetsContent() -- Default to Movesets tab on open
    end
end)
