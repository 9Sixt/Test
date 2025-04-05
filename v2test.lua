getgenv().Start = tick()
if not game:IsLoaded() then game.Loaded:Wait()end;repeat task.wait() until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.PlayerGui and game:GetService("Players").LocalPlayer.Backpack
--[[if getgenv().isRunning then return end
getgenv().isRunning = true]]
_G.Configs = {
	Fishing = false,
	Mode = "Instant",
	TrackEvents = false,
	EventsLists = {"N/A", "N/A"},
	EquipRod = true,
	Cast = true,
	Shake = true,
	SizeReel = true,
	Oxygen = true,
	Radar = true,
	Fishing_In_Water = true,
	RemoveNotifyAndFishModel = false,
	SellAll = false,
	PositionMode = "Automatic",
	PositionX = 0,
	PositionY = 0,
	PositionZ = 0,
	RotationX = 0,
	RotationY = 0,
	RotationZ = 0,
	FPS = 999,
	White = false
}
do	
	Service = {
		CoreGui = game:GetService("CoreGui"),
		ReplicatedStorage = game:GetService("ReplicatedStorage");
		RunService = game:GetService("RunService");
		TweenService = game:GetService("TweenService");
		UserInputService = game:GetService("UserInputService");
		GuiService = game:GetService("GuiService");
		VirtualInputManager =game:GetService("VirtualInputManager");
		VirtualUser = game:GetService("VirtualUser");
		MarketplaceService = game:GetService("MarketplaceService");
		HttpService = game:GetService("HttpService");
		Lighting = game:GetService("Lighting");
		TeleportService = game:GetService("TeleportService");
		Players = game:GetService("Players");
	};
	_id = game.PlaceId;
	_jobid = game.JobId;
	_allplayers = Service.Players.NumPlayers;
	_SetAttribute = game.SetAttribute;
	_mouse = Service.Players.LocalPlayer:GetMouse();
	_camera = workspace.CurrentCamera;
	_heartbeat = Service.RunService.Heartbeat;
	_stepped = Service.RunService.Stepped;
	_rendersteped = Service.RunService.RenderStepped;
	_LocalPlayer = Service.Players.LocalPlayer;
	Character = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait();
	_Folder = "Fetching'Script/Config" .. "/" .. _LocalPlayer.Name .. "/" .. _id .. ".json"
	_PlayerGui = _LocalPlayer.PlayerGui;
	_Backpack = _LocalPlayer.Backpack;
	request = request;
	getconnections = getconnections;
	setfpscap = setfpscap;
	cloneref = cloneref;
	readfile = readfile;
	writefile = writefile;
	isfile = isfile;
	isfolder = isfolder;
	makefolder = makefolder;
	delfile = delfile;
	setclipboard = setclipboard;
	_Icons = {
		general = 81707063924327,jigsaw = 112798812841371,
		eye = 127654928705257,special = 89895957638788,
		sofia = 100618692787198,document = 94464892425343,
		executor = 82489653632066,cube = 86971175780354,
		document_folder = 83641493809685,marker = 137560977237224,
		remote = 100436514092367,aim = 101516660165690,
		thunder = 97459673019824,robot = 139021543288287,
		setting = 93882575056497,chatbot = 90529487269002,
		people = 106898999468334,star = 71053300533420,
		focus = 108988520366437,cutesofia = 138127867432976,
		misc = 126463033320653,upload = 117415852023142,
		download = 94548929927000,display = 116121048695649,
		night = 105855852945791,day = 83758878478130,
		cloud = 107927309418429,bookmark = 96315518803478,
		location = 983985609976125, generalcolor = 17233391579,
		automatic = 17113787043, shop = 137810459172585
	};
end;
if Service.CoreGui:FindFirstChild("Fetching") then Service.CoreGui:FindFirstChild("Fetching"):Destroy()end;
if Service.UserInputService.TouchEnabled and not Service.UserInputService.KeyboardEnabled then Mobile = true else PC = true end;
if _id == 72907489978215 then
	_G.W2 = true
else
	_G.W1 = true
end
task.spawn(function()
	if getconnections then
		for _,v in pairs(getconnections(_LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		local VirtualUser = cloneref(Service.VirtualUser)
		_LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end);
getgenv = getgenv
_copy = function(str)setclipboard(str)end;
_LocalPlayer.CharacterAdded:Connect(function(newCharacter)Character=newCharacter;end);
_loadstr = function(raw)loadstring(game:HttpGet(raw))()return;end;
_translate=function(en,th)if _G.Thailand or getgenv().Thai or _G.Thai then return tostring(th)else return tostring(en)end end;
queue_on_teleport = queue_on_teleport
_NotPlayers = function(Inc)return Service.Players:GetPlayerFromCharacter(Inc)end;
_IsRootPart = function()return Character and Character:FindFirstChild("HumanoidRootPart") ~= nil;end;
_checktable = function(config,_table)for _,v in pairs(_table)do if config[v] == true then return true end end return false end;
function LoadSettings()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Fetching'Script") then
			makefolder("Fetching'Script")
		end
		if not isfolder("Fetching'Script/Config") then
			makefolder("Fetching'Script/Config")
		end
		if not isfile(_Folder) then
			writefile(_Folder, game:GetService("HttpService"):JSONEncode(_G.Configs))
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile(_Folder))
			for i,v in pairs(Decode) do
				_G.Configs[i] = v
			end
		end
	else
		return warn("Executor is Not Support")
	end
end
function SaveSettings()
	if readfile and writefile and isfile and isfolder then
		local configFile = _Folder
		if not isfile(configFile) then
			LoadSettings()
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile(configFile))
			local tablex = {}
			for i,v in pairs(_G.Configs) do
				tablex[i] = v
			end
			writefile(configFile, game:GetService("HttpService"):JSONEncode(tablex))
		end
	else
		return warn("Executor is Not Supported")
	end
end
DeleteSettings = function()
	if isfile(_Folder) then
		delfile(_Folder)
	end
