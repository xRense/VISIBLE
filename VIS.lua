local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KL-UI"
ScreenGui.Parent = PlayerGui

function UICorner(Parent , R1 ,R2)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(R1,R2)
	UICorner.Parent = Parent
end

function UIStroke(Parent, Opacity, Thickness)
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = Thickness
	UIStroke.Transparency = Opacity
	UIStroke.Parent = Parent
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end

function GridOptions(Parent)
	local UIGrid = Instance.new("UIGridLayout")
	UIGrid.Parent = Parent
	UIGrid.CellSize = UDim2.new(1,0,0.1,0)
	UIGrid.CellPadding = UDim2.new(0.05,0,0.01,0)
	UIGrid.FillDirection = Enum.FillDirection.Vertical
	UIGrid.SortOrder = Enum.SortOrder.Name
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
UICorner(BackGround,0,6)

local MovieButton = Instance.new("TextButton")
MovieButton.Name = "MovieFrame"
MovieButton.Parent = BackGround
MovieButton.Size = UDim2.new(1,0,0.06,0)
MovieButton.Transparency = 0.6
MovieButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MovieButton.TextColor3 = Color3.fromRGB(0, 0, 0)
MovieButton.AutoButtonColor = false
MovieButton.Text = ""

UICorner(MovieButton,0,6)
CloseButtons(MovieButton)

local TextLogo = Instance.new("TextLabel")
TextLogo.Name = "LogoName"
TextLogo.Size = UDim2.new(0.8,0,0.6,0)
TextLogo.Position = UDim2.new(0.05,0,0.225,0)
TextLogo.Parent = MovieButton
TextLogo.BackgroundTransparency = 1
TextLogo.TextColor3 = Color3.new(0.254902, 0.254902, 0.254902)
TextLogo.Text = "VISIBLE"
TextLogo.TextScaled = true
TextLogo.TextXAlignment = Enum.TextXAlignment.Left

local TextVersion = Instance.new("TextLabel")
TextVersion.Name = "VersionText"
TextVersion.Size = UDim2.new(1,0,0.5,0)
TextVersion.Position = UDim2.new(0,0,0.25,0)
TextVersion.Parent = MovieButton
TextVersion.BackgroundTransparency = 1
TextVersion.TextColor3 = Color3.new(0.254902, 0.254902, 0.254902)
TextVersion.Text = "v.0.1"
TextVersion.TextScaled = true


local Options = Instance.new("Frame")
Options.Name = "Options"
Options.Parent = BackGround
Options.Size = UDim2.new(0.3, 0,0.94, 0)
Options.BackgroundTransparency = 1
Options.Position = UDim2.new(0, 0,0.058, 0)

function UIPadding(Parent, Top, Bottom, Left, Right)
	local padding = Instance.new("UIPadding")
	padding.Parent = Parent
	padding.PaddingTop = UDim.new(Top.Scale or 0, Top.Offset or 0)
	padding.PaddingBottom = UDim.new(Bottom.Scale or 0, Bottom.Offset or 0)
	padding.PaddingLeft = UDim.new(Left.Scale or 0, Left.Offset or 0)
	padding.PaddingRight = UDim.new(Right.Scale or 0, Right.Offset or 0)
	return padding
end

