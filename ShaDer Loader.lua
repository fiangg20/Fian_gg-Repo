-- LocalScript di dalam ScreenGui

-- Membuat referensi ke PlayerGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ComplexGui"
screenGui.Parent = playerGui

-- Membuat Frame sebagai latar belakang
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(0, 400, 0, 300)
backgroundFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Parent = screenGui

-- Menambahkan UICorner untuk sudut melengkung pada Frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 20)
frameCorner.Parent = backgroundFrame

-- Membuat Label Judul
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Text = "Welcome To ShaDer Loader!"
titleLabel.Parent = backgroundFrame

-- Membuat tombol eksekusi script
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 100)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Start Script"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = backgroundFrame

-- Menambahkan UICorner untuk sudut melengkung pada tombol
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = button

-- Membuat tombol close
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = backgroundFrame

-- Menambahkan UICorner untuk sudut melengkung pada tombol close
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 5)
closeButtonCorner.Parent = closeButton

-- Fungsi untuk mengeksekusi script dari URL
local function executeScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fiangg20/Fian_gg-Repo/refs/heads/main/ShaDer.lua"))()
    end)

    if not success then
        warn("Error executing script: " .. err)
    else
        print("Script executed successfully!")
    end
end

-- Event ketika tombol ditekan
button.MouseButton1Click:Connect(function()
    executeScript()
end)

-- Event ketika tombol close ditekan
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- Menghapus GUI
end)

-- Dragging functionality
local dragging
local dragStart
local startPos

backgroundFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = backgroundFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

backgroundFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragging then
            local delta = input.Position - dragStart
            backgroundFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end
end)