end;
RbxtoNumber = function(rbx)
	return tonumber(string.match(rbx, "%d+"))
end
NumtoRbx = function(i)
	if type(i) == 'string' and not i:find('rbxassetid://') then
		return "rbxassetid://".. i
	elseif type(i) == 'number' then
		return "rbxassetid://".. i
	else
		return i
	end
end;
HopServer = function()
	pcall(function()
		local Api = "https://games.roblox.com/v1/games/"
		local _servers = Api.._id.."/servers/Public?sortOrder=Asc&limit=100"
		local ListServers = function (cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
			return Service.HttpService:JSONDecode(Raw)
		end
		local Server, Next; repeat
			local Servers = ListServers(Next)
			Server = Servers.data[1]
			Next = Servers.nextPageCursor
		until Server
		Service.TeleportService:TeleportToPlaceInstance(_id,Server.id,_LocalPlayer)
	end)
end;
html = function(text, color)
	if type(text) == "string" and typeof(color) == "Color3" then
		local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
		return string.format('<font color="rgb(%d, %d, %d)">%s</font>', r, g, b, text)
	end
	return text
end
Isnil = html("N/A", Color3.fromRGB(255, 255, 0))
GetY = function(part)
	local head = part.Position + Vector3.new(0, part.Size.Y / 2, 0)
	return head
end;
lookAt = function(part)
	local rootPosition = Character.HumanoidRootPart.Position
	local partPosition = part.Position
	local lookAtCFrame = CFrame.lookAt(rootPosition, partPosition)
	Character.HumanoidRootPart.CFrame = CFrame.new(rootPosition, partPosition)
end;
tp = function(new)
	pcall(function()
		if Character:FindFirstChild("HumanoidRootPart") then
			Character.HumanoidRootPart.CFrame = new
		end
	end)
end;
spin = function(targetCFrame)
	pcall(function()
		local Root = Character:FindFirstChild("HumanoidRootPart")
		if Root then
			Root.CFrame = CFrame.new(Root.Position) * targetCFrame.Rotation
		end
	end)
end
gametp = function(id)
	Service.TeleportService:Teleport(id,_LocalPlayer)
end;
jobtp = function(job_id)
	Service.TeleportService:TeleportToPlaceInstance(_id,job_id,_LocalPlayer)
end;
click = function()
	Service.VirtualUser:CaptureController()
	Service.VirtualUser:Button1Down(Vector2.new(1280, 672))
end;
Equip = function(ToolSe)
	if _Backpack:FindFirstChild(ToolSe) and not Character:FindFirstChild(ToolSe) then
		local tool = _Backpack:FindFirstChild(ToolSe)
		if _IsRootPart() then
			Character.Humanoid:EquipTool(tool)
		end
	end
end
local CFloop
cfly=function()
	local humanoid = Character:FindFirstChildOfClass('Humanoid')
	humanoid.PlatformStand = true
	local Head = Character:WaitForChild("Head")
	Head.Anchored = true
	if CFloop then 
		CFloop:Disconnect() 
	end
	CFloop =Service.RunService.Heartbeat:Connect(function(deltaTime)
		local moveDirection = humanoid.MoveDirection * (_G.Config["CFly Speed"] * deltaTime)
		local headCFrame = Head.CFrame
		local cameraCFrame = workspace.CurrentCamera.CFrame
		local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
		cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
		local cameraPosition = cameraCFrame.Position
		local headPosition = headCFrame.Position
		local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
		Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
	end)
end
uncfly=function()
	if CFloop then
		CFloop:Disconnect()
	end
	if Character then
		Character.Humanoid.PlatformStand = false
		local Head = Character:WaitForChild("Head")
		if Character.HumanoidRootPart then
			Character.HumanoidRootPart.Anchored = false
			Head.Anchored = false
		end
	end
end
local Noclip = nil
local Clip = nil
noclip = function()
	Clip = false
	local function Nocl()
		if Clip == false and Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide then
					v.CanCollide = false
				end
			end
		end
		wait(0.21)
	end
	Noclip = _stepped:Connect(Nocl)
end
WeAreLoop = function(C)
	task.spawn(function()
		while task.wait() do
			C()
		end
	end)
end
Fetching = loadstring(game:HttpGetAsync("https://github.com/MerrySubs4t/Softwork/blob/main/Fetching/FrameworkUI.lua?raw=true"))({"https://discord.gg/uy6TP4ew7d"})
LoadSettings()
Window = Fetching:Window({Logo = 128185233852701,Size = UDim2.new(0, 500,0, 375)})
Tabs = {
	['General'] = Window:CreateTab({Title = _translate("General", "ทั่วไป"),Icon = 97459673019824});
	['Auto'] = Window:CreateTab({Title = _translate("Events", "อีเว้นท์"),Icon = _Icons.star});
	['Item'] = Window:CreateTab({Title = _translate("Automatic", "อัตโนมติ"),Icon = 89895957638788});
	['Teleport'] = Window:CreateTab({Title = _translate("Teleport", "เทเลพอร์ค"),Icon = 98398560997612});
	['Misc'] = Window:CreateTab({Title = _translate("Miscellaneous", "เพิ่มเติม"),Icon = 112798812841371});
}
General = {
	Advertisement = Tabs.General:CreateSection({
		Title = _translate("Advertisement", "โฆษณา"),
		Side = "l"
	});
	General = Tabs.General:CreateSection({
		Title = _translate("Fishing", "การตกปลา"),
		Side = "r"
	});
	Config = Tabs.General:CreateSection({
		Title = _translate("Settings", "ตั้งค่าการตกปลา"),
		Side = "r"
	});
	Sell = Tabs.General:CreateSection({
		Title = _translate("Selling", "การขาย"),
		Side = "l"
	});
	Item = Tabs.General:CreateSection({
		Title = _translate("Items", "ไอเท็ม"),
		Side = "l"
	});
	More = Tabs.General:CreateSection({
		Title = _translate("Other", "เพิ่มเติม"),
		Side = "r"
	});
}
Auto = {
	Events = Tabs.Auto:CreateSection({
		Title = _translate("Events", "อีเว้นท์ตอนนี้"),
		Side = "l"
	});
	Automatic = Tabs.Auto:CreateSection({
		Title = _translate("Automatic", "อัตโนมัติ"),
		Side = "r"
	});
}
Teleport = {
	Sea = Tabs.Teleport:CreateSection({
		Title = _translate("Sea", "ทะเล"),
		Side = "l"
	});
	Island = Tabs.Teleport:CreateSection({
		Title = _translate("Island", "เกาะ"),
		Side = "l"
	});
	Zone = Tabs.Teleport:CreateSection({
		Title = _translate("Zone", "โซน"),
		Side = "l"
	});
	Players = Tabs.Teleport:CreateSection({
		Title = _translate("Players", "ผู้เล่น"),
		Side = "r"
	});
	Boat = Tabs.Teleport:CreateSection({
		Title = _translate("Boat", "เรือ"),
		Side = "r"
	});
	NPC = Tabs.Teleport:CreateSection({
		Title = _translate("NPC", "ผู้คน [ NPC ]"),
		Side = "r"
	});
	Place = Tabs.Teleport:CreateSection({
		Title = _translate("Place", "สถานที่"),
		Side = "r"
	});
}
Misc = {
	Performant = Tabs.Misc:CreateSection({
		Title = _translate("Performant", "เพิ่มประสิทธิภาพ"),
		Side = "l"
	});
	Misc = Tabs.Misc:CreateSection({
		Title = _translate("Miscellaneous", "เพิ่มเติม"),
		Side = "r"
	});
	Visual = Tabs.Misc:CreateSection({
		Title = _translate("Visual", "การมองเห็น"),
		Side = "l"
	});
	Server = Tabs.Misc:CreateSection({
		Title = _translate("Server", "เซิร์ฟเวอร์"),
		Side = "r"
	});
}
General.Advertisement:Image({Image = _Icons.cutesofia})
General.Advertisement:Line()
General.Advertisement:CreateButton({Title = _translate("Join Discord", "เข้าร่วมดิสคอร์ด"),CallBack = function()
	_copy("https://discord.gg/uy6TP4ew7d")
end})
function EventsList()
	if _id == 72907489978215 then
		return {"Soon"}
	else
		return {"Forsaken Veil - Scylla","Whales Pool", "Great White Shark", "Whale Shark", "Orcas Pool", "Megalodon Default", "The Kraken Pool", "Great Hammerhead Shark"}
	end
end
function IsRod()
	return workspace.PlayerStats[_LocalPlayer.Name].T[_LocalPlayer.Name].Stats.rod.Value
end
Rod = IsRod()
Rod_In = Character:FindFirstChild(tostring(IsRod()))
Reel = Service.ReplicatedStorage.events["reelfinished "]
RodLabel = General.General:Paragarp({
	Title = _translate(html("Rod", Color3.fromRGB(85, 170, 255)) .. " : " .. Isnil, html("เบ็ด", Color3.fromRGB(85, 170, 255)) .. " : " .. Isnil)
})
WeAreLoop(function()
	pcall(function()
		Rod = IsRod()
		RodLabel:Set(_translate(html("Rod", Color3.fromRGB(85, 170, 255)) .. " : " .. tostring(Rod), html("เบ็ด", Color3.fromRGB(85, 170, 255)) .. " : " .. tostring(Rod)))
	end)
end)
_G.AutoPosition = {
	X = 0,
	Y = 0,
	Z = 0,
}
function AutoPosition()
	if _IsRootPart() then
		local Root = Character:FindFirstChild("HumanoidRootPart")
		_G.AutoPosition.X = Root.Position.X
		_G.AutoPosition.Y = Root.Position.Y
		_G.AutoPosition.Z = Root.Position.Z
	end
end
General.General:Line()
General.General:CreateToggle({
	Title = _translate("Automatic Fishing","ตกปลาอัตโนมัติ"),
	Value = _G.Configs.Fishing,
	CallBack = function(v)
		_G.Configs.Fishing = v
		if v then
			if _G.Configs.PositionMode ~= "Save Position" then
				AutoPosition()
			end
		else
			setfpscap(999)
		end
		SaveSettings()
	end})
General.General:Line()
SavePos = General.General:CreateButton({Title = _translate("Save Position", "บันทึกตำแหน่ง"),Callback = function()
	if _IsRootPart() then
		local Root = Character:FindFirstChild("HumanoidRootPart")
		_G.Configs.PositionX = Root.Position.X
		_G.Configs.PositionY = Root.Position.Y
		_G.Configs.PositionZ = Root.Position.Z
		_G.Configs.RotationX = Root.Rotation.X
		_G.Configs.RotationY = Root.Rotation.Y
		_G.Configs.RotationZ = Root.Rotation.Z
	end
	SaveSettings()
end})
Line = General.General:Line()
General.General:CreateToggle({
	Title = _translate("Enable Track Events","เปิดใช้งานการแทรกอีเว้นท์"),
	Value = _G.Configs.TrackEvents,
	CallBack = function(v)
		_G.Configs.TrackEvents = v
		SaveSettings()
	end})
General.General:CreateDropdown({
	Title = _translate("Select Events", "เลือกอีเว้นท์"),
	List = EventsList(),
	Value = _G.Configs.EventsLists,
	Multi = true,
	Callback = function(value)
		_G.Configs.EventsLists = value
		SaveSettings()
	end})

WeAreLoop(function()
	if _G.Configs.Fishing then
		if _G.Configs.TrackEvents then
			for _, v in pairs(workspace.zones.fishing:GetChildren()) do
				if table.find(_G.Configs.EventsLists, v.Name) then 
					if _G.W2 then
						print("LUY")
					else
						if v.Name == "Forsaken Veil - Scylla" then
							tp(CFrame.new(-2172, -11218, 7060))
							spin(CFrame.Angles(
								math.rad(180),
								math.rad(81),
								math.rad(180)
								))
						elseif v.Name == "Whales Pool" then
							tp(CFrame.new(GetY(v)) * CFrame.new(0,5,0))
						elseif v.Name == "Orcas Pool" then
							tp(CFrame.new(GetY(v)) * CFrame.new(0,3,50))
							if Character:FindFirstChild("HumanoidRootPart") then
								Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.pi, 0)
							end
						elseif v.Name == "The Kraken Pool" then
							tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
						elseif v.Name == "Great White Shark" then
							tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
						elseif v.Name == "Megalodon Default" then
							tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
						elseif v.Name == "Great Hammerhead Shark" then
							tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
						elseif v.Name == "Whale Shark" then
							tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
						else
							if _G.Configs.PositionMode == "Save Position" then
								tp(CFrame.new(
									_G.Configs.PositionX,
									_G.Configs.PositionY,
									_G.Configs.PositionZ
									))
								spin(CFrame.Angles(
									math.rad(_G.Configs.RotationX),
									math.rad(_G.Configs.RotationY),
									math.rad(_G.Configs.RotationZ)
									))
							else
								tp(CFrame.new(_G.AutoPosition.X, _G.AutoPosition.Y, _G.AutoPosition.Z))
							end
						end
					end
				end
			end
		else
			if _G.Configs.PositionMode == "Save Position" then
				tp(CFrame.new(
					_G.Configs.PositionX,
					_G.Configs.PositionY,
					_G.Configs.PositionZ
					))
				spin(CFrame.Angles(
					math.rad(_G.Configs.RotationX),
					math.rad(_G.Configs.RotationY),
					math.rad(_G.Configs.RotationZ)
					))
			else
				tp(CFrame.new(_G.AutoPosition.X, _G.AutoPosition.Y, _G.AutoPosition.Z))
			end
		end
	end
end)