function CreateWebhookFunc(Parent, Name , Text ,Number)
	
	local TButton2 = Instance.new("Frame")
	TButton2.Parent = Parent
	TButton2.Name = "2".. tostring(Name)
	TButton2.Transparency = 0.8
	TButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	
	local TestButton = Instance.new("TextButton")
	TestButton.Name = Name.."Button2"
	TestButton.Parent = TButton2
	TestButton.Size = UDim2.new(0.7,0,0.5,0)
	TestButton.Position = UDim2.new(0.1,0,0.25,0)
	TestButton.BackgroundColor3 = Color3.new(0.239216, 0.239216, 0.239216)
	TestButton.TextColor3 = Color3.new(1, 1, 1)
	TestButton.Text = "Test"
	
	
	
	
	-- Проверяем наличие вебхука
	function sendWebhook()
		local playerName = game.Players.LocalPlayer.Name

		local embedData = {
			username = "VISIBLE WEBHOOK",
			embeds = {
				{
					title = "AC",
					color = 5814783,
					fields = {
						{
							name = "Name",
							value = "||"..playerName.."||",
							inline = true
						},
						{
							name = "Result",
							value = PlayerGui.ResultsUI.Holder.mapdata.LevelName.Text,
							inline = false
						},
						{
							name = "Time",
							value = PlayerGui.ResultsUI.Holder.Middle.PlayTime.ValueText.Text,
							inline = false
						},
						{
							name = "Macro",
							value = "-----",
							inline = false
						},
						{
							name = "Reward",
							value = "Total Gems:".. game:GetService("Players").LocalPlayer._stats.gem_amount.Value,
							inline = false
						}
					},
					footer = {
						text = "BY VISIBLE"
					}
					
				}
			}
		}

		local jsonData = game:GetService("HttpService"):JSONEncode(embedData)

		if request then
			request({
				Url = _G.Webhook,
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = jsonData
			})
		end
	end

	-- Пример использования при нажатии кнопки
	TestButton.MouseButton1Click:Connect(function()
		local playerName = game.Players.LocalPlayer.Name
		local success = sendWebhook()

		if success then
			print("✅ Сообщение отправлено!")
		else
			warn("❌ Ошибка отправки")
		end
	end)
	
	
	UICorner(TButton2,0,6)
	UICorner(TestButton,0,2)

	UIStroke(TButton2, 0.9 , 2)
	UIStroke(TestButton, 0.9 , 2)
end

function CreateCustomFunc(Parent, Name , Text ,Number)

	local TButton = Instance.new("Frame")
	TButton.Parent = Parent
	TButton.Name = Number.. tostring(Name)
	TButton.Transparency = 0.8
	TButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

	UICorner(TButton,0,6)

	local TXTLable = Instance.new("TextLabel")
	TXTLable.Parent = TButton
	TXTLable.Size = UDim2.new(0.438, 0,0.39, 0)
	TXTLable.Position = UDim2.new(0.033, 0,0.281, 0)
	TXTLable.BackgroundTransparency = 1
	TXTLable.TextColor3 = Color3.fromRGB(185, 185, 185)
	TXTLable.Text = Text
	TXTLable.TextSize = 15
	TXTLable.Font = Enum.Font.FredokaOne
	
	local BGB = Instance.new("Frame")
	BGB.Parent = TButton
	BGB.Name = "BGBUT"
	BGB.Size = UDim2.new(0.079, 0,0.458, 0)
	BGB.Position = UDim2.new(0.871, 0,0.263, 0)
	BGB.Transparency = 0
	BGB.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	
	local TurnButton = Instance.new("TextButton")
	TurnButton.Name = Name.."Button"
	TurnButton.Parent = BGB
	TurnButton.Size = UDim2.new(0.8,0,0.8,0)
	TurnButton.Position = UDim2.new(0.1,0,0.1,0)
	TurnButton.BackgroundColor3 = Color3.new(1, 0.423529, 0.431373)
	TurnButton.Text = ""
	
	UIStroke(TButton, 0.9 , 2)
	UIStroke(BGB, 0.9 , 2)
	UICorner(TurnButton,0,6)
	UICorner(BGB,0,6)

end

function FuncOPT(Name , Number , Visible)
	local Func = Instance.new("Frame")
	Func.Name = Name .. tostring(Number)
	Func.Parent = BackGround
	Func.Size = UDim2.new(0.7, 0,0.942, 0)
	Func.BackgroundTransparency = 1
	Func.Position = UDim2.new(0.3, 0,0.058, 0)
	Func.Visible = Visible
	
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Name = Name
	ScrollingFrame.Parent = Func
	ScrollingFrame.Size = UDim2.new(0.95,0,0.95,0)
	ScrollingFrame.Position = UDim2.new(0.025,0,0.025,0)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.ScrollBarThickness = 2
	ScrollingFrame.ScrollBarImageColor3 = Color3.new(0,0,0)
	ScrollingFrame.BorderSizePixel = 0
	
	local UIGrid = Instance.new("UIGridLayout")
	UIGrid.Parent = ScrollingFrame
	UIGrid.CellSize = UDim2.new(1,0,0.07,0)
	UIGrid.CellPadding = UDim2.new(0.05,0,0.015,0)
	UIGrid.FillDirection = Enum.FillDirection.Vertical
	UIGrid.SortOrder = Enum.SortOrder.Name
	
	UIPadding(ScrollingFrame, 
		{Scale = 0, Offset = 5},  -- Top
		{Scale = 0, Offset = 0},  -- Bottom
		{Scale = 0, Offset = 3},  -- Left
		{Scale = 0, Offset = 8}   -- Right
	)
	
