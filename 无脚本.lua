local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
  Title = "无脚本",
  Icon = "XiaoXu",
  Author = "By XiaoXu",
  Folder = "旧冬&UnicoX",
  Size = UDim2.fromOffset(560, 360),
  Transparent = true,
  Theme = "Dark",
  User = {
    Enabled = true, -- <- or false
    Callback = function() print("clicked") end, -- <- optional
    Anonymous = true -- <- or true
  },
})

Window:EditOpenButton({
  Title = "无Script",
  Icon = "By XiaoXu",
  CornerRadius = UDim.new(0,16),
  StrokeThickness = 2,
  Color = ColorSequence.new( -- gradient
  Color3.fromHex("FF0F7B"),
  Color3.fromHex("F89B29")
  ),
  --Enabled = false,
  Draggable = true,
})

function Tab(a)
  return Window:Tab({Title = a, Icon = "eye"})
end
function Button(a, b, c)
  return a:Button({Title = b, Callback = c})
end
function Toggle(a, b, c, d)
  return a:Toggle({Title = b, Value = c, Callback = d})
end
function Slider(a, b, c, d, e, f)
  return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end
function Dropdown(a, b, c, d, e)
  return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

local Tab1 = Tab("通用")
local Tab2 = Tab("Doors")
local Tab3 = Tab("被遗弃")
local Tab4 = Tab("最强战场")
local Tab5 = Tab("俄亥俄州")

