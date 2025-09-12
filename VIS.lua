local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MMM"
ScreenGui.Parent = PlayerGui

function TextUp(Parent)
	local TextLogo = Instance.new("TextLabel")
	TextLogo.Name = "LogoName"
	TextLogo.Size = UDim2.new(0.8,0,0.6,0)
	TextLogo.Position = UDim2.new(0.05,0,0.225,0)
	TextLogo.Parent = Parent
	TextLogo.BackgroundTransparency = 1
	TextLogo.TextColor3 = Color3.new(0.254902, 0.254902, 0.254902)
	TextLogo.Text = "MEME Defense"
	TextLogo.TextScaled = true
	TextLogo.TextXAlignment = Enum.TextXAlignment.Left

	local TextVersion = Instance.new("TextLabel")
	TextVersion.Name = "VersionText"
	TextVersion.Size = UDim2.new(1,0,0.5,0)
	TextVersion.Position = UDim2.new(0,0,0.25,0)
	TextVersion.Parent = Parent
	TextVersion.BackgroundTransparency = 1
	TextVersion.TextColor3 = Color3.new(0.254902, 0.254902, 0.254902)
	TextVersion.Text = "v.0.1"
	TextVersion.TextScaled = true
end

function CloseButtons(Parent)
	local Button = Instance.new("TextButton")
	Button.Name = "CloseButton"
	Button.Parent = Parent
	Button.Size = UDim2.new(0.05,0,0.8,0)
	Button.Position = UDim2.new(0.92,0,0.05,0)
	Button.BackgroundTransparency = 1
	Button.Text = "x"
	Button.TextColor3 = Color3.fromRGB(144, 71, 71)
	Button.TextSize = 10
	Button.TextScaled = true

	Button.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)

	local Button2 = Instance.new("TextButton")
	Button2.Name = "HideButton"
	Button2.Parent = Parent
	Button2.Size = UDim2.new(0.05,0,0.8,0)
	Button2.Position = UDim2.new(0.87,0,-0.15,0)
	Button2.BackgroundTransparency = 1
	Button2.Text = "_"
	Button2.TextColor3 = Color3.fromRGB(62, 62, 62)
	Button2.TextSize = 10
	Button2.TextScaled = true

	Button2.MouseButton1Click:Connect(function()
		ScreenGui.Enabled = false
	end)
end


local BackGround = Instance.new("Frame")
BackGround.Name = "BackGround"
BackGround.Parent = ScreenGui
BackGround.Size = UDim2.new(0.25,0,0.2,0)
BackGround.SizeConstraint = Enum.SizeConstraint.RelativeXX
BackGround.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BackGround.Position = UDim2.new(0.25,0,0.15,0)

local MovieButton = Instance.new("TextButton")
MovieButton.Name = "MovieFrame"
MovieButton.Parent = BackGround
MovieButton.Size = UDim2.new(1,0,0.06,0)
MovieButton.Transparency = 0.6
MovieButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MovieButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MovieButton.AutoButtonColor = false
MovieButton.Text = ""

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "Functions"
ScrollingFrame.Parent = BackGround
ScrollingFrame.Size = UDim2.new(0.95,0,0.9,0)
ScrollingFrame.Position = UDim2.new(0.025,0,0.07,0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 2
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0,0,0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0,0,10,0)

function UIC(Parent, R1 , R2)
	local UICorner = Instance.new("UICorner")
	UICorner.Parent = Parent
	UICorner.CornerRadius = UDim.new(R1,R2)
end

local UIGrid = Instance.new("UIGridLayout")
UIGrid.Parent = ScrollingFrame
UIGrid.CellSize = UDim2.new(0.95,0,0.01,0)
UIGrid.CellPadding = UDim2.new(0.05,0,0.002,0)
UIGrid.FillDirection = Enum.FillDirection.Vertical
UIGrid.SortOrder = Enum.SortOrder.Name
UIGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center