task.spawn(function()
	if _G.W2 then
		_G.Events = {
			_SeaLeviathan = false
		}
	else
		_G.Events = {
			_Scylla = false,
			_BlueWhale = false,
			_Orca = false,
			_Megalodon = false,
			_Kraken = false,
			_WhaleShark = false,
			_HammerShark = false,
			_WhiteShark = false
		}
	end
end)

General.Config:CreateToggle({Title = _translate("Equip","ออโต้ถือเบ็ด"),Value = _G.Configs.EquipRod,CallBack = function(v)
	_G.Configs.EquipRod = v
	SaveSettings()
end})
WeAreLoop(function()
	if _G.Configs.EquipRod then
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			local Rod_InB = _Backpack:FindFirstChild(tostring(IsRod()))
			if Rod_InB then
				Character.Humanoid:EquipTool(Rod_InB)
			end
		end
	end
end)


General.Config:CreateToggle({Title = _translate("Cast","ออโต้โยนเบ็ด"),Value = _G.Configs.Cast,CallBack = function(v)
	_G.Configs.Cast = v
	SaveSettings()
end})
WeAreLoop(function()
	if _G.Configs.Cast then
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			Rod_In = Character:FindFirstChild(tostring(IsRod()))
			if Rod_In and not Rod_In:FindFirstChild("bobber", true) then
				Rod_In.events.cast:FireServer(1, 1)
			end
		end
	end
end)