Button(Tab1, "飞行", function() loadstring(game:HttpGet'https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E9%A3%9E%E8%A1%8C%E7%A4%BA%E4%BE%8B.lua')() end)
Slider(Tab1, "移动速度", 1, 10000, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, function(a) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a end)
Slider(Tab1, "跳跃高度", 1, 10000, game.Players.LocalPlayer.Character.Humanoid.JumpPower, function(a) game.Players.LocalPlayer.Character.Humanoid.JumpPower = a end)
Slider(Tab1, "重力设置", -50, 500, workspace.Gravity, function(a) workspace.Gravity = a end)
Toggle(Tab1, "穿墙", false, function(a)
    if game.Players.LocalPlayer.Character then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                if a then
                    v.CanCollide = false
                else
                    v.CanCollide = true
                end
            end
        end
    end
end)
Button(Tab1, "光影V4", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()end)
Button(Tab1, "飞车", function()loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()end)
Button(Tab1, "甩飞", function()loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()end)
Button(Tab1, "跟踪玩家", function()loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()end)
Button(Tab1,"踏空行走", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()end)
Button(Tab1,"转起来", function()loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0'))()end)
Button(Tab1,"透视", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'))()end)
Button(Tab1,"聊天绕过", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fechatbypassroblox/refs/heads/main/Fe%20Roblox%20ChatBypass"))()end)
Button(Tab1,"帽子旋转", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fe-Spinning-Hat-Script/refs/heads/main/Fe%20Spinning%20Hats%20Script"))()end)
Button(Tab1,"r15变r6", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()end)
Button(Tab1,"选人甩飞（需要输入别人的名字）", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()end)
Button(Tab1,"阿尔宙斯自瞄", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()end)
Button(Tab1,"换皮肤（需要别人id还需要加入群组Hell_$treet）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Invooker11/Outfit/main/OutfitCopier.lua"))()end)
Button(Tab1,"键盘脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()end)
Button(Tab1,"无限收益（copyid 输入别人名字获得id可搭配换皮肤使用）", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)
Button(Tab1,"光影", function()loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw'))()end)
Button(Tab1,"无头加kor", function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))() end)
Button(Tab1,"情云同款自瞄可调", function() local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end) end)
Toggle(Tab1, "Circle ESP", false, function(state)
  for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
      if state then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.Adornee = player.Character

        local billboard = Instance.new("BillboardGui")
        billboard.Parent = player.Character
        billboard.Adornee = player.Character
        billboard.Size = UDim2.new(0, 100, 0, 100)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = billboard
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Color3.new(1, 1, 1)
        nameLabel.TextStrokeTransparency = 0.5
        nameLabel.TextScaled = true

        local circle = Instance.new("ImageLabel")
        circle.Parent = billboard
        circle.Size = UDim2.new(0, 50, 0, 50)
        circle.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the circle
        circle.AnchorPoint = Vector2.new(0.5, 0.5) -- Set the anchor point to the center
        circle.BackgroundTransparency = 1
        circle.Image = "rbxassetid://2200552246" -- Replace with your circle image asset ID
       else
        if player.Character:FindFirstChildOfClass("Highlight") then
          player.Character:FindFirstChildOfClass("Highlight"):Destroy()
        end
        if player.Character:FindFirstChildOfClass("BillboardGui") then
          player.Character:FindFirstChildOfClass("BillboardGui"):Destroy()
        end
      end
    end
  end
end)

Button(Tab2,"门", function()loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()end)
Button(Tab2,"Poop doors", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"))()end)
Button(Tab2,"穿墙(无拉回)", function()loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()end)
Button(Tab2,"变身(阿巴怪提供)", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"剪刀", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()end)
Button(Tab2,"XD夜", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()end)
Button(Tab2,"超级脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Fazedrab/EntitySpawner/main/doors(orionlib).lua"))()end)
Button(Tab2,"脚本", function()loadstring(game:HttpGet('https://pastebin.com/raw/s5dhYNrm'))()end)
Button(Tab2,"MS", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()end)
Button(Tab2,"bob汉化", function()loadstring(game:HttpGet("https://pastebin.com/raw/65TwT8ja"))()end)
Button(Tab2,"脚本doors", function()loadstring(game:HttpGet("https://pastebin.com/raw/whXp1Ca2"))()end)
Button(Tab2,"刷怪菜单", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()end)
Button(Tab2,"DOORS变身脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"耶稣十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()end)
Button(Tab2,"紫光十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()end)
Button(Tab2,"万圣节十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()end)
Button(Tab2,"普通十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()end)
Button(Tab2,"门", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/wshibsiyedehl/Doorsxiaochen/main/DoorschenNew114514%20or%203.1415926%20%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3%E6%97%A0%E6%B3%95%E7%90%86%E8%A7%A3"))()end)
Button(Tab2,"Darkrai", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()end)
Button(Tab2,"RP变怪（别人看不见）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))()end)
Button(Tab2,"门", function()loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()end)
Button(Tab2,"手电筒（没电会有bug）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Normal%20Flashlight"))() end)
Button(Tab2,"神圣炸弹（清岩提供）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/HolyGrenadeByNerd.lua"))()end)
Button(Tab2,"十字架", function()loadstring(game:HttpGet('https://gist.githubusercontent.com/C00LBOZO/0c78ad8c74ca26324c87ede16ce8b387/raw/c0887ac0d24fde80bea11ab1a6a696ec296af272/Crucifix'))()end)
Button(Tab2,"吸铁石", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()end)
Button(Tab2,"剪刀", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))() end)
Button(Tab2,"激光枪", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()end)
Button(Tab2,"能量罐（清岩提供）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))() end)
Button(Tab2,"紫色手电筒（在电梯购买东西的时候使用）", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight"))() end)
Button(Tab2,"刷怪菜单", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()end)
Button(Tab2,"DOORS变身脚本", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))() end)
Button(Tab2,"耶稣十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()end)
Button(Tab2,"紫光十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()end)
Button(Tab2,"万圣节十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()end)
Button(Tab2,"普通十字架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()end)

Button(Tab3,"X脚本V2", function()X_SCRIPT = "XXXXXX"
loadstring(game:HttpGet("https://raw.githubusercontent.com/XSCRIPT-NB/XSCRIPT/refs/heads/main/X-SCRIPT"))()end)
Button(Tab3,"旧冬被遗弃", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/QiuShan-UX/UnicoX/refs/heads/main/%E6%97%A7%E5%86%AC%E8%84%9A%E6%9C%ACV1.lua.txt"))())end)
Button(Tab3,"HT被遗弃", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua"))()end)
Button(Tab3,"殺腳本被遗弃", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/function/refs/heads/Feng/forsaken.lua"))()end)
Button(Tab4,"Kj动作", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Tariviste/Scripts/eaf7c8bdc00fcd01c656d9b4c103b6e4a260e374/The%20Strongest%20Battlegrounds"))()end)
Button(Tab4,"1v1单挑王", function()loadstring(game:HttpGet("https://pastefy.app/HxjXAU2d/raw"))()end)
Button(Tab4,"刀锋", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrask/Nexus-Base/main/atomic-blademaster%20to%20sukuna"))()end)
Button(Tab4,"五条悟", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()end)
Button(Tab4,"饿狼自动1+2", function()loadstring(game:HttpGet("https://pastefy.app/Z7DawZJB/raw"))()end)
Button(Tab4,"饿狼改索尼克", function()loadstring(game:HttpGet("https://pastebin.com/raw/7V1mUBtQ"))()end)
Button(Tab4,"琦玉改JUN", function()loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Tp%20exploit%20saitama%20to%20jun'))()end)
Button(Tab4,"死神v2", function()getgenv().Music = false getgenv().AttackQuality = 'High' getgenv().ConstantSpeed = false loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()end)
Button(Tab4,"迪奥", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Medley-Taboritsky/RobloxScripting/refs/heads/main/DIO_Garou_TSB"))()end)
Button(Tab4,"饿狼不知道该叫什么", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()end)
Button(Tab4,"索尼克改TOJI", function()loadstring(game:HttpGet"https://raw.githubusercontent.com/Wi-sp/Limitless-legacy/refs/heads/main/GUI")()end)
Button(Tab4,"骨架", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Qaiddanial2904/ROBLOX-FREAKY-GOJO-REAL/refs/heads/main/SANS%20%5BREDACTED%5D"))()end)
Button(Tab4,"饿狼改YUJI", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/xVicity/GLACIER/main/LATEST.lua"))()end)
Button(Tab4,"五条悟2", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()end)
Button(Tab4,"自动防御", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()end)
Button(Tab4,"火影", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt"))()end)
Toggle(Tab4, "锁敌", false, function(state)
    -- Combined Local Script for Sticking and Toggle Button
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Create RemoteEvent for server communication
    local stickToggleEvent = Instance.new("RemoteEvent")
    stickToggleEvent.Name = "StickToggleEvent"
    stickToggleEvent.Parent = ReplicatedStorage
    
    -- Create a screen GUI and button
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StickToggleGui"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 100, 0, 30)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.Text = "开始锁敌awa"
    toggleButton.Parent = screenGui
    
    -- Variables
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local stickEnabled = false
    local stickOffset = Vector3.new(0, -5, 0)  -- Offset below the player's feet
    
    -- Function to get the closest player
    local function getClosestPlayer(position)
        local closestPlayer = nil
        local shortestDistance = math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (p.Character.HumanoidRootPart.Position - position).magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = p
                end
            end
        end
        return closestPlayer
    end
    
    -- Function to stick to the nearest player
    local function updateCharacterPosition()
        if stickEnabled then
            local closestPlayer = getClosestPlayer(humanoidRootPart.Position)
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
                -- Place the character below the nearest player
                local newPosition = targetPosition + stickOffset
                humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + Vector3.new(0, 1, 0))
            end
        end
    end
    
    -- Toggle button functionality
    toggleButton.MouseButton1Click:Connect(function()
        stickEnabled = not stickEnabled
        stickToggleEvent:FireServer(stickEnabled)
        if stickEnabled then
            toggleButton.Text = "停止锁敌qwq"
        else
            toggleButton.Text = "开始锁敌awa"
        end
    end)
    
    -- Update position every frame
    RunService.Heartbeat:Connect(updateCharacterPosition)
end)
Button(Tab4,"最强V3", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/tsbscripts/main/Main"))()end)
Button(Tab5,"皇脚本", function()loadstring(game:HttpGet("https://pastebin.com/raw/PdT7cART"))()end)
Button(Tab5,"xa一拳超人+捡印钞", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/main/Games/Ohio"))()end)
Button(Tab5,"俄亥俄州熊脚本普通版", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Bear-script0/OHIO/main/%E7%86%8A%E8%84%9A%E6%9C%AC%E6%99%AE%E9%80%9A%E7%89%88"))()end)
Button(Tab5,"俄亥俄州", function()loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed"))()end)
Button(Tab5,"项目一", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua"))()end)
Button(Tab5,"1", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/C-BRING/refs/heads/main/PINGUIN-CBRING-PHONE"))()end)
Button(Tab5,"自动印钞", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/MONEY-PRINTER-YAY/main/MONEY"))()end)
Button(Tab28,"2", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/OHIOVFUCKIN3/refs/heads/main/FUCKOHIOPU"))()end)
Button(Tab5,"物品透视", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/asehbzi/good/refs/heads/main/good"))()end)
Button(Tab5,"远程买东西", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/MOBILE-DEALER/refs/heads/main/PINGU-DEALER"))()end)
Button(Tab5,"物品抓取", function()loadstring(game:HttpGet("https://raw.githubusercontent.com/PUSCRIPTS/ITEM-GRABBER/refs/heads/main/item-grabber-by-pinguin-V1"))()end)