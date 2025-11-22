wait(2)

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local cam = workspace.CurrentCamera
local runService = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")

local ui = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local settings = {
    autoHunger = false,
    autoFarm = false,
    autoBreak = false,
    noclipActive = false,
    playerEsp = false,
    itemEsp = false,
    hitboxes = {
        wolves = false,
        rabbits = false,
        cultists = false,
        size = 15,
        visible = false
    }
}

local function notify(title, msg)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = msg,
        Duration = 3
    })
end

local function getPlayer()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end

local function bringItems(itemName)
    local root = getPlayer()
    if not root then return end
    
    for i,v in pairs(workspace.Items:GetChildren()) do
        if string.find(string.lower(v.Name), string.lower(itemName)) then
            local part = v:FindFirstChildOfClass("BasePart")
            if part then
                part.CFrame = root.CFrame * CFrame.new(math.random(-3,3), 2, math.random(-3,3))
            end
        end
    end
end

local function makeEsp(obj, color, text)
    if not obj then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Parent = obj
    highlight.FillTransparency = 1
    highlight.OutlineTransparency = 0
    highlight.OutlineColor = color
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    local gui = Instance.new("BillboardGui")
    gui.Parent = obj
    gui.Size = UDim2.new(0, 100, 0, 50)
    gui.StudsOffset = Vector3.new(0, 3, 0)
    gui.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel")
    label.Parent = gui
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = color
    label.TextScaled = true
    label.Text = text
    label.Font = Enum.Font.SourceSans
end

local function removeEsp(obj)
    if obj then
        local highlight = obj:FindFirstChild("Highlight")
        if highlight then highlight:Destroy() end
        local gui = obj:FindFirstChild("BillboardGui")
        if gui then gui:Destroy() end
    end
end

local function updateHitboxes()
    for i,v in pairs(workspace.Characters:GetChildren()) do
        local hrp = v:FindFirstChild("HumanoidRootPart")
        if hrp then
            local name = string.lower(v.Name)
            local shouldExpand = false
            
            if settings.hitboxes.wolves and (name:find("wolf") or name:find("alpha")) then
                shouldExpand = true
            elseif settings.hitboxes.rabbits and name:find("bunny") then
                shouldExpand = true  
            elseif settings.hitboxes.cultists and name:find("cultist") then
                shouldExpand = true
            end
            
            if shouldExpand then
                hrp.Size = Vector3.new(settings.hitboxes.size, settings.hitboxes.size, settings.hitboxes.size)
                hrp.Transparency = settings.hitboxes.visible and 0.7 or 1
                hrp.CanCollide = false
                hrp.Color = Color3.new(1, 0, 0)
                hrp.Material = Enum.Material.ForceField
            end
        end
    end
end

local window = ui:CreateWindow({
    Title = "UnicoX99夜",
    Size = UDim2.fromOffset(600, 450),
    Theme = "Dark"
})

local mainTab = window:Tab({Title = "主要", Icon = "home"})
local playerTab = window:Tab({Title = "玩家", Icon = "user"})  
local farmTab = window:Tab({Title = "农场", Icon = "zap"})
local itemTab = window:Tab({Title = "物品", Icon = "package"})
local espTab = window:Tab({Title = "透视", Icon = "eye"})
local hitboxTab = window:Tab({Title = "攻击框", Icon = "target"})
local miscTab = window:Tab({Title = "杂项", Icon = "settings"})

mainTab:Toggle({
    Title = "自动喂食",
    Default = false,
    Callback = function(state)
        settings.autoHunger = state
        if state then
            spawn(function()
                local remote = rs.RemoteEvents:FindFirstChild("RequestConsumeItem")
                while settings.autoHunger and remote do
                    pcall(function()
                        remote:InvokeServer(Instance.new("Model"))
                    end)
                    wait(1.5)
                end
            end)
        end
    end
})

mainTab:Button({
    Title = "烹饪所有肉",
    Callback = function()
        local campfire = Vector3.new(1.87, 4.33, -3.67)
        for i,v in pairs(workspace.Items:GetChildren()) do
            if string.find(string.lower(v.Name), "meat") then
                local part = v:FindFirstChildOfClass("BasePart")
                if part then
                    part.CFrame = CFrame.new(campfire + Vector3.new(math.random(-1,1), 1, math.random(-1,1)))
                end
            end
        end
        notify("烹饪", "已将肉移动到篝火")
    end
})