General.Config:CreateToggle({Title = _translate("Shake","ออโต้กดปุ่มเชค"),Value = _G.Configs.Shake,CallBack = function(v)
	_G.Configs.Shake = v
	SaveSettings()
end})
WeAreLoop(function()
	if _G.Configs.Shake then
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			pcall(function()
				_PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
				Service.VirtualUser:Button1Down(Vector2.new(1, 1))
				Service.VirtualUser:Button1Up(Vector2.new(1, 1))
			end)
		end
	end
end)

General.Config:CreateToggle({Title = _translate("Increase Bar Size","เพิ่มขนาดหลอดตอนดึงปลา"),Value = _G.Configs.SizeReel,CallBack = function(v)
	_G.Configs.SizeReel = v
	SaveSettings()
end})
WeAreLoop(function()
	if _G.Configs.SizeReel then
		pcall(function()
			_PlayerGui.reel.bar.playerbar.Size = UDim2.new(1, 0, 1, 0)
		end)
	end
end)


ModeParagarp = General.Config:CreateImage({
	Title = _translate(html("Warning", Color3.fromRGB(255, 56, 59)), html("คำเตือน", Color3.fromRGB(255, 56, 59))),
	Desc = _translate("Using Cancel Animation Mode has a High Chance of Losing caught Fish.\nIf Use This Mode,\nYou won't be able to use Instant Mode.\nRecommend : Use with rods that have Lure Speed Less than 95%\nRequired : Save Position Mode.", "การใช้โหมดยกเลิกแอนิเมชันมีโอกาสสูงที่ปลาจะหลุด\nถ้าเปิดโหมดนี้จะไม่สามารถใช้โหมด Instant อีกเลย(ต้องออกเข้าใหม่เท่านั้น)\nแนะนำ : ใช้กับเบ็ดที่มีความเร็วในการล่อน้อยกว่า 95% \nต้องเปิดคู่กับ: โหมดบันทึกตำแหน่ง (Save Position Mode)"),
	Icon = NumtoRbx(137463329282571)
})
General.Config:CreateSelect({
	Title = _translate("Mode Position", "โหมดการเลือกตำแหน่ง"),
	List = {"Save Position", "Automatic"},
	Value = _G.Configs.PositionMode,
	Callback = function(value)
		_G.Configs.PositionMode = value
		if value == "Save Position" then
			SavePos:SetVisible(true)
			Line:SetVisible(true)
		else
			SavePos:SetVisible(false)
			Line:SetVisible(false)
		end
		SaveSettings()
	end,
})
General.Config:CreateSelect({
	Title = _translate("Reeling", "โหมดดึงปลา"),
	List = {"Beta - Cancle Animation", "Instant","Disable"},
	Value = _G.Configs.Mode,
	Callback = function(value)
		_G.Configs.Mode = value
		if value == "Beta - Cancle Animation" then
			ModeParagarp:SetVisible(true)
		else
			ModeParagarp:SetVisible(false)
		end
		SaveSettings()
	end,
})
WeAreLoop(function()
	pcall(function()
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			local humanoid = Character:FindFirstChildOfClass("Humanoid")
			for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
				if track.Animation.AnimationId == "rbxassetid://113972107465696" or
					track.Animation.AnimationId == "rbxassetid://76859144349008" or
					track.Animation.AnimationId == "rbxassetid://121544683887361" or
					track.Animation.AnimationId == "rbxassetid://134146970600575" then
					track:Destroy()
				end
			end
		end
	end)
end)
WeAreLoop(function()
	if _G.Configs.Mode == "Instant" then
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			if _PlayerGui:FindFirstChild("reel") then
				Reel:FireServer(100, true)
			end
		end
	end
	if _G.Configs.Mode == "Beta - Cancle Animation" then
		if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark then
			Rod_In = Character:FindFirstChild(tostring(IsRod()))
			if _PlayerGui:FindFirstChild("reel") then
				task.spawn(function()
					pcall(function()
						Reel:FireServer(100, true)
						task.wait(0.75)
						_PlayerGui.reel:Destroy()
						Reel:FireServer(100, true)
						Rod_In.events.reset:FireServer()
						Rod_In.Parent = _Backpack
					end)
				end)
			end
		end
	end
	task.spawn(function()
		if _IsRootPart() then
			if Character.Head:FindFirstChild("dialogline") then
				Character.Head:FindFirstChild("dialogline"):Destroy()
				Rod_In.Parent = _Backpack
			end
		end
	end)
	task.spawn(function()
		pcall(function()
			Character.HumanoidRootPart.reeling:Destroy()
		end)
	end)
end)