function createFunctions(Name , NameFunc )
	
	
	local BGFrame = Instance.new("Frame")
	BGFrame.Parent = ScrollingFrame
	BGFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	BGFrame.Name = Name
	
	local TextLogo = Instance.new("TextLabel")
	TextLogo.Name = Name
	TextLogo.Size = UDim2.new(0.65,0,0.4,0)
	TextLogo.Position = UDim2.new(0.05,0,0.225,0)
	TextLogo.Parent = BGFrame
	TextLogo.BackgroundTransparency = 1
	TextLogo.TextColor3 = Color3.new(0.721569, 0.721569, 0.721569)
	TextLogo.Text = NameFunc
	TextLogo.TextScaled = true
	TextLogo.TextXAlignment = Enum.TextXAlignment.Left
	TextLogo.Font = "Montserrat"
	
	local Button = Instance.new("TextButton")
	Button.Parent = BGFrame
	Button.Name = Name.."Button"
	Button.Position = UDim2.new(0.7,0,0.125,0)
	Button.Size = UDim2.new(0.25,0,0.7,0)
	Button.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Button.Text = ""
	Button.TextSize = 10
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	
	TextLogo.FontFace = Font.new(
		"rbxasset://fonts/families/Montserrat.json",
		Enum.FontWeight.Bold
	)
	
	Button.FontFace = Font.new(
		"rbxasset://fonts/families/Montserrat.json",
		Enum.FontWeight.Bold
	)
	
	UIC(Button , 0 , 4)
	UIC(BGFrame , 0 , 4)
end

createFunctions("a1AutoReplay", "AutoReplay")
createFunctions("a2AutoNext", "AutoNext")
createFunctions("a3AutoLeave", "AutoLeave")
createFunctions("a4AutoFarm", "AutoFarm")
createFunctions("a5AutoBanner", "AutoBanner")
createFunctions("a99SaveConfig", "SaveConfig - When u leave config save automatic")
CloseButtons(MovieButton)
TextUp(MovieButton)



UserInputService.InputBegan:Connect(function(input, gameProcessed, player)

	if input.KeyCode == Enum.KeyCode.RightControl and ScreenGui.Enabled == true then
		ScreenGui.Enabled = false
	else
		if input.KeyCode == Enum.KeyCode.RightControl and ScreenGui.Enabled == false then
			ScreenGui.Enabled = true
		end
	end
end)

local function update(input)
	local delta = input.Position - dragStart
	BackGround.Position = UDim2.new(
		startPos.X.Scale, 
		startPos.X.Offset + delta.X,
		startPos.Y.Scale, 
		startPos.Y.Offset + delta.Y
	)
end

MovieButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = BackGround.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MovieButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)




-------------------------------------------------------------------------------------------------
-- config
local HttpService = game:GetService("HttpService")

-- Проверяем доступность файловых функций
if not (writefile and readfile and makefolder and isfolder and isfile) then
	warn("Файловые функции не доступны!")
	return
end

-- Создаем папки
makefolder("KLConfig")
makefolder("KLConfig/Config")

-- Функция загрузки конфига
local function loadConfig()
	if isfile("KLConfig/Config/config.json") then
		local success, configData = pcall(function()
			return readfile("KLConfig/Config/config.json")
		end)

		if success then
			local success2, decoded = pcall(function()
				return HttpService:JSONDecode(configData)
			end)

			if success2 and decoded then
				-- Загружаем значения в глобальные переменные
				AutoReplay = decoded.AR or false
				AutoNext = decoded.AN or false
				AutoLeave = decoded.AL or false
				AutoFarm = decoded.AF or false
				AutoBanner = decoded.AB or false

				print("Config loaded successful")
				return true
			end
		end
	end
	return false
end

-- Функция сохранения конфига
local function saveConfig()
	local config = {
		AutoReplay = AutoReplay or false,
		AutoNext = AutoNext or false, 
		AutoLeave = AutoLeave or false,
		AutoFarm = AutoFarm or false,
		AutoBanner = AutoBanner or false
	}

	local success, error = pcall(function()
		writefile("KLConfig/Config/config.json", HttpService:JSONEncode(config))
	end)

	if success then
		print("--------------------------------")
		print("Saved config:")
		print("AutoReplay - "..tostring(AutoReplay))
		print("AutoNext - "..tostring(AutoNext))
		print("AutoLeave - "..tostring(AutoLeave))
		print("AutoBanner - "..tostring(AutoBanner))
		print("AutoFarm - "..tostring(AutoFarm))
		print("--------------------------------")
		return true
	else
		warn("Ошибка сохранения:", error)
		return false
	end
end

-- Загружаем конфиг при старте
loadConfig()

-- Сохраняем при выходе из игры
game:GetService("Players").PlayerRemoving:Connect(function(player)
	if player == game.Players.LocalPlayer then
		saveConfig()
	end
end)

-- Кнопка сохранения
local buttonconf = ScrollingFrame:FindFirstChild("a99SaveConfig"):FindFirstChild("a99SaveConfigButton")

if buttonconf then
	buttonconf.MouseButton1Click:Connect(function()
		if saveConfig() then
			buttonconf.Text = "Saved"
			task.wait(2)
			buttonconf.Text = "Save Config" -- или пустая строка
		else
			buttonconf.Text = "Error!"
			task.wait(2)
			buttonconf.Text = "Save Config"
		end
	end)