playerTab:Slider({
    Title = "速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(val)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = val
        end
    end
})

playerTab:Slider({
    Title = "跳跃",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = val
        end
    end
})

playerTab:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(state)
        settings.noclipActive = state
        if state then
            spawn(function()
                while settings.noclipActive do
                    if plr.Character then
                        for i,v in pairs(plr.Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                    runService.Heartbeat:Wait()
                end
            end)
        end
    end
})

playerTab:Toggle({
    Title = "上帝模式",
    Default = false,
    Callback = function(state)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            if state then
                plr.Character.Humanoid.MaxHealth = math.huge
                plr.Character.Humanoid.Health = math.huge
            else
                plr.Character.Humanoid.MaxHealth = 100
                plr.Character.Humanoid.Health = 100
            end
        end
    end
})

farmTab:Toggle({
    Title = "自动砍树",
    Default = false,
    Callback = function(state)
        settings.autoFarm = state
        if state then
            spawn(function()
                local toolDamage = rs.RemoteEvents:FindFirstChild("ToolDamageObject")
                while settings.autoFarm do
                    local trees = {}
                    
                    if workspace:FindFirstChild("Map") then
                        local landmarks = workspace.Map:FindFirstChild("Landmarks") or workspace.Map:FindFirstChild("Foliage")
                        if landmarks then
                            for i,v in pairs(landmarks:GetChildren()) do
                                if v.Name == "Small Tree" and v:FindFirstChild("Trunk") then
                                    table.insert(trees, v)
                                end
                            end
                        end
                    end
                    
                    for i,tree in pairs(trees) do
                        if not settings.autoFarm then break end
                        if tree and tree.Parent then
                            local myChar = plr.Character
                            local root = myChar and myChar:FindFirstChild("HumanoidRootPart")
                            if root and tree:FindFirstChild("Trunk") then
                                root.CFrame = tree.Trunk.CFrame * CFrame.new(3, 0, 0)
                                wait(0.3)
                                
                                local axe = nil
                                if plr:FindFirstChild("Inventory") then
                                    axe = plr.Inventory:FindFirstChild("Old Axe") or plr.Inventory:FindFirstChild("Good Axe")
                                end
                                
                                if axe then
                                    if axe.Parent == plr.Backpack then
                                        axe.Parent = myChar
                                        wait(0.2)
                                    end
                                    
                                    while tree.Parent and settings.autoFarm do
                                        pcall(function()
                                            axe:Activate()
                                            if toolDamage then
                                                toolDamage:InvokeServer(tree, axe, "1_8264699301", tree.Trunk.CFrame)
                                            end
                                        end)
                                        wait(0.8)
                                    end
                                end
                            end
                        end
                        wait(0.5)
                    end
                    wait(2)
                end
            end)
        end
    end
})

farmTab:Toggle({
    Title = "自动破坏（看着树）",
    Default = false,
    Callback = function(state)
        settings.autoBreak = state
        if state then
            spawn(function()
                while settings.autoBreak do
                    local weapon = nil
                    if plr:FindFirstChild("Inventory") then
                        weapon = plr.Inventory:FindFirstChild("Old Axe") or 
                                plr.Inventory:FindFirstChild("Good Axe") or
                                plr.Inventory:FindFirstChild("Strong Axe")
                    end
                    
                    if weapon then
                        local ray = workspace:Raycast(cam.CFrame.Position, cam.CFrame.LookVector * 20)
                        if ray and ray.Instance and ray.Instance.Name == "Trunk" then
                            pcall(function()
                                rs.RemoteEvents.ToolDamageObject:InvokeServer(
                                    ray.Instance.Parent, weapon, "4_7591937906", CFrame.new(ray.Position)
                                )
                            end)
                        end
                    end
                    wait(0.5)
                end
            end)
        end
    end
})