General.Sell:CreateToggle({Title = _translate("Automatic Selling All Fish","ขายปลาทั้งหมดอัตโนมัติ"),Value = _G.Configs.SellAll,CallBack = function(v)
	_G.Configs.SellAll = v
	SaveSettings()
end})
General.Sell:Line()
General.Sell:CreateButton({Title = _translate("Sell Holding Fish", "ขายปลาที่ถืออยู่"),Callback = function()
	Service.ReplicatedStorage.events.Sell:InvokeServer()
end})
General.Sell:Line()
General.Sell:CreateButton({Title = _translate("Sell All Fish", "ขายปลาทั้งหมด"),Callback = function()
	Service.ReplicatedStorage.events.SellAll:InvokeServer()
end})
task.spawn(function()
	while task.wait(10) do
		if _G.Configs.SellAll then
			Service.ReplicatedStorage.events.SellAll:InvokeServer()
		end
	end
end)

General.More:CreateToggle({Title = _translate("Remove Notify & Fish Model","ลบการแจ้งเตือนและโมเดลปลา"),Value = _G.Configs.RemoveNotifyAndFishModel,CallBack = function(v)
	_G.Configs.RemoveNotifyAndFishModel = v
	SaveSettings()
end})
General.More:CreateToggle({Title = _translate("Walk On Water","เดินบนน้ำ"),Value = _G.Configs.Fishing_In_Water,CallBack = function(v)
	_G.Configs.Fishing_In_Water = v
	SaveSettings()
end})
General.More:CreateToggle({Title = _translate("Enable Radar","เปิดใช้งานเรดาร์"),Value = _G.Configs.Radar,CallBack = function(v)
	_G.Configs.Radar = v
	SaveSettings()
end})
General.More:CreateToggle({Title = _translate("Infinite Oxygen","เปิดใช้งานการหายใจใต้น้ำ"),Value = _G.Configs.Oxygen,CallBack = function(v)
	_G.Configs.Oxygen = v
	SaveSettings()
end})
WeAreLoop(function()
	pcall(function()
		if _G.Configs.RemoveNotifyAndFishModel then
			for _, v in pairs(workspace.active:GetChildren()) do
				if v:IsA("Model") and v.Name ~= "OceanPOI's" then
					if v:FindFirstChild("Hitbox", true) then
						v:Destroy()
					end
				end
			end
			for	_, v in pairs(_PlayerGui.hud.safezone.announcements:GetChildren()) do
				if v.Name == "catch" then
					v:Destroy()
				end
			end
			task.spawn(function()
				pcall(function()
					if _IsRootPart() then
						for _, v in pairs(Character.HumanoidRootPart:GetChildren()) do
							if v.Name == "xpGain" or v.Name == "powerfeedback" or v:IsA("ParticleEmitter") then
								v:Destroy()
							end
						end
					end
				end)
			end)
		end
	end)
end)
WeAreLoop(function()
	pcall(function()
		if _G.Configs.Fishing_In_Water then
			for _, v in pairs(workspace.zones.fishing:GetChildren()) do
				if v:IsA("Part") then
					v.CanCollide = true
				end
			end
		else
			for _, v in pairs(workspace.zones.fishing:GetChildren()) do
				if v:IsA("Part") then
					v.CanCollide = false
				end
			end
		end
		if _G.Configs.Radar then
			for _, v1 in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
				if v1:IsA("BillboardGui") or v1:IsA("SurfaceGui") then
					v1.Enabled = true
				end
			end
		else
			for _, v1 in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
				if v1:IsA("BillboardGui") or v1:IsA("SurfaceGui") then
					v1.Enabled = false
				end
			end
		end
		if _G.Configs.Oxygen then
			Character.Resources.oxygen.Disabled = true
		else
			Character.Resources.oxygen.Disabled = false
		end
	end)
end)
function Dropdown_Teleport_Refresh(info)
	local Place = info.Place or General.General
	local Name = info.Name
	local Name2 = info.Name2
	local Path = info.Path or workspace
	local CheckList = {}
	local List = {}
	local Value = info.Value or "N/A"
	local PlayerIs = info.py or false
	for _, v in pairs(Path:GetChildren()) do
		if PlayerIs then
			if not CheckList[v.Name] then
				if v ~= _LocalPlayer then
					table.insert(List, v.Name)
					CheckList[v.Name] = true
				end
			end
		else
			if not CheckList[v.Name] then
				table.insert(List, v.Name)
				CheckList[v.Name] = true

			end
		end
	end
	local Dropdown = Place:CreateDropdown({
		Title = _translate(Name, Name2),
		List = List,
		Value = Value,
		Multi = false,
		Callback = function(value)
			Value = value
		end})
	Place:CreateButton({Title = _translate("Teleport", "เทเลพอร์ต"),Callback = function()
		if Value == "N/A" then
			return warn("Nil")
		else
			if PlayerIs then
				local P = Service.Players:FindFirstChild(Value)
				if P then
					if P.Character then
						local humanoidRootPart = P.Character:FindFirstChild("HumanoidRootPart")  -- ค้นหา HumanoidRootPart
						if humanoidRootPart then
							tp(humanoidRootPart.CFrame)
						end
					end
				end
			else
				local thePlace = Path:FindFirstChild(Value)
				if thePlace then
					if thePlace:IsA("Model") then
						tp(thePlace:GetPivot())
					else
						tp(thePlace.CFrame)
					end
				end
			end
		end
	end})
	Place:CreateButton({Title = _translate("Refresh", "รีเฟรช"),Callback = function()
		CheckList = {}
		List = {}
		Dropdown:Clear()
		for _, v in pairs(Path:GetChildren()) do
			if PlayerIs then
				if not CheckList[v.Name] then
					if v ~= _LocalPlayer then
						Dropdown:AddList(v.Name)
						CheckList[v.Name] = true
					end
				end
			else
				if not CheckList[v.Name] then
					Dropdown:AddList(v.Name)
					CheckList[v.Name] = true
				end
			end
		end
	end})
