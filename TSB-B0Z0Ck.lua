-- Movsets GUI for B0Z0CK The Strongest Buttlegrounds
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
menuFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
menuFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
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
local borosButton = Instance.new("TextButton")
borosButton.Text = "Boros (The Strongest Hero)"
borosButton.Size = UDim2.new(0.8, 0, 0.2, 0)
borosButton.Position = UDim2.new(0.1, 0, 0.25, 0)
borosButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
borosButton.TextColor3 = Color3.fromRGB(255, 255, 255)
borosButton.Font = Enum.Font.SourceSans
borosButton.TextScaled = true
borosButton.Parent = menuFrame

borosButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://paste.ee/r/XPIH5"))()
    end)
    if not success then
        warn("Failed to load Boros moveset: " .. err)
    end
end)

local aTrainButton = Instance.new("TextButton")
aTrainButton.Text = "A-TRAIN (Hero Hunter)"
aTrainButton.Size = UDim2.new(0.8, 0, 0.2, 0)
aTrainButton.Position = UDim2.new(0.1, 0, 0.5, 0)
aTrainButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aTrainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aTrainButton.Font = Enum.Font.SourceSans
aTrainButton.TextScaled = true
aTrainButton.Parent = menuFrame

aTrainButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://paste.ee/r/AnZ5j"))()
    end)
    if not success then
        warn("Failed to load A-TRAIN moveset: " .. err)
    end
end)

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
local function showMovesets()
    borosButton.Visible = true
    aTrainButton.Visible = true
    socialMediaMenu.Visible = false
end

local function showSocialMedia()
    borosButton.Visible = false
    aTrainButton.Visible = false
    socialMediaMenu.Visible = true
end

movesetsTab.MouseButton1Click:Connect(showMovesets)
socialMediaTab.MouseButton1Click:Connect(showSocialMedia)

-- Toggle menu visibility
local menuOpen = false
movsetsButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
end)

-- Make the menu draggable
makeDraggable(menuFrame)