local itemList = {
    "Log", "Stone", "Rope", "Nails", "Scrap", "Wood", "Cloth", "Bandage", "Meat",
    "Spear", "Knife", "Revolver", "Rifle", "Ammo", "Coal", "Oil", "Radio"
}

for i,item in pairs(itemList) do
    itemTab:Button({
        Title = "获取 " .. item,
        Callback = function()
            bringItems(item)
            notify("物品", "已带来 " .. item)
        end
    })
end

itemTab:Button({
    Title = "带来所有物品", 
    Callback = function()
        local root = getPlayer()
        if root then
            for i,v in pairs(workspace.Items:GetChildren()) do
                local part = v:FindFirstChildOfClass("BasePart")
                if part then
                    part.CFrame = root.CFrame * CFrame.new(math.random(-8,8), 0, math.random(-8,8))
                end
            end
            notify("物品", "已带来所有物品")
        end
    end
})

espTab:Toggle({
    Title = "玩家透视",
    Default = false,
    Callback = function(state)
        settings.playerEsp = state
        if state then
            spawn(function()
                while settings.playerEsp do
                    for i,player in pairs(game.Players:GetPlayers()) do
                        if player ~= plr and player.Character then
                            if not player.Character:FindFirstChild("Highlight") then
                                makeEsp(player.Character, Color3.new(0, 1, 0), player.Name)
                            end
                        end
                    end
                    wait(1)
                end
                
                for i,player in pairs(game.Players:GetPlayers()) do
                    if player.Character then
                        removeEsp(player.Character)
                    end
                end
            end)
        end
    end
})

espTab:Toggle({
    Title = "物品透视",
    Default = false, 
    Callback = function(state)
        settings.itemEsp = state
        if state then
            spawn(function()
                while settings.itemEsp do
                    for i,item in pairs(workspace.Items:GetChildren()) do
                        if item:IsA("Model") and not item:FindFirstChild("Highlight") then
                            makeEsp(item, Color3.new(1, 1, 0), item.Name)
                        end
                    end
                    wait(2)
                end
                
                for i,item in pairs(workspace.Items:GetChildren()) do
                    removeEsp(item)
                end
            end)
        end
    end
})

hitboxTab:Toggle({
    Title = "狼攻击框",
    Default = false,
    Callback = function(state)
        settings.hitboxes.wolves = state
    end
})

hitboxTab:Toggle({
    Title = "兔子攻击框", 
    Default = false,
    Callback = function(state)
        settings.hitboxes.rabbits = state
    end
})

hitboxTab:Toggle({
    Title = "邪教徒攻击框",
    Default = false,
    Callback = function(state)
        settings.hitboxes.cultists = state
    end
})

hitboxTab:Slider({
    Title = "攻击框大小",
    Min = 5,
    Max = 50,
    Default = 15,
    Callback = function(val)
        settings.hitboxes.size = val
    end
})

hitboxTab:Toggle({
    Title = "显示攻击框",
    Default = false,
    Callback = function(state)
        settings.hitboxes.visible = state
    end
})

miscTab:Toggle({
    Title = "快速交互",
    Default = false,
    Callback = function(state)
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = state and 0 or 0.5
            end
        end
    end
})

miscTab:Button({
    Title = "杀死所有兔子",
    Callback = function()
        for i,v in pairs(workspace.Characters:GetChildren()) do
            if v.Name == "Bunny" and v:FindFirstChild("Humanoid") then
                v.Humanoid.Health = 0
            end
        end
        notify("战斗", "已杀死所有兔子")
    end
})

miscTab:Button({
    Title = "杀死所有狼", 
    Callback = function()
        for i,v in pairs(workspace.Characters:GetChildren()) do
            if v.Name == "Wolf" and v:FindFirstChild("Humanoid") then
                v.Humanoid.Health = 0
            end
        end
        notify("战斗", "已杀死所有狼")
    end
})

miscTab:Button({
    Title = "传送到营地",
    Callback = function()
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(13.287, 3.999, 0.362)
        end
    end
})

spawn(function()
    while true do
        updateHitboxes()
        wait(1)
    end
end)

notify("脚本", "加载成功")
print("脚本已加载 - 玩得开心！")