end

Dropdown_Teleport_Refresh({
	Place = General.Item,
	Name = "Nearby Items",
	Name2 = "ไอเท็มรอบๆ",
	Path = workspace.world.interactables,
})
Time = Auto.Events:Icon({
	Title = _translate(html("Cycle", Color3.fromRGB(0, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["3_cycle"].label.Text, html("เวลา", Color3.fromRGB(0, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["3_cycle"].label.Text),
	Image = RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["3_cycle"].Image)
})
Weather = Auto.Events:Icon({
	Title = _translate(html("Weather", Color3.fromRGB(103, 144, 255)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["2_weather"].label.Text, html("สภาพอากาศ", Color3.fromRGB(103, 144, 255)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["2_weather"].label.Text),
	Image = RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["2_weather"].Image)
})
Season = Auto.Events:Icon({
	Title = _translate(html("Season", Color3.fromRGB(255, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["4_season"].label.Text, html("ฤดูกาล", Color3.fromRGB(255, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["4_season"].label.Text),
	Image = RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["4_season"].Image)
})
WeAreLoop(function()
	pcall(function()
		Time:SetTitle(_translate(html("Cycle", Color3.fromRGB(0, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["3_cycle"].label.Text, html("เวลา", Color3.fromRGB(0, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["3_cycle"].label.Text))
		Weather:SetTitle(_translate(html("Weather", Color3.fromRGB(103, 144, 255)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["2_weather"].label.Text, html("สภาพอากาศ", Color3.fromRGB(103, 144, 255)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["2_weather"].label.Text))
		Season:SetTitle(_translate(html("Season", Color3.fromRGB(255, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["4_season"].label.Text, html("ฤดูกาล", Color3.fromRGB(255, 255, 127)) .. " : " .. _PlayerGui.hud.safezone.worldstatuses["4_season"].label.Text))

		Time:SetImage(RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["3_cycle"].Image))
		Season:SetImage(RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["4_season"].Image))
		Weather:SetImage(RbxtoNumber(_PlayerGui.hud.safezone.worldstatuses["2_weather"].Image))
	end)
end)

Line2 = Auto.Events:Line()
NotEvents = Auto.Automatic:Notfound({Title = _translate("Empty Events", "อีเว้นท์ว่างปล่าว")})
function VisibleEvents(info)
	local Toggle = info.Toggle
	local _Spawn = info.Spawn
	local Inc = info.Inc
	local _string = info.string
	local Deep = info.Deep or false
	WeAreLoop(function()
			if Inc:FindFirstChild(_string, Deep) then
				Toggle:SetVisible(true)
				_Spawn:SetVisible(true)
				Line2:SetVisible(true)
			else
				Toggle:SetVisible(false)
				_Spawn:SetVisible(false)
				Line2:SetVisible(false)
			end
	end)
end
if _G.W2 then
	SeaLeviathan = Auto.Events:CreateSpawn({
		Title = _translate("Sea Leviathan", "เลเวียธาน"),
		Color = Color3.fromRGB(0, 170, 255),
	})

else
	Scylla = Auto.Events:CreateSpawn({
		Title = _translate("Scylla", "ฮายดร้า"),
		Color = Color3.fromRGB(62, 255, 62),
	})
	BlueWhale = Auto.Events:CreateSpawn({
		Title = _translate("Blue Whale", "วาฬน้ำเงิน"),
		Color = Color3.fromRGB(15, 79, 255),
	})
	Orca = Auto.Events:CreateSpawn({
		Title = _translate("Orca", "วาฬเพชรฆาตร"),
		Color = Color3.fromRGB(255, 255, 255),
	})
	Megalodon = Auto.Events:CreateSpawn({
		Title = _translate("Megalodon", "เมกาโลดอน"),
		Color = Color3.fromRGB(255, 0, 0),
	})
	Kraken = Auto.Events:CreateSpawn({
		Title = _translate("Kraken", "คราเค่น"),
		Color = Color3.fromRGB(85, 170, 127),
	})
	WhaleShark = Auto.Events:CreateSpawn({
		Title = _translate("Whale Shark", "ฉลามวาฬ"),
		Color = Color3.fromRGB(255, 0, 127),
	})
	HammerShark = Auto.Events:CreateSpawn({
		Title = _translate("Greate Hammer Shark", "ฉลามหัวค้อน"),
		Color = Color3.fromRGB(171, 171, 255),
	})
	WhiteShark = Auto.Events:CreateSpawn({
		Title = _translate("Great White Shark", "ฉลามขาว"),
		Color = Color3.fromRGB(85, 255, 255),
	})
	Mercant = Auto.Events:CreateSpawn({
		Title = _translate("Travelling Mercant", "พ่อค้าเร่ร่อน"),
		Color = Color3.fromRGB(85, 255, 255),
	})
	Meteor = Auto.Events:CreateSpawn({
		Title = _translate("Meteor", "อุกกาบาต"),
		Color = Color3.fromRGB(255, 85, 0),
	})

	--Toggle and button
	Scylla_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Scylla", "ตกฮายดร้า"),
		Value = _G.Events._Scylla,
		CallBack = function(v)
			_G.Events._Scylla = v
		end
	})
	BlueWhale_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Blue Whale", "ตกวาฬน้ำเงิน"),
		Value = _G.Events._BlueWhale,
		CallBack = function(v)
			_G.Events._BlueWhale = v
		end
	})
	Orca_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Orca", "ตกวาฬเพชรฆาตร"),
		Value = _G.Events._Orca,
		CallBack = function(v)
			_G.Events._Orca = v
		end
	})
	Megalodon_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Megalodon", "ตกเมกาโลดอน"),
		Value = _G.Events._Megalodon,
		CallBack = function(v)
			_G.Events._Megalodon = v
		end
	})
	Kraken_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Kraken", "ตกคราเค่น"),
		Value = _G.Events._Kraken,
		CallBack = function(v)
			_G.Events._Kraken = v
		end
	})
	WhaleShark_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Whale Shark", "ตกฉลามวาฬ"),
		Value = _G.Events._WhaleShark,
		CallBack = function(v)
			_G.Events._WhaleShark = v
		end
	})
	HammerShark_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Greate Hammer Shark", "ตกฉลามหัวค้อน"),
		Value = _G.Events._HammerShark,
		CallBack = function(v)
			_G.Events._HammerShark = v
		end
	})
	WhiteShark_Toggle = Auto.Automatic:CreateToggle({
		Title = _translate("Caught Great White Shark", "ตกฉลามขาว"),
		Value = _G.Events._WhiteShark,
		CallBack = function(v)
			_G.Events._WhiteShark = v
		end
	})
	Traveler_Button = Auto.Automatic:CreateButton({
		Title = _translate("Teleport to Travelling Mercant", "เทเลพอร์ตไปที่พ่อค้าเร่ร่อน"),
		Callback = function()
			task.spawn(function()
				pcall(function()
					tp(workspace:FindFirstChild("Travelling Merchant", true):GetPivot())
				end)
			end)
		end
	})
	Meteor_Button = Auto.Automatic:CreateButton({
		Title = _translate("Teleport to Metheor", "เทเลพอร์ตไปที่อุกกาบาต"),
		Callback = function()
			task.spawn(function()
				pcall(function()
					tp(workspace.active.meteorItems:FindFirstChildOfClass("Model"):GetPivot())
				end)
			end)
		end
	})
	task.spawn(function()
		VisibleEvents({
			Toggle = Scylla_Toggle,
			Spawn = Scylla,
			Inc = workspace.zones.fishing,
			string = "Forsaken Veil - Scylla"
		})
		VisibleEvents({
			Toggle = BlueWhale_Toggle,
			Spawn = BlueWhale,
			Inc = workspace.zones.fishing,
			string = "Whales Pool"
		})
		VisibleEvents({
			Toggle = Megalodon_Toggle,
			Spawn = Megalodon,
			Inc = workspace.zones.fishing,
			string = "Megalodon Default"
		})
		VisibleEvents({
			Toggle = Orca_Toggle,
			Spawn = Orca,
			Inc = workspace.zones.fishing,
			string = "Orcas Pool"
		})
		VisibleEvents({
			Toggle = WhaleShark_Toggle,
			Spawn = WhaleShark,
			Inc = workspace.zones.fishing,
			string = "Whale Shark"
		})
		VisibleEvents({
			Toggle = WhiteShark_Toggle,
			Spawn = WhiteShark,
			Inc = workspace.zones.fishing,
			string = "Great White Shark"
		})
		VisibleEvents({
			Toggle = Kraken_Toggle,
			Spawn = Kraken,
			Inc = workspace.zones.fishing,
			string = "The Kraken Pool"
		})
		VisibleEvents({
			Toggle = HammerShark_Toggle,
			Spawn = HammerShark,
			Inc = workspace.zones.fishing,
			string = "Great Hammerhead Shark"
		})
		VisibleEvents({
			Toggle = Traveler_Button,
			Spawn = Mercant,
			Inc = workspace,
			string = "Travelling Merchant",
			Deep = true
		})
		task.spawn(function()
			while task.wait() do
				if _G.W1 then
					if workspace.active.meteorItems:FindFirstChildOfClass("Model") then
						Meteor:SetVisible(true)
						Meteor_Button:SetVisible(true)
						Line2:SetVisible(true)
					else
						Meteor:SetVisible(false)
						Meteor_Button:SetVisible(false)
						Line2:SetVisible(false)
					end
				else
					if workspace.world.MeteorItems:FindFirstChildOfClass("Model") then
						Meteor:SetVisible(true)
						Meteor_Button:SetVisible(true)
						Line2:SetVisible(true)
					else
						Meteor:SetVisible(false)
						Meteor_Button:SetVisible(false)
						Line2:SetVisible(false)
					end
				end
			end
		end)
	end)