end


------------------------------------------------------------------------------------
-- functions
-- auto replay
local buttonR = ScrollingFrame:FindFirstChild("a1AutoReplay"):FindFirstChild("a1AutoReplayButton")

if AutoReplay == true then
	buttonR.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	buttonR.TextColor3 = Color3.fromRGB(0, 0, 0)
end

if AutoReplay == false then
	buttonR.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	buttonR.TextColor3 = Color3.fromRGB(255, 255, 255)
end

buttonR.MouseButton1Click:Connect(function()

	if AutoReplay == true then
		buttonR.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		buttonR.TextColor3 = Color3.fromRGB(255, 255, 255)
		AutoReplay = false
	else
		if AutoReplay == false then
			buttonR.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			buttonR.TextColor3 = Color3.fromRGB(0, 0, 0)
			AutoReplay = true
		end
	end
end)

local ENDSCREEN = PlayerGui:FindFirstChild("ResultsUI")

ENDSCREEN:GetPropertyChangedSignal("Enabled"):Connect(function()
	if AutoReplay == true and ENDSCREEN.Enabled then
		game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("set_game_finished_vote"):InvokeServer("replay")
		print("Реплей")
	end
end)


-- auto leave
local buttonL = ScrollingFrame:FindFirstChild("a3AutoLeave"):FindFirstChild("a3AutoLeaveButton")

if AutoLeave == true then
	buttonL.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	buttonL.TextColor3 = Color3.fromRGB(0, 0, 0)
end

if AutoLeave == false then
	buttonL.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	buttonL.TextColor3 = Color3.fromRGB(255, 255, 255)
end

buttonL.MouseButton1Click:Connect(function()

	if AutoLeave == true then
		buttonL.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		buttonL.TextColor3 = Color3.fromRGB(255, 255, 255)
		AutoLeave = false
	else
		if AutoLeave == false then
			buttonL.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			buttonL.TextColor3 = Color3.fromRGB(0, 0, 0)
			AutoLeave = true
		end
	end
end)
-- auto next
local buttonN = ScrollingFrame:FindFirstChild("a2AutoNext"):FindFirstChild("a2AutoNextButton")

if AutoNext == true then
	buttonN.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	buttonN.TextColor3 = Color3.fromRGB(0, 0, 0)
end

if AutoNext == false then
	buttonN.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	buttonN.TextColor3 = Color3.fromRGB(255, 255, 255)
end

buttonN.MouseButton1Click:Connect(function()

	if AutoNext == true then
		buttonN.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		buttonN.TextColor3 = Color3.fromRGB(255, 255, 255)
		AutoNext = false
	else
		if AutoNext == false then
			buttonN.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			buttonN.TextColor3 = Color3.fromRGB(0, 0, 0)
			AutoNext = true
		end
	end
end)
-- auto farm
local buttonF = ScrollingFrame:FindFirstChild("a4AutoFarm"):FindFirstChild("a4AutoFarmButton")

if AutoFarm == true then
	buttonF.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	buttonF.TextColor3 = Color3.fromRGB(0, 0, 0)
end

if AutoFarm == false then
	buttonF.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	buttonF.TextColor3 = Color3.fromRGB(255, 255, 255)
end

buttonF.MouseButton1Click:Connect(function()

	if AutoFarm == true then
		buttonF.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		buttonF.TextColor3 = Color3.fromRGB(255, 255, 255)
		AutoFarm = false
	else
		if AutoFarm == false then
			buttonF.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			buttonF.TextColor3 = Color3.fromRGB(0, 0, 0)
			AutoFarm = true
		end
	end
end)
-- auto banner
local buttonB = ScrollingFrame:FindFirstChild("a5AutoBanner"):FindFirstChild("a5AutoBannerButton")

if AutoBanner == true then
	buttonB.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
	buttonB.TextColor3 = Color3.fromRGB(0, 0, 0)
end

if AutoBanner == false then
	buttonB.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	buttonB.TextColor3 = Color3.fromRGB(255, 255, 255)
end

buttonB.MouseButton1Click:Connect(function()

	if AutoBanner == true then
		buttonB.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		buttonB.TextColor3 = Color3.fromRGB(255, 255, 255)
		AutoBanner = false
	else
		if AutoBanner == false then
			buttonB.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			buttonB.TextColor3 = Color3.fromRGB(0, 0, 0)
			AutoBanner = true
		end
	end
end)