end

function CreateOptions(Parent , Name , Text)
	local TButton = Instance.new("TextButton")
	TButton.Parent = Parent
	TButton.Name = Name
	TButton.Text = ""
	TButton.BackgroundTransparency = 0.8
	TButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	
	UICorner(TButton,0,6)

	local TXTLable = Instance.new("TextLabel")
	TXTLable.Parent = TButton
	TXTLable.Size = UDim2.new(0.8,0,0.8,0)
	TXTLable.Position = UDim2.new(0.1,0,0.1,0)
	TXTLable.BackgroundTransparency = 1
	TXTLable.TextColor3 = Color3.fromRGB(185, 185, 185)
	TXTLable.Text = Text
	
	TXTLable.TextSize = 15
	TXTLable.Font = Enum.Font.FredokaOne
	
	UIStroke(TButton, 0.9 , 1.5)
end




GridOptions(Options)
UIPadding(Options, 
	{Scale = 0, Offset = 5},  -- Top
	{Scale = 0, Offset = 0},  -- Bottom
	{Scale = 0, Offset = 5},  -- Left
	{Scale = 0, Offset = 5}   -- Right
)
CreateOptions(Options , "1Game" , "Game")
CreateOptions(Options , "2Webhook" , "Webhook")
CreateOptions(Options , "3???" , "???")

FuncOPT("Game",1 , true)
FuncOPT("Webhook",2 , false)

local Game1F = BackGround:WaitForChild("Game1"):WaitForChild("Game")

CreateCustomFunc(Game1F, "AutoReplay" , "AutoReplay" ,1)
CreateCustomFunc(Game1F, "AutoLeave" , "AutoLeave" ,3)
CreateCustomFunc(Game1F, "AutoNext" , "AutoNext" ,2)
CreateCustomFunc(Game1F, "AutoSkip" , "AutoSkip" ,4)

local Webhook1F = BackGround:WaitForChild("Webhook2"):WaitForChild("Webhook")

CreateWebhookFunc(Webhook1F, "Webhook" , "Webhook" ,1)

local WebhookOpt = BackGround:WaitForChild("Options"):WaitForChild("2Webhook") -- button option

local GameOpt = BackGround:WaitForChild("Options"):WaitForChild("1Game")

WebhookOpt.MouseButton1Click:Connect(function()
	Webhook1F.Parent.Visible = true
	Game1F.Visible = false
end)

GameOpt.MouseButton1Click:Connect(function()
	Webhook1F.Parent.Visible = false
	Game1F.Visible = true
end)

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

local AutoReplay = false

local ReplayOption = ScreenGui:WaitForChild("BackGround"):WaitForChild("Game1"):WaitForChild("Game"):WaitForChild("1AutoReplay"):WaitForChild("BGBUT"):WaitForChild("AutoReplayButton")

ReplayOption.MouseButton1Click:Connect(function()
	AutoReplay = not AutoReplay  -- Переключаем значение

	if AutoReplay then
		ReplayOption.BackgroundColor3 = Color3.fromRGB(194, 255, 147)  -- Зеленый
		print("AutoReplay - ON", AutoReplay)
	else
		ReplayOption.BackgroundColor3 = Color3.fromRGB(255, 107, 110)  -- Красный
		print("AutoReplay - OFF", AutoReplay)
	end
end)
	
local ENDSCREEN = PlayerGui:FindFirstChild("ResultsUI")
	
-- Отдельно подключаем отслеживание видимости
ENDSCREEN:GetPropertyChangedSignal("Enabled"):Connect(function()
	if AutoReplay and ENDSCREEN.Enabled then
		game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("set_game_finished_vote"):InvokeServer("replay")
	end
end)

ENDSCREEN:GetPropertyChangedSignal("Enabled"):Connect(function()
	if ENDSCREEN.Enabled then
		sendWebhook()
	end
end)