end

Dropdown_Teleport_Refresh({
	Place = Teleport.Players,
	Name = "Players",
	Name2 = "ผู้เล่น",
	Path = Service.Players,
	py = true
})
Dropdown_Teleport_Refresh({
	Place = Teleport.Boat,
	Name = "Boats",
	Name2 = "เรือ",
	Path = workspace.active.boats
})
Dropdown_Teleport_Refresh({
	Place = Teleport.Zone,
	Name = "Zone",
	Name2 = "โซน",
	Path = workspace.zones.fishing,
})
Dropdown_Teleport_Refresh({
	Place = Teleport.Island,
	Name = "Island",
	Name2 = "เกาะ",
	Path = workspace.active["OceanPOI's"],
})
Dropdown_Teleport_Refresh({
	Place = Teleport.NPC,
	Name = "NPC",
	Name2 = "ผู้คน - NPC",
	Path = workspace.world.npcs,
})
task.spawn(function()
	if _G.W1 then
		Dropdown_Teleport_Refresh({
			Place = Teleport.Place,
			Name = "Place",
			Name2 = "สถานที่",
			Path = workspace.world.spawns.TpSpots,
		})
	end
end)
Teleport.Sea:CreateButton({
	Title = _translate("Teleport", "เทเลพอร์ด"),
	Callback = function()
		if workspace.PlayerStats[_LocalPlayer.Name].T[_LocalPlayer.Name].Cache.CurrentWorld.Value == "Sea 2" then
			task.spawn(function()
				pcall(function()
					tp(CFrame.new(451, 84, 797))
					task.wait(2)
					workspace.world.npcs["Sea Traveler"].seatraveler.teleport:InvokeServer()
				end)
			end)
		else
			task.spawn(function()
				pcall(function()
					tp(CFrame.new(140, 150, 2020))
					task.wait(2)
					workspace.world.npcs["Sea Traveler"].seatraveler.teleport:InvokeServer()
				end)
			end)
		end
	end,
})
Misc.Performant:CreateToggle({
	Title = _translate("White Screen", "จอขาว"),
	Value = _G.Configs.White,
	CallBack = function(v)
		_G.Configs.White = v
		if v then
			game:GetService("RunService"):Set3dRenderingEnabled(false)
		else
			game:GetService("RunService"):Set3dRenderingEnabled(true)
		end
		SaveSettings()
	end
})
Misc.Performant:Line()

WeAreLoop(function()
	pcall(function()
		for _, v in pairs(workspace.zones.fishing:GetChildren()) do
			if _G.W2 then

			else
				if v.Name == "Forsaken Veil - Scylla" then
					if _G.Events._Scylla then
						tp(CFrame.new(-2172, -11218, 7060))
						spin(CFrame.Angles(
							math.rad(180),
							math.rad(81),
							math.rad(180)
							))
					else
						_G.Events._Scylla = false
						continue
					end
				elseif v.Name == "Megalodon Default" then
					if _G.Events._Megalodon then
						tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
					else
						_G.Events._Megalodon = false
						continue
					end
				elseif v.Name == "Whales Pool" then
					if _G.Events._BlueWhale then
						tp(CFrame.new(GetY(v)) * CFrame.new(0, 3, 0)) lookAt(v)
					else
						_G.Events._BlueWhale = false
						continue
					end
				elseif v.Name == "Orcas Pool" then
					if _G.Events._Orca then
						tp(CFrame.new(GetY(v)) * CFrame.new(0,3,50))
						if Character:FindFirstChild("HumanoidRootPart") then
							Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.pi, 0)
						end
					else
						_G.Events._Orca = false
						continue
					end
				elseif v.Name == "The Kraken Pool" then
					if _G.Events._Kraken then
						tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
					else
						_G.Events._Kraken = false
						continue
					end
				elseif v.Name == "Great Hammerhead Shark" then
					if _G.Events._HammerShark then
						tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
					else
						_G.Events._HammerShark = false
					end
				elseif v.Name == "Great White Shark" then
					if _G.Events._WhiteShark then
						tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
					else
						_G.Events._WhiteShark = false
					end
				elseif v.Name == "Whale Shark" then
					if _G.Events._WhaleShark then
						tp(CFrame.new(GetY(v)) * CFrame.new(15,5,0))
					else
						_G.Events._WhaleShark = false
					end
				end
			end
		end
	end)
end)


task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Configs.Fishing or _G.Events._Scylla or _G.Events._WhaleShark or _G.Events._WhiteShark or _G.Events._Kraken or _G.Events._Orca or _G.Events._Megalodon or _G.Events._BlueWhale or _G.Events._HammerShark  then
				if _IsRootPart() then
					if not Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
						if Character.Humanoid.Sit == true then
							Character.Humanoid.Sit = false
						end

						local bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.Name = "BodyVelocity1"
						bodyVelocity.Parent = Character.HumanoidRootPart
						bodyVelocity.velocity = Vector3.new(0, 0, 0)
						bodyVelocity.maxForce = Vector3.new(100000, 100000, 100000)
					end
				end
			else
				Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy()
			end
		end)
	end
end)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Fetching's Script",
	Text = _translate("Reset Configs", "รีเซ็ตการตั้งค่า"),
	Duration = 999,
	Icon = "rbxassetid://128185233852701",
	Button1 = _translate("Accept", "ยืนยัน"),
	Button2 = _translate("Cancel", "ยกเลิก"),
	Callback = function(button)
		if button == "ยืนยัน" then
			DeleteSettings()
		elseif button == "ยกเลิก" then
			return
		end
	end
})
return warn("Auth Success : " .. string.format("%.10f", tostring(getgenv().Start) ) .. " to Load Data " .. tostring(_LocalPlayer.Name) .. " unpack(" .. _Folder .. ")")